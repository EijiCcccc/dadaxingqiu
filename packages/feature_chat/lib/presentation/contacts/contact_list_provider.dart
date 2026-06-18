import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import '../../providers/contact_repository_provider.dart';

enum ContactListType {
  friends,
  following,
  followers,
}

class ContactListState {
  const ContactListState({
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.nextPage = 2,
  });

  final List<ContactUserItem> items;
  final bool hasMore;
  final bool isLoadingMore;
  final int nextPage;

  ContactListState copyWith({
    List<ContactUserItem>? items,
    bool? hasMore,
    bool? isLoadingMore,
    int? nextPage,
  }) {
    return ContactListState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextPage: nextPage ?? this.nextPage,
    );
  }
}

final contactListProvider = AsyncNotifierProvider.autoDispose
    .family<ContactListNotifier, ContactListState, ContactListType>(
  ContactListNotifier.new,
);

class ContactListNotifier
    extends AutoDisposeFamilyAsyncNotifier<ContactListState, ContactListType> {
  static const _pageSize = 20;

  @override
  Future<ContactListState> build(ContactListType type) => _loadFirstPage();

  Future<ContactListState> _loadFirstPage() async {
    final repo = ref.read(contactRepositoryProvider);
    switch (arg) {
      case ContactListType.friends:
        final response =
            await repo.getFriends(page: 1, pageSize: _pageSize);
        return ContactListState(
          items: response.items.toList(),
          hasMore: response.hasMore,
        );
      case ContactListType.following:
        final response =
            await repo.getFollowing(page: 1, pageSize: _pageSize);
        return ContactListState(
          items: response.items.toList(),
          hasMore: response.hasMore,
        );
      case ContactListType.followers:
        final response =
            await repo.getFollowers(page: 1, pageSize: _pageSize);
        return ContactListState(
          items: response.items.toList(),
          hasMore: response.hasMore,
        );
    }
  }

  Future<void> refresh() async {
    state = AsyncData(await _loadFirstPage());
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) {
      return;
    }

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final repo = ref.read(contactRepositoryProvider);
      final List<ContactUserItem> newItems;
      final bool hasMore;

      switch (arg) {
        case ContactListType.friends:
          final response = await repo.getFriends(
            page: current.nextPage,
            pageSize: _pageSize,
          );
          newItems = response.items.toList();
          hasMore = response.hasMore;
        case ContactListType.following:
          final response = await repo.getFollowing(
            page: current.nextPage,
            pageSize: _pageSize,
          );
          newItems = response.items.toList();
          hasMore = response.hasMore;
        case ContactListType.followers:
          final response = await repo.getFollowers(
            page: current.nextPage,
            pageSize: _pageSize,
          );
          newItems = response.items.toList();
          hasMore = response.hasMore;
      }

      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...newItems],
          hasMore: hasMore,
          nextPage: current.nextPage + 1,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}
