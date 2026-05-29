import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'feed_detail_action_stats.dart';
import 'feed_detail_comment_input.dart';

class FeedDetailInputRow extends StatelessWidget {
  const FeedDetailInputRow({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.replyToNickname,
    required this.isExpanded,
    required this.showEmojiPanel,
    required this.likeCount,
    required this.commentCount,
    required this.liked,
    required this.isSending,
    required this.onLikeTap,
    required this.onCommentTap,
    required this.onEmojiToggle,
    required this.onSend,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? replyToNickname;
  final bool isExpanded;
  final bool showEmojiPanel;
  final String likeCount;
  final String commentCount;
  final bool liked;
  final bool isSending;
  final VoidCallback onLikeTap;
  final VoidCallback onCommentTap;
  final VoidCallback onEmojiToggle;
  final Future<void> Function() onSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeedDetailCommentInput(
            controller: controller,
            focusNode: focusNode,
            replyToNickname: replyToNickname,
            showEmojiPanel: showEmojiPanel,
            onCommentTap: onCommentTap,
            onEmojiToggle: onEmojiToggle,
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: isSending ? null : () => onSend(),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: const Size(76, 36),
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppColors.primary.withOpacity( 0.5),
          ),
          child: isSending
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('发送'),
        ),
        if (!isExpanded)
          FeedDetailActionStats(
            likeCount: likeCount,
            commentCount: commentCount,
            liked: liked,
            onLikeTap: onLikeTap,
            onCommentTap: onCommentTap,
          ),
      ],
    );
  }
}
