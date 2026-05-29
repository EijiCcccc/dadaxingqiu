import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_conversation.dart';
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
    final list = [...state];
    list.sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt));
    return list;
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
    state = await im.fetchConversations();
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
          (item) =>
              item.userId == userId ? item.copyWith(hasUnread: false) : item,
        )
        .toList();
  }

  Future<void> deleteConversation(String userId) async {
    final im = ref.read(tencentImServiceProvider);
    if (im.isLoggedIn) {
      await im.deleteConversation(userId);
      await refreshFromIm();
      return;
    }
    state = state.where((item) => item.userId != userId).toList();
  }

  int get unreadCount => state.where((item) => item.hasUnread).length;
}
