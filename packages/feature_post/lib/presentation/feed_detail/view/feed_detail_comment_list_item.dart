import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

import '../../post_display.dart';

class FeedDetailCommentListItem extends StatelessWidget {
  const FeedDetailCommentListItem({
    super.key,
    required this.comment,
    required this.onTap,
    required this.onLongPress,
  });

  final PostCommentItem comment;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: postAuthorAvatar(comment.author).isNotEmpty
                ? NetworkImage(postAuthorAvatar(comment.author))
                : null,
            child: postAuthorAvatar(comment.author).isEmpty
                ? const Icon(Icons.person, size: 18)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  postAuthorName(comment.author),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _commentContent(comment),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  postTimeAgo(comment.createdAt.toInt()),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _commentContent(PostCommentItem comment) {
  if (comment.replyToUserId <= 0) return comment.content;
  return '回复 ${comment.author.nickname}: ${comment.content}';
}
