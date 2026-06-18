import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../../../models/chat_message.dart';
import '../../../utils/chat_time_formatter.dart';
import 'chat_message_image_bubble.dart';
import 'chat_message_text_bubble.dart';
import 'chat_message_voice_bubble.dart';

class ChatMessageActionMenu extends StatelessWidget {
  const ChatMessageActionMenu({
    super.key,
    required this.message,
    required this.isMine,
    required this.onCopy,
    required this.onRecall,
    required this.onDelete,
    required this.onDismiss,
  });

  final ChatMessage message;
  final bool isMine;
  final VoidCallback onCopy;
  final VoidCallback onRecall;
  final VoidCallback onDelete;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final canCopy = message.type == ChatMessageType.text;
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            behavior: HitTestBehavior.opaque,
            child: const SizedBox.expand(),
          ),
        ),
        Material(
          color: AppColors.textPrimary,
          borderRadius: BorderRadius.circular(12),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (canCopy) _MenuItem(label: '复制', onTap: onCopy),
              if (canCopy && isMine) _divider(),
              if (isMine) ...[
                _MenuItem(label: '撤回', onTap: onRecall),
                _divider(),
                _MenuItem(label: '删除', onTap: onDelete, isDestructive: true),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Divider(height: 1, color: Colors.white.withOpacity(0.12));
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(
          label,
          style: TextStyle(
            color: isDestructive ? Colors.redAccent : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.messages,
    required this.peerAvatar,
    required this.scrollController,
    required this.selectedMessageId,
    required this.onLongPress,
    required this.onCopy,
    required this.onRecall,
    required this.onDelete,
    required this.onDismissMenu,
    required this.onBackgroundTap,
  });

  final List<ChatMessage> messages;
  final String peerAvatar;
  final ScrollController scrollController;
  final String? selectedMessageId;
  final void Function(ChatMessage message) onLongPress;
  final void Function(ChatMessage message) onCopy;
  final void Function(ChatMessage message) onRecall;
  final void Function(ChatMessage message) onDelete;
  final VoidCallback onDismissMenu;
  final VoidCallback onBackgroundTap;

  @override
  Widget build(BuildContext context) {
    DateTime? previousTime;

    return GestureDetector(
      onTap: onBackgroundTap,
      behavior: HitTestBehavior.translucent,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final items = <Widget>[];

          if (!message.isSystem &&
              ChatTimeFormatter.shouldShowMessageTime(
                previousTime,
                message.createdAt,
              )) {
            items.add(
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    ChatTimeFormatter.formatMessageTime(message.createdAt),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),
            );
          }
          if (!message.isSystem) {
            previousTime = message.createdAt;
          }

          final isMine = message.sender == ChatMessageSender.me;
          final isSelected = selectedMessageId == message.id;

          items.add(
            Stack(
              clipBehavior: Clip.none,
              children: [
                _MessageBubble(
                  message: message,
                  peerAvatar: peerAvatar,
                  isMine: isMine,
                  onLongPress: () => onLongPress(message),
                ),
                if (isSelected && !message.isSystem)
                  Positioned(
                    top: -48,
                    left: isMine ? null : 48,
                    right: isMine ? 48 : null,
                    child: ChatMessageActionMenu(
                      message: message,
                      isMine: isMine,
                      onCopy: () => onCopy(message),
                      onRecall: () => onRecall(message),
                      onDelete: () => onDelete(message),
                      onDismiss: onDismissMenu,
                    ),
                  ),
              ],
            ),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items,
          );
        },
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
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
    if (message.isSystem) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.borderGray.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message.systemText ?? '',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ),
      );
    }

    switch (message.type) {
      case ChatMessageType.image:
        return ChatMessageImageBubble(
          message: message,
          peerAvatar: peerAvatar,
          isMine: isMine,
          onLongPress: onLongPress,
        );
      case ChatMessageType.voice:
        return ChatMessageVoiceBubble(
          message: message,
          peerAvatar: peerAvatar,
          isMine: isMine,
          onLongPress: onLongPress,
        );
      case ChatMessageType.text:
      case ChatMessageType.system:
        return ChatMessageTextBubble(
          message: message,
          peerAvatar: peerAvatar,
          isMine: isMine,
          onLongPress: onLongPress,
        );
    }
  }
}

void copyChatMessage(ChatMessage message) {
  if (message.type != ChatMessageType.text) return;
  final text = message.content;
  if (text == null || text.isEmpty) return;
  Clipboard.setData(ClipboardData(text: text));
  AppToast.success('复制成功');
}
