import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import 'post_repository_provider.dart';

enum FeedSource { friends, square }

class PostFeedListState {
  const PostFeedListState({
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.nextPage = 2,
  });

  final List<PostItem> items;
  final bool hasMore;
  final bool isLoadingMore;
  final int nextPage;

  PostFeedListState copyWith({
    List<PostItem>? items,
    bool? hasMore,
    bool? isLoadingMore,
    int? nextPage,
  }) {
    return PostFeedListState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextPage: nextPage ?? this.nextPage,
    );
  }
}

final feedListProvider = AsyncNotifierProvider.autoDispose
    .family<FeedListNotifier, PostFeedListState, FeedSource>(
  FeedListNotifier.new,
);

class FeedListNotifier
    extends AutoDisposeFamilyAsyncNotifier<PostFeedListState, FeedSource> {
  static const _pageSize = 20;

  @override
  Future<PostFeedListState> build(FeedSource arg) async {
    return _loadFirstPage(arg);
  }

  Future<PostFeedListState> _loadFirstPage(FeedSource source) async {
    final repo = ref.read(postRepositoryProvider);
    switch (source) {
      case FeedSource.friends:
        final response = await repo.getFriendPosts(page: 1, pageSize: _pageSize);
        return PostFeedListState(
          items: response.items.toList(),
          hasMore: response.hasMore,
          nextPage: 2,
        );
      case FeedSource.square:
        final response = await repo.getSquarePosts(page: 1, pageSize: _pageSize);
        return PostFeedListState(
          items: response.items.toList(),
          hasMore: response.hasMore,
          nextPage: 2,
        );
    }
  }

  Future<void> refresh() async {
    state = AsyncData(await _loadFirstPage(arg));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final repo = ref.read(postRepositoryProvider);
      late final List<PostItem> newItems;
      late final bool hasMore;
      if (arg == FeedSource.friends) {
        final response =
            await repo.getFriendPosts(page: current.nextPage, pageSize: _pageSize);
        newItems = response.items.toList();
        hasMore = response.hasMore;
      } else {
        final response =
            await repo.getSquarePosts(page: current.nextPage, pageSize: _pageSize);
        newItems = response.items.toList();
        hasMore = response.hasMore;
      }
      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...newItems],
          hasMore: hasMore,
          isLoadingMore: false,
          nextPage: current.nextPage + 1,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> toggleLike(PostItem item) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final index = current.items.indexWhere((post) => post.postId == item.postId);
    if (index == -1) return;

    final optimistic = _copyPost(
      current.items[index],
      isLikedByMe: !item.isLikedByMe,
      likeCount:
          item.isLikedByMe ? item.likeCount - 1 : item.likeCount + 1,
    );
    final updatedItems = [...current.items]..[index] = optimistic;
    state = AsyncData(current.copyWith(items: updatedItems));

    try {
      final repo = ref.read(postRepositoryProvider);
      if (item.isLikedByMe) {
        final response = await repo.unlikePost(item.postId.toString());
        updatedItems[index] = _copyPost(
          optimistic,
          isLikedByMe: response.isLiked,
          likeCount: response.likeCount,
        );
      } else {
        final response = await repo.likePost(item.postId.toString());
        updatedItems[index] = _copyPost(
          optimistic,
          isLikedByMe: response.isLiked,
          likeCount: response.likeCount,
        );
      }
      state = AsyncData(current.copyWith(items: [...updatedItems]));
    } catch (_) {
      final rollbackItems = [...current.items];
      state = AsyncData(current.copyWith(items: rollbackItems));
    }
  }

  Future<void> toggleFollow(PostItem item) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final index = current.items.indexWhere((post) => post.postId == item.postId);
    if (index == -1) return;

    final author = current.items[index].author;
    final optimisticAuthor = _copyAuthor(
      author,
      isFollowing: !author.isFollowing,
      isMutualFollow: !author.isFollowing && author.isFollowedBy,
    );
    final optimistic = _copyPost(current.items[index], author: optimisticAuthor);
    final updatedItems = [...current.items]..[index] = optimistic;
    state = AsyncData(current.copyWith(items: updatedItems));

    try {
      final repo = ref.read(postRepositoryProvider);
      final relation = author.isFollowing
          ? (await repo.unfollowUser(author.userId.toString())).relation
          : (await repo.followUser(author.userId.toString())).relation;
      final syncedAuthor = _copyAuthor(
        optimisticAuthor,
        isFollowing: relation.isFollowing,
        isFollowedBy: relation.isFollowedByTargetUser,
        isMutualFollow: relation.isMutualFollow,
      );
      updatedItems[index] = _copyPost(optimistic, author: syncedAuthor);
      state = AsyncData(current.copyWith(items: [...updatedItems]));
    } catch (_) {
      state = AsyncData(current.copyWith(items: [...current.items]));
    }
  }

  PostItem _copyPost(
    PostItem post, {
    PostAuthorRelation? author,
    Int64? likeCount,
    Int64? commentCount,
    bool? isLikedByMe,
  }) {
    return post.clone()
      ..author = author ?? post.author.clone()
      ..likeCount = likeCount ?? post.likeCount
      ..commentCount = commentCount ?? post.commentCount
      ..isLikedByMe = isLikedByMe ?? post.isLikedByMe;
  }

  PostAuthorRelation _copyAuthor(
    PostAuthorRelation author, {
    bool? isFollowing,
    bool? isFollowedBy,
    bool? isMutualFollow,
  }) {
    return author.clone()
      ..isFollowing = isFollowing ?? author.isFollowing
      ..isFollowedBy = isFollowedBy ?? author.isFollowedBy
      ..isMutualFollow = isMutualFollow ?? author.isMutualFollow;
  }
}
