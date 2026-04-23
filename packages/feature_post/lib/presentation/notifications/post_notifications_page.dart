import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../../providers/post_notifications_provider.dart';
import '../post_display.dart';

class PostNotificationsPage extends ConsumerStatefulWidget {
  const PostNotificationsPage({super.key});

  @override
  ConsumerState<PostNotificationsPage> createState() =>
      _PostNotificationsPageState();
}

class _PostNotificationsPageState
    extends ConsumerState<PostNotificationsPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.maxScrollExtent <= 0) return;
    if (position.pixels >= position.maxScrollExtent - 180) {
      ref.read(postNotificationsProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(postNotificationsProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackgroundWidget(
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              _NotificationsAppBar(
                onBack: () => GlobalRouter.instance.pop(),
              ),
              Expanded(
                child: asyncValue.when(
                  data: (state) => RefreshIndicator(
                    onRefresh: () => ref
                        .read(postNotificationsProvider.notifier)
                        .refresh(),
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return _NotificationTile(
                          item: item,
                          onTap: () => GlobalRouter.instance.push(
                            FeedDetailRoute(postId: item.postId.toString()),
                          ),
                          onPrimaryAction: () {
                            if (item.actor.isFollowing) {
                              GlobalRouter.instance.push(
                                ChatRoute(userId: item.actor.userId.toString()),
                              );
                              return;
                            }
                            ref
                                .read(postNotificationsProvider.notifier)
                                .toggleFollow(item);
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: state.items.length,
                    ),
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(
                    child: AsyncLoadErrorBody(
                      message: '动态消息加载失败：$error',
                      onRetry: () => ref.invalidate(postNotificationsProvider),
                      padding: const EdgeInsets.all(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationsAppBar extends StatelessWidget {
  const _NotificationsAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.85),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
          ),
          const Expanded(
            child: Text(
              '动态消息',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.item,
    required this.onTap,
    required this.onPrimaryAction,
  });

  final PostNotificationItem item;
  final VoidCallback onTap;
  final VoidCallback onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    final actor = item.actor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item.isRead
              ? Colors.white.withOpacity(0.72)
              : Colors.white.withOpacity(0.92),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: item.isRead
                ? AppColors.borderPurple.withOpacity(0.35)
                : AppColors.primaryLight.withOpacity(0.35),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: postAuthorAvatar(actor).isNotEmpty
                      ? NetworkImage(postAuthorAvatar(actor))
                      : null,
                  child:
                      postAuthorAvatar(actor).isEmpty ? const Icon(Icons.person) : null,
                ),
                if (!item.isRead)
                  const Positioned(
                    right: -1,
                    top: -1,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          postAuthorName(actor),
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        postNotificationLabel(item.type),
                        style: const TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    postTimeAgo(item.createdAt.toInt()),
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  if (item.previewText.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      item.previewText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  FilledButton.tonal(
                    onPressed: onPrimaryAction,
                    child: Text(actor.isFollowing ? '私聊感谢' : '回关'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _PreviewBox(item: item),
          ],
        ),
      ),
    );
  }
}

class _PreviewBox extends StatelessWidget {
  const _PreviewBox({required this.item});

  final PostNotificationItem item;

  @override
  Widget build(BuildContext context) {
    final hasImage = item.previewThumbUrl.isNotEmpty;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 64,
        height: 64,
        color: AppColors.tagBgGray,
        child: hasImage
            ? Image.network(item.previewThumbUrl, fit: BoxFit.cover)
            : Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.previewText.isEmpty ? '动态' : item.previewText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    height: 1.3,
                  ),
                ),
              ),
      ),
    );
  }
}
