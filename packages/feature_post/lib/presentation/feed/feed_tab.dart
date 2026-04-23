import 'package:core/core.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import '../../providers/feed_list_provider.dart';
import '../../providers/post_unread_count_provider.dart';
import '../view/post_card.dart';

class FeedTab extends ConsumerStatefulWidget {
  const FeedTab({super.key});

  @override
  ConsumerState<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends ConsumerState<FeedTab>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unreadAsync = ref.watch(postUnreadCountProvider);
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Column(
            children: [
              _FeedHeader(
                controller: _tabController,
                unreadCount: unreadAsync.valueOrNull ?? 0,
                onNotificationsTap: () =>
                    GlobalRouter.instance.push(const PostNotificationsRoute()),
              ),
              Expanded(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  cacheExtent: 1,
                  shouldIgnorePointerWhenScrolling: false,
                  children: const [
                    _FeedListPage(source: FeedSource.friends),
                    _FeedListPage(source: FeedSource.square),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            bottom: 24,
            child: FloatingActionButton(
              onPressed: () =>
                  GlobalRouter.instance.push(const CreatePostRoute()),
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedHeader extends StatelessWidget {
  const _FeedHeader({
    required this.controller,
    required this.unreadCount,
    required this.onNotificationsTap,
  });

  final TabController controller;
  final int unreadCount;
  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: AppCapsuleTabBar(
              controller: controller,
              labels: const ['嗒伴圈', '广场'],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: onNotificationsTap,
                icon: const Icon(
                  Icons.notifications_none,
                  color: AppColors.primaryDark,
                ),
              ),
              if (unreadCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(999)),
                    ),
                    child: Center(
                      child: Text(
                        unreadCount > 99 ? '99+' : '$unreadCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeedListPage extends ConsumerWidget {
  const _FeedListPage({required this.source});

  final FeedSource source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(feedListProvider(source));
    return RefreshIndicator(
      onRefresh: () => ref.read(feedListProvider(source).notifier).refresh(),
      child: listAsync.when(
        data: (state) => NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis != Axis.vertical) {
              return false;
            }
            if (notification.metrics.maxScrollExtent <= 0) {
              return false;
            }
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent - 240) {
              ref.read(feedListProvider(source).notifier).loadMore();
            }
            return false;
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                sliver: state.items.isEmpty
                    ? const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            '暂无动态',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ),
                      )
                    : SliverList.separated(
                        itemBuilder: (context, index) {
                          final post = state.items[index];
                          return PostCard(
                            post: post,
                            onTap: () => GlobalRouter.instance.push(
                              FeedDetailRoute(postId: post.postId.toString()),
                            ),
                            onLike: () => ref
                                .read(feedListProvider(source).notifier)
                                .toggleLike(post),
                            onComment: () => GlobalRouter.instance.push(
                              FeedDetailRoute(postId: post.postId.toString()),
                            ),
                            onPrimaryAction: () {
                              ref
                                  .read(feedListProvider(source).notifier)
                                  .toggleFollow(post);
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 0),
                        itemCount: state.items.length,
                      ),
              ),
              if (state.isLoadingMore && state.hasMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 120),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: AsyncLoadErrorBody(
            message: '加载动态失败：$error',
            onRetry: () => ref.invalidate(feedListProvider(source)),
            padding: const EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }
}
