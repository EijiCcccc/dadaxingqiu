import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FeedDetailActionStats extends StatelessWidget {
  const FeedDetailActionStats({
    Key? key,
    required this.likeCount,
    required this.commentCount,
    required this.liked,
    required this.onLikeTap,
    required this.onCommentTap,
  }) : super(key: key);

  final String likeCount;
  final String commentCount;
  final bool liked;
  final VoidCallback onLikeTap;
  final VoidCallback onCommentTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        InkWell(
          onTap: onLikeTap,
          child: Row(
            children: [
              Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.redAccent : AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(likeCount),
            ],
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: onCommentTap,
          child: Row(
            children: [
              const Icon(
                Icons.mode_comment_outlined,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(commentCount),
            ],
          ),
        ),
      ],
    );
  }
}
