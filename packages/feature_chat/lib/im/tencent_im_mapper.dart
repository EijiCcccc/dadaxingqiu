import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_image.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';

import '../models/chat_conversation.dart';
import '../models/chat_message.dart';

class TencentImMapper {
  TencentImMapper._();

  static const _imageTypeOrigin = 0;
  static const _imageTypeThumb = 1;
  static const _imageTypeLarge = 2;

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
        type: ChatMessageType.system,
        systemText: isMine ? '你撤回了一条消息' : '${message.nickName ?? '对方'}撤回了一条消息',
      );
    }

    final isMine = message.isSelf == true;
    final sender = isMine ? ChatMessageSender.me : ChatMessageSender.other;

    switch (message.elemType) {
      case MessageElemType.V2TIM_ELEM_TYPE_TEXT:
        final text = message.textElem?.text;
        if (text == null || text.isEmpty) return null;
        return ChatMessage(
          id: msgId,
          sender: sender,
          createdAt: createdAt,
          type: ChatMessageType.text,
          content: text,
        );
      case MessageElemType.V2TIM_ELEM_TYPE_IMAGE:
        final imageElem = message.imageElem;
        if (imageElem == null) return null;
        final image = _pickImage(imageElem.imageList);
        return ChatMessage(
          id: msgId,
          sender: sender,
          createdAt: createdAt,
          type: ChatMessageType.image,
          imageUrl: image?.url ?? image?.localUrl,
          imageLocalPath: imageElem.path ?? image?.localUrl,
          imageWidth: image?.width,
          imageHeight: image?.height,
        );
      case MessageElemType.V2TIM_ELEM_TYPE_SOUND:
        final soundElem = message.soundElem;
        if (soundElem == null) return null;
        return ChatMessage(
          id: msgId,
          sender: sender,
          createdAt: createdAt,
          type: ChatMessageType.voice,
          voiceUrl: soundElem.url,
          voiceLocalPath: soundElem.localUrl ?? soundElem.path,
          voiceDurationSec: soundElem.duration,
        );
      default:
        return null;
    }
  }

  static String _messagePreview(V2TimMessage? message) {
    if (message == null) return '';
    if (message.revokerInfo != null) {
      return message.isSelf == true ? '你撤回了一条消息' : '对方撤回了一条消息';
    }
    switch (message.elemType) {
      case MessageElemType.V2TIM_ELEM_TYPE_TEXT:
        return message.textElem?.text ?? '[消息]';
      case MessageElemType.V2TIM_ELEM_TYPE_IMAGE:
        return '[图片]';
      case MessageElemType.V2TIM_ELEM_TYPE_SOUND:
        return '[语音]';
      default:
        return '[消息]';
    }
  }

  static V2TimImage? _pickImage(List<V2TimImage?>? imageList) {
    if (imageList == null || imageList.isEmpty) return null;
    V2TimImage? thumb;
    V2TimImage? large;
    V2TimImage? origin;
    for (final image in imageList) {
      if (image == null) continue;
      switch (image.type) {
        case _imageTypeThumb:
          thumb = image;
        case _imageTypeLarge:
          large = image;
        case _imageTypeOrigin:
          origin = image;
      }
    }
    return thumb ?? large ?? origin ?? imageList.first;
  }
}
