/// 会话列表项
class ChatConversation {
  const ChatConversation({
    required this.userId,
    required this.username,
    required this.avatar,
    required this.lastMessage,
    required this.lastMessageAt,
    this.hasUnread = false,
    this.isPinned = false,
    this.pinnedAt,
    this.remarkName = '',
    this.chatBackgroundUrl = '',
  });

  final String userId;
  final String username;
  final String avatar;
  final String lastMessage;
  final DateTime lastMessageAt;
  final bool hasUnread;
  final bool isPinned;
  final DateTime? pinnedAt;
  final String remarkName;
  final String chatBackgroundUrl;

  ChatConversation copyWith({
    String? userId,
    String? username,
    String? avatar,
    String? lastMessage,
    DateTime? lastMessageAt,
    bool? hasUnread,
    bool? isPinned,
    DateTime? pinnedAt,
    String? remarkName,
    String? chatBackgroundUrl,
  }) {
    return ChatConversation(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      hasUnread: hasUnread ?? this.hasUnread,
      isPinned: isPinned ?? this.isPinned,
      pinnedAt: pinnedAt ?? this.pinnedAt,
      remarkName: remarkName ?? this.remarkName,
      chatBackgroundUrl: chatBackgroundUrl ?? this.chatBackgroundUrl,
    );
  }
}
