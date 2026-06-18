import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/chat_message.dart';
import 'chat_message_avatar.dart';

class ChatMessageTextBubble extends StatelessWidget {
  const ChatMessageTextBubble({
    super.key,
    required this.message,
    required this.peerAvatar,
    required this.isMine,
    required this.onLongPress,
  });

  final ChatMessage message;
  final String peerAvatar;
  final bool isMine;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMine) ...[
            ChatMessageAvatar(url: peerAvatar),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: _bubbleDecoration(isMine),
                child: Text(
                  message.content ?? '',
                  style: TextStyle(
                    fontSize: 15,
                    color: isMine ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
          if (isMine) ...[
            const SizedBox(width: 8),
            const ChatMessageAvatar(url: ''),
          ],
        ],
      ),
    );
  }
}

BoxDecoration _bubbleDecoration(bool isMine) {
  return BoxDecoration(
    gradient: isMine
        ? const LinearGradient(
            colors: [AppColors.primaryLight, AppColors.accent],
          )
        : null,
    color: isMine ? null : Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: Radius.circular(isMine ? 12 : 4),
      bottomRight: Radius.circular(isMine ? 4 : 12),
    ),
    border: isMine ? null : Border.all(color: AppColors.borderPurple),
  );
}
