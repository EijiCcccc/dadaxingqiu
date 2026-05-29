enum ChatMessageSender { me, other, system }

/// 单条聊天消息
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.sender,
    required this.createdAt,
    this.content,
    this.isRecalled = false,
    this.isDeletedForMe = false,
    this.systemText,
  });

  final String id;
  final ChatMessageSender sender;
  final DateTime createdAt;
  final String? content;
  final bool isRecalled;
  final bool isDeletedForMe;
  final String? systemText;

  bool get isSystem => sender == ChatMessageSender.system;

  ChatMessage copyWith({
    String? id,
    ChatMessageSender? sender,
    DateTime? createdAt,
    String? content,
    bool? isRecalled,
    bool? isDeletedForMe,
    String? systemText,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      createdAt: createdAt ?? this.createdAt,
      content: content ?? this.content,
      isRecalled: isRecalled ?? this.isRecalled,
      isDeletedForMe: isDeletedForMe ?? this.isDeletedForMe,
      systemText: systemText ?? this.systemText,
    );
  }
}
