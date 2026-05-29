import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../../../models/chat_message.dart';
import '../../../utils/chat_time_formatter.dart';

class ChatMessageActionMenu extends StatelessWidget {
  const ChatMessageActionMenu({
    super.key,
    required this.isMine,
    required this.onCopy,
    required this.onRecall,
    required this.onDelete,
    required this.onDismiss,
  });

  final bool isMine;
  final VoidCallback onCopy;
  final VoidCallback onRecall;
  final VoidCallback onDelete;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
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
              _MenuItem(label: '复制', onTap: onCopy),
              if (isMine) ...[
                _divider(),
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
    return Divider(
      height: 1,
      color: Colors.white.withOpacity(0.12),
    );
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

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return const CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.borderGray,
        child: Icon(Icons.person, color: AppColors.textMuted, size: 20),
      );
    }
    return CircleAvatar(radius: 20, backgroundImage: NetworkImage(url));
  }
}

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
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
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    final avatar = isMine ? '' : peerAvatar;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMine) ...[
            _ChatAvatar(url: avatar),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
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
                  border:
                      isMine ? null : Border.all(color: AppColors.borderPurple),
                ),
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
            _ChatAvatar(url: avatar),
          ],
        ],
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

  @override
  Widget build(BuildContext context) {
    DateTime? previousTime;

    return ListView.builder(
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
              ChatMessageBubble(
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
    );
  }
}

void copyChatMessage(ChatMessage message) {
  final text = message.content;
  if (text == null || text.isEmpty) return;
  Clipboard.setData(ClipboardData(text: text));
  AppToast.success('复制成功');
}
