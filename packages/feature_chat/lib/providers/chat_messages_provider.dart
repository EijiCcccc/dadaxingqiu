import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_message.dart';
import 'chat_conversations_provider.dart';
import 'tencent_im_service_provider.dart';

final chatMessagesProvider =
    NotifierProvider.family<ChatMessagesNotifier, List<ChatMessage>, String>(
  ChatMessagesNotifier.new,
);

class ChatMessagesNotifier extends FamilyNotifier<List<ChatMessage>, String> {
  @override
  List<ChatMessage> build(String userId) {
    Future.microtask(() async {
      ref.read(chatConversationsProvider.notifier).ensureConversation(userId);
      await refreshFromIm();
    });
    return const [];
  }

  Future<void> refreshFromIm() async {
    final im = ref.read(tencentImServiceProvider);
    if (!im.isLoggedIn) {
      state = const [];
      return;
    }
    state = await im.fetchMessages(arg);
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    final im = ref.read(tencentImServiceProvider);
    if (!im.isLoggedIn) return;

    final ok = await im.sendTextMessage(peerUserId: arg, text: trimmed);
    if (ok) {
      await refreshFromIm();
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
    }
  }

  Future<void> recallMessage(String messageId) async {
    final im = ref.read(tencentImServiceProvider);
    if (!im.isLoggedIn) return;

    await im.revokeMessage(messageId);
    await refreshFromIm();
    await ref.read(chatConversationsProvider.notifier).refreshFromIm();
  }

  void deleteMessage(String messageId) {
    state = state
        .map(
          (message) => message.id == messageId
              ? message.copyWith(isDeletedForMe: true)
              : message,
        )
        .toList();
  }

  Future<void> markConversationRead() async {
    await ref.read(chatConversationsProvider.notifier).markConversationRead(arg);
  }
}
