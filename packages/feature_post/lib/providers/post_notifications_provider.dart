import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import 'post_repository_provider.dart';
import 'post_unread_count_provider.dart';

class PostNotificationsState {
  const PostNotificationsState({
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.nextPage = 2,
  });

  final List<PostNotificationItem> items;
  final bool hasMore;
  final bool isLoadingMore;
  final int nextPage;

  PostNotificationsState copyWith({
    List<PostNotificationItem>? items,
    bool? hasMore,
    bool? isLoadingMore,
    int? nextPage,
  }) {
    return PostNotificationsState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextPage: nextPage ?? this.nextPage,
    );
  }
}

final postNotificationsProvider = AsyncNotifierProvider.autoDispose<
    PostNotificationsNotifier, PostNotificationsState>(
  PostNotificationsNotifier.new,
);

class PostNotificationsNotifier
    extends AutoDisposeAsyncNotifier<PostNotificationsState> {
  static const _pageSize = 20;

  @override
  Future<PostNotificationsState> build() async {
    final state = await _loadFirstPage();
    await markAllRead();
    return state;
  }

  Future<PostNotificationsState> _loadFirstPage() async {
    final repo = ref.read(postRepositoryProvider);
    final response = await repo.getNotifications(page: 1, pageSize: _pageSize);
    return PostNotificationsState(
      items: response.items.toList(),
      hasMore: response.hasMore,
      nextPage: 2,
    );
  }

  Future<void> refresh() async {
    state = AsyncData(await _loadFirstPage());
    await markAllRead();
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final repo = ref.read(postRepositoryProvider);
      final response =
          await repo.getNotifications(page: current.nextPage, pageSize: _pageSize);
      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...response.items],
          hasMore: response.hasMore,
          isLoadingMore: false,
          nextPage: current.nextPage + 1,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> markAllRead() async {
    try {
      final response = await ref.read(postRepositoryProvider).markNotificationsRead();
      ref.read(postUnreadCountProvider.notifier).setCount(response.unreadCount.toInt());
      final current = state.valueOrNull;
      if (current == null) return;
      final updated = current.items
          .map(
            (item) => item.clone()
              ..isRead = true
              ..readAt = item.readAt,
          )
          .toList();
      state = AsyncData(current.copyWith(items: updated));
    } catch (_) {
      // 保持当前列表展示
    }
  }

  Future<void> toggleFollow(PostNotificationItem item) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final index =
        current.items.indexWhere((notification) => notification.notificationId == item.notificationId);
    if (index == -1) return;

    final author = item.actor;
    final optimisticActor = author.clone()
      ..isFollowing = !author.isFollowing
      ..isMutualFollow = !author.isFollowing && author.isFollowedBy;
    final optimistic = item.clone()..actor = optimisticActor;
    final items = [...current.items]..[index] = optimistic;
    state = AsyncData(current.copyWith(items: items));

    try {
      final repo = ref.read(postRepositoryProvider);
      final relation = author.isFollowing
          ? (await repo.unfollowUser(author.userId.toString())).relation
          : (await repo.followUser(author.userId.toString())).relation;
      items[index] = optimistic.clone()
        ..actor = (optimistic.actor.clone()
          ..isFollowing = relation.isFollowing
          ..isFollowedBy = relation.isFollowedByTargetUser
          ..isMutualFollow = relation.isMutualFollow);
      state = AsyncData(current.copyWith(items: [...items]));
    } catch (_) {
      state = AsyncData(current.copyWith(items: [...current.items]));
    }
  }
}
