import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import '../feed_detail_composer_provider.dart';
import '../feed_detail_provider.dart';
import '../feed_detail_state.dart';
import 'feed_detail_comment_list.dart';
import 'feed_detail_like_list.dart';
import 'feed_detail_tab_bar_header_delegate.dart';

class FeedDetailBodySection extends ConsumerWidget {
  const FeedDetailBodySection({
    super.key,
    required this.postId,
    required this.state,
    required this.header,
    required this.onDismissCommentInput,
    required this.onFocusCommentInput,
  });

  final String postId;
  final PostDetailState state;
  final Widget header;
  final VoidCallback onDismissCommentInput;
  final VoidCallback onFocusCommentInput;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailNotifier = ref.read(feedDetailProvider(postId).notifier);
    return RefreshIndicator(
      onRefresh: detailNotifier.refresh,
      notificationPredicate: _shouldHandleRefreshNotification,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onDismissCommentInput,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _handleScrollNotification(notification, onDismissCommentInput),
          child: NestedScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (_, __) => [
              SliverToBoxAdapter(child: header),
              const SliverToBoxAdapter(
                  child: Divider(color: AppColors.lineColor, thickness:1)),
              const SliverPersistentHeader(
                pinned: true,
                delegate: FeedDetailTabBarHeaderDelegate(),
              ),
            ],
            body: TabBarView(
              children: [
                FeedDetailCommentList(
                  comments: state.comments,
                  onListTap: onDismissCommentInput,
                  onReply: (comment) {
                    ref
                        .read(feedDetailComposerProvider(postId).notifier)
                        .setReplyTarget(comment);
                    onFocusCommentInput();
                  },
                  onDelete: (comment) => detailNotifier
                      .deleteComment(comment.commentId.toString()),
                ),
                FeedDetailLikeList(
                  likes: state.likes,
                  onListTap: onDismissCommentInput,
                  onPrimaryAction: (user) =>
                      _handleLikePrimaryAction(ref, postId, user),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool _handleScrollNotification(
    ScrollNotification notification, VoidCallback onDismissCommentInput) {
  if (notification is ScrollStartNotification ||
      notification is ScrollUpdateNotification ||
      notification is UserScrollNotification) {
    onDismissCommentInput();
  }
  return false;
}

bool _shouldHandleRefreshNotification(ScrollNotification notification) {
  return notification.depth == 2 && notification.metrics.axis == Axis.vertical;
}

void _handleLikePrimaryAction(
    WidgetRef ref, String postId, PostAuthorRelation user) {
  if (user.isFollowing) {
    GlobalRouter.instance.push(ChatRoute(userId: user.userId));
    return;
  }
  // ref.read(feedDetailProvider(postId).notifier).toggleFollowUser(
  //       user.userId.toString(),
  //     );
}
