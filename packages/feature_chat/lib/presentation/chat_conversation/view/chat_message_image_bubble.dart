import 'dart:io';

import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../models/chat_message.dart';
import 'chat_message_avatar.dart';

class ChatMessageImageBubble extends StatelessWidget {
  const ChatMessageImageBubble({
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
    final imageWidget = _buildImage();
    final maxWidth = MediaQuery.sizeOf(context).width * 0.55;

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: 220),
                  child: imageWidget,
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

  Widget _buildImage() {
    final localPath = message.imageLocalPath;
    if (localPath != null && localPath.isNotEmpty && File(localPath).existsSync()) {
      return Image.file(File(localPath), fit: BoxFit.cover);
    }
    final url = message.imageUrl;
    if (url != null && url.isNotEmpty) {
      return AppNetworkImage(url: url, fit: BoxFit.cover);
    }
    return Container(
      width: 120,
      height: 120,
      color: AppColors.borderGray,
      alignment: Alignment.center,
      child: const Icon(Icons.image_not_supported_outlined),
    );
  }
}
