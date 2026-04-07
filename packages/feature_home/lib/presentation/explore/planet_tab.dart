import 'package:core/core.dart';
import 'package:feature_home/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import 'user_card.dart';

/// 主首页「星球」Tab：探索用户卡片（下拉刷新、上拉加载更多）
class PlanetTab extends ConsumerStatefulWidget {
  const PlanetTab({super.key});

  @override
  ConsumerState<PlanetTab> createState() => _PlanetTabState();
}

class _PlanetTabState extends ConsumerState<PlanetTab> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final p = _scrollController.position;
    if (p.maxScrollExtent <= 0) return;
    if (p.pixels >= p.maxScrollExtent - 200) {
      ref.read(userListProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userListAsync = ref.watch(userListProvider);

    return SafeArea(
      bottom: false,
      child: userListAsync.when(
        data: (state) => RefreshIndicator(
          onRefresh: () => ref.read(userListProvider.notifier).refresh(),
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
            const SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '探索星球',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '发现志同道合的星际搭子',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => UserCard(user: state.items[index]),
                    childCount: state.items.length,
                  ),
                ),
              ),
              if (state.isLoadingMore && state.hasMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (err, _) => Center(
          child: AsyncLoadErrorBody(
            message: '加载失败：$err',
            onRetry: () => ref.invalidate(userListProvider),
            padding: const EdgeInsets.all(32),
          ),
        ),
      ),
    );
  }
}
