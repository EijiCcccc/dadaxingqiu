import 'package:feature_home/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 探索星球用户列表分页状态
class UserExploreListState {
  const UserExploreListState({
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.nextPage = 2,
  });

  final List<ExploreCard> items;
  final bool hasMore;
  final bool isLoadingMore;
  final int nextPage;

  UserExploreListState copyWith({
    List<ExploreCard>? items,
    bool? hasMore,
    bool? isLoadingMore,
    int? nextPage,
  }) {
    return UserExploreListState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextPage: nextPage ?? this.nextPage,
    );
  }
}

/// 探索星球用户列表：首屏加载、下拉刷新、上拉加载更多
final userListProvider =
    AsyncNotifierProvider.autoDispose<UserExploreListNotifier, UserExploreListState>(
  () => UserExploreListNotifier(),
);

class UserExploreListNotifier extends AutoDisposeAsyncNotifier<UserExploreListState> {
  static const _pageSize = 20;

  @override
  Future<UserExploreListState> build() async {
    return _loadFirstPage();
  }

  Future<UserExploreListState> _loadFirstPage() async {
    final repo = ref.read(userRepositoryProvider);
    try {
      final res = await repo.getExploreCards(page: 1, pageSize: _pageSize);
      return UserExploreListState(
        items: res.items.toList(),
        hasMore: res.hasMore,
        nextPage: 2,
      );
    } catch (_) {
      return const UserExploreListState(items: [], hasMore: false, nextPage: 2);
    }
  }

  /// 下拉刷新：重新拉取第一页（不进入全页 loading，保留旧数据直至返回）
  Future<void> refresh() async {
    state = AsyncData(await _loadFirstPage());
  }

  /// 滚动接近底部时加载下一页
  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final repo = ref.read(userRepositoryProvider);
      final res =
          await repo.getExploreCards(page: current.nextPage, pageSize: _pageSize);
      state = AsyncData(
        UserExploreListState(
          items: [...current.items, ...res.items],
          hasMore: res.hasMore,
          nextPage: current.nextPage + 1,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}
