/// 会话列表项
class ChatConversation {
  const ChatConversation({
    required this.userId,
    required this.username,
    required this.avatar,
    required this.lastMessage,
    required this.lastMessageAt,
    this.hasUnread = false,
  });

  final String userId;
  final String username;
  final String avatar;
  final String lastMessage;
  final DateTime lastMessageAt;
  final bool hasUnread;

  ChatConversation copyWith({
    String? userId,
    String? username,
    String? avatar,
    String? lastMessage,
    DateTime? lastMessageAt,
    bool? hasUnread,
  }) {
    return ChatConversation(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      hasUnread: hasUnread ?? this.hasUnread,
    );
  }
}
