import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';

import '../models/chat_conversation.dart';
import '../models/chat_message.dart';

class TencentImMapper {
  TencentImMapper._();

  static String c2cConversationId(String userId) => 'c2c_$userId';

  static ChatConversation toConversation(V2TimConversation conversation) {
    final userId = conversation.userID ?? '';
    final lastMessage = conversation.lastMessage;
    final lastText = _messagePreview(lastMessage);
    final lastAt = lastMessage?.timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(lastMessage!.timestamp! * 1000)
        : DateTime.now();

    return ChatConversation(
      userId: userId,
      username: conversation.showName?.isNotEmpty == true
          ? conversation.showName!
          : '用户$userId',
      avatar: conversation.faceUrl ?? '',
      lastMessage: lastText,
      lastMessageAt: lastAt,
      hasUnread: (conversation.unreadCount ?? 0) > 0,
    );
  }

  static ChatMessage? toChatMessage(
    V2TimMessage message, {
    required String currentUserId,
  }) {
    final msgId = message.msgID ?? message.id ?? '';
    if (msgId.isEmpty) return null;

    final createdAt = message.timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(message.timestamp! * 1000)
        : DateTime.now();

    if (message.revokerInfo != null) {
      final isMine = message.isSelf == true;
      return ChatMessage(
        id: msgId,
        sender: ChatMessageSender.system,
        createdAt: createdAt,
        systemText: isMine ? '你撤回了一条消息' : '${message.nickName ?? '对方'}撤回了一条消息',
      );
    }

    final text = _messageText(message);
    if (text == null) return null;

    final isMine = message.isSelf == true;

    return ChatMessage(
      id: msgId,
      sender: isMine ? ChatMessageSender.me : ChatMessageSender.other,
      createdAt: createdAt,
      content: text,
    );
  }

  static String _messagePreview(V2TimMessage? message) {
    if (message == null) return '';
    if (message.revokerInfo != null) {
      return message.isSelf == true ? '你撤回了一条消息' : '对方撤回了一条消息';
    }
    return _messageText(message) ?? '[消息]';
  }

  static String? _messageText(V2TimMessage message) {
    if (message.elemType == MessageElemType.V2TIM_ELEM_TYPE_TEXT) {
      return message.textElem?.text;
    }
    return null;
  }
}
