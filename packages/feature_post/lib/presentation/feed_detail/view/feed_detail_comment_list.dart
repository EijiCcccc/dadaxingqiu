import 'package:flutter/material.dart';
import 'package:network/network.dart';

import 'feed_detail_comment_list_item.dart';

class FeedDetailCommentList extends StatelessWidget {
  const FeedDetailCommentList({
    Key? key,
    required this.comments,
    required this.onListTap,
    required this.onReply,
    required this.onDelete,
  }) : super(key: key);

  final List<PostCommentItem> comments;
  final VoidCallback onListTap;
  final ValueChanged<PostCommentItem> onReply;
  final ValueChanged<PostCommentItem> onDelete;

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onListTap,
              child: const Center(child: Text('还没有评论，来抢沙发吧')),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemCount: comments.length,
      itemBuilder: (context, index) => FeedDetailCommentListItem(
        comment: comments[index],
        onTap: () {
          onListTap();
          onReply(comments[index]);
        },
        onLongPress: () => onDelete(comments[index]),
      ),
      separatorBuilder: (_, __) => const Divider(
        height: 24,
        color: Colors.transparent,
      ),
    );
  }
}
