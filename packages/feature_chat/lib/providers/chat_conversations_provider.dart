import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import '../models/chat_conversation.dart';
import 'chat_repository_provider.dart';
import 'tencent_im_service_provider.dart';

final chatConversationsProvider =
    NotifierProvider<ChatConversationsNotifier, List<ChatConversation>>(
  ChatConversationsNotifier.new,
);

final sortedChatConversationsProvider = Provider<List<ChatConversation>>((ref) {
  ref.watch(chatConversationsProvider);
  return ref.read(chatConversationsProvider.notifier).sorted;
});

class ChatConversationsNotifier extends Notifier<List<ChatConversation>> {
  @override
  List<ChatConversation> build() {
    Future.microtask(refreshFromIm);
    return const [];
  }

  List<ChatConversation> get sorted {
    final pinned = <ChatConversation>[];
    final normal = <ChatConversation>[];

    for (final item in state) {
      if (item.isPinned) {
        pinned.add(item);
      } else {
        normal.add(item);
      }
    }

    pinned.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    normal.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    return [...pinned, ...normal];
  }

  ChatConversation? findByUserId(String userId) {
    for (final item in state) {
      if (item.userId == userId) return item;
    }
    return null;
  }

  Future<void> refreshFromIm() async {
    final im = ref.read(tencentImServiceProvider);
    if (!im.isLoggedIn) {
      state = const [];
      return;
    }

    final conversations = await im.fetchConversations();
    state = await _mergeConversationMeta(conversations);
  }

  Future<List<ChatConversation>> _mergeConversationMeta(
    List<ChatConversation> conversations,
  ) async {
    if (conversations.isEmpty) return conversations;

    try {
      final repo = ref.read(chatRepositoryProvider);
      final response = await repo.getConversationMeta(
        peerUserIds: conversations.map((item) => item.userId).toList(),
      );

      final metaMap = <String, IMConversationMeta>{};
      for (final item in response.items) {
        metaMap[item.userId] = item;
      }

      return conversations.map((conversation) {
        final meta = metaMap[conversation.userId];
        if (meta == null) return conversation;

        final displayName = meta.displayName.isNotEmpty
            ? meta.displayName
            : (meta.nickname.isNotEmpty
                ? meta.nickname
                : conversation.username);

        return conversation.copyWith(
          username: displayName,
          avatar: meta.avatarUrl.isNotEmpty ? meta.avatarUrl : conversation.avatar,
          remarkName: meta.remarkName,
          isPinned: meta.isPinned,
          pinnedAt: meta.hasPinnedAt() && meta.pinnedAt.toInt() > 0
              ? DateTime.fromMillisecondsSinceEpoch(
                  meta.pinnedAt.toInt() * 1000,
                )
              : null,
          chatBackgroundUrl: meta.chatBackgroundUrl,
        );
      }).toList();
    } catch (_) {
      return conversations;
    }
  }

  void resetToEmpty() {
    state = const [];
  }

  void ensureConversation(String userId) {
    if (findByUserId(userId) != null) return;
    state = [
      ChatConversation(
        userId: userId,
        username: '用户$userId',
        avatar: '',
        lastMessage: '',
        lastMessageAt: DateTime.now(),
        hasUnread: false,
      ),
      ...state,
    ];
  }

  Future<void> markConversationRead(String userId) async {
    final im = ref.read(tencentImServiceProvider);
    if (im.isLoggedIn) {
      await im.markConversationRead(userId);
      await refreshFromIm();
      return;
    }

    state = state
        .map(
          (item) => item.userId == userId ? item.copyWith(hasUnread: false) : item,
        )
        .toList();
  }

  Future<void> deleteConversation(String userId) async {
    final im = ref.read(tencentImServiceProvider);
    if (im.isLoggedIn) {
      await im.deleteConversation(userId);
    }
    state = state.where((item) => item.userId != userId).toList();
  }

  Future<void> updatePin({
    required String userId,
    required bool isPinned,
  }) async {
    final repo = ref.read(chatRepositoryProvider);
    await repo.updateChatPin(peerUserId: userId, isPinned: isPinned);
    await refreshFromIm();
  }

  int get unreadCount => state.where((item) => item.hasUnread).length;
}
