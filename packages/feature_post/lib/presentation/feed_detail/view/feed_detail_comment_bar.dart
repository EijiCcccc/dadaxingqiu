import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'feed_detail_emoji_panel.dart';
import 'feed_detail_input_row.dart';
import 'feed_detail_reply_banner.dart';

class FeedDetailCommentBar extends StatelessWidget {
  const FeedDetailCommentBar({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.replyToNickname,
    required this.isExpanded,
    required this.showEmojiPanel,
    required this.emojis,
    required this.likeCount,
    required this.commentCount,
    required this.liked,
    required this.isSending,
    required this.onCancelReply,
    required this.onLikeTap,
    required this.onCommentTap,
    required this.onEmojiToggle,
    required this.onEmojiSelected,
    required this.onSend,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? replyToNickname;
  final bool isExpanded;
  final bool showEmojiPanel;
  final List<String> emojis;
  final String likeCount;
  final String commentCount;
  final bool liked;
  final bool isSending;
  final VoidCallback onCancelReply;
  final VoidCallback onLikeTap;
  final VoidCallback onCommentTap;
  final VoidCallback onEmojiToggle;
  final ValueChanged<String> onEmojiSelected;
  final Future<void> Function() onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity( 0.95),
        border: Border(
          top: BorderSide(
            color: AppColors.borderPurple.withOpacity( 0.5),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (replyToNickname != null)
            FeedDetailReplyBanner(
              nickname: replyToNickname!,
              onCancel: onCancelReply,
            ),
          FeedDetailInputRow(
            controller: controller,
            focusNode: focusNode,
            replyToNickname: replyToNickname,
            isExpanded: isExpanded,
            showEmojiPanel: showEmojiPanel,
            likeCount: likeCount,
            commentCount: commentCount,
            liked: liked,
            isSending: isSending,
            onLikeTap: onLikeTap,
            onCommentTap: onCommentTap,
            onEmojiToggle: onEmojiToggle,
            onSend: onSend,
          ),
          if (showEmojiPanel)
            FeedDetailEmojiPanel(emojis: emojis, onSelect: onEmojiSelected),
        ],
      ),
    );
  }
}
