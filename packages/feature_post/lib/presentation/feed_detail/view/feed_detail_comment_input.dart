import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FeedDetailCommentInput extends StatelessWidget {
  const FeedDetailCommentInput({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.replyToNickname,
    required this.showEmojiPanel,
    required this.onCommentTap,
    required this.onEmojiToggle,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? replyToNickname;
  final bool showEmojiPanel;
  final VoidCallback onCommentTap;
  final VoidCallback onEmojiToggle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: const TextStyle(color: Colors.black),
          onTap: onCommentTap,
          onTapOutside: (_) => focusNode.unfocus(),
          decoration: InputDecoration(
            hintText: replyToNickname == null ? '说点什么...' : '回复内容',
            hintStyle: const TextStyle(color: Colors.black54),
            filled: true,
            fillColor: AppColors.tagBgGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(999),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        Positioned(
          right: 10,
          child: InkWell(
            onTap: onEmojiToggle,
            child: Icon(
              showEmojiPanel
                  ? Icons.keyboard_alt_outlined
                  : Icons.emoji_emotions_outlined,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
