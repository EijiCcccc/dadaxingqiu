import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/chat_conversation.dart';
import '../../../utils/chat_time_formatter.dart';

class MessageConversationListItem extends StatefulWidget {
  const MessageConversationListItem({
    super.key,
    required this.conversation,
    required this.onTap,
    required this.onDelete,
  });

  final ChatConversation conversation;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  static const _deleteWidth = 80.0;

  @override
  State<MessageConversationListItem> createState() =>
      _MessageConversationListItemState();
}

class _MessageConversationListItemState
    extends State<MessageConversationListItem> {
  double _dragOffset = 0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dx)
          .clamp(-MessageConversationListItem._deleteWidth, 0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      _dragOffset = _dragOffset <= -40
          ? -MessageConversationListItem._deleteWidth
          : 0;
    });
  }

  void _resetSwipe() {
    if (_dragOffset != 0) {
      setState(() => _dragOffset = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final conversation = widget.conversation;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        border: Border(
          bottom: BorderSide(color: AppColors.bgPurple100.withOpacity(0.5)),
        ),
      ),
      child: ClipRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MessageConversationListItem._deleteWidth,
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: widget.onDelete,
                      child: const Center(
                        child: Text(
                          '删除',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onHorizontalDragUpdate: _onHorizontalDragUpdate,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              onTap: () {
                _resetSwipe();
                widget.onTap();
              },
              child: Transform.translate(
                offset: Offset(_dragOffset, 0),
                child: ColoredBox(
                  color: Colors.white.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        _buildAvatar(conversation),
                        const SizedBox(width: 12),
                        Expanded(child: _buildContent(conversation)),
                        const SizedBox(width: 8),
                        Text(
                          ChatTimeFormatter.formatListTime(
                            conversation.lastMessageAt,
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(ChatConversation conversation) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(conversation.avatar),
        ),
        if (conversation.hasUnread)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(ChatConversation conversation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conversation.username,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          conversation.lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
