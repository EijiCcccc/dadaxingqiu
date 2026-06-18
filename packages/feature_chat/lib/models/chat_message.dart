enum ChatMessageSender { me, other, system }

enum ChatMessageType { text, image, voice, system }

/// 单条聊天消息
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.sender,
    required this.createdAt,
    this.type = ChatMessageType.text,
    this.content,
    this.imageUrl,
    this.imageLocalPath,
    this.imageWidth,
    this.imageHeight,
    this.voiceUrl,
    this.voiceLocalPath,
    this.voiceDurationSec,
    this.isRecalled = false,
    this.isDeletedForMe = false,
    this.systemText,
  });

  final String id;
  final ChatMessageSender sender;
  final DateTime createdAt;
  final ChatMessageType type;
  final String? content;
  final String? imageUrl;
  final String? imageLocalPath;
  final int? imageWidth;
  final int? imageHeight;
  final String? voiceUrl;
  final String? voiceLocalPath;
  final int? voiceDurationSec;
  final bool isRecalled;
  final bool isDeletedForMe;
  final String? systemText;

  bool get isSystem => sender == ChatMessageSender.system;

  ChatMessage copyWith({
    String? id,
    ChatMessageSender? sender,
    DateTime? createdAt,
    ChatMessageType? type,
    String? content,
    String? imageUrl,
    String? imageLocalPath,
    int? imageWidth,
    int? imageHeight,
    String? voiceUrl,
    String? voiceLocalPath,
    int? voiceDurationSec,
    bool? isRecalled,
    bool? isDeletedForMe,
    String? systemText,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      imageLocalPath: imageLocalPath ?? this.imageLocalPath,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      voiceUrl: voiceUrl ?? this.voiceUrl,
      voiceLocalPath: voiceLocalPath ?? this.voiceLocalPath,
      voiceDurationSec: voiceDurationSec ?? this.voiceDurationSec,
      isRecalled: isRecalled ?? this.isRecalled,
      isDeletedForMe: isDeletedForMe ?? this.isDeletedForMe,
      systemText: systemText ?? this.systemText,
    );
  }
}
