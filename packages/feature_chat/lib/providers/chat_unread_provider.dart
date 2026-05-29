import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chat_conversations_provider.dart';

/// 消息 Tab 数字角标是否展示（点击 Tab 后隐藏）
final chatTabBadgeVisibleProvider = StateProvider<bool>((ref) => true);

/// 消息 Tab 未读数字角标
final chatTabUnreadCountProvider = Provider<AsyncValue<int>>((ref) {
  final visible = ref.watch(chatTabBadgeVisibleProvider);
  if (!visible) return const AsyncData(0);

  final conversations = ref.watch(chatConversationsProvider);
  final count = conversations.where((item) => item.hasUnread).length;
  return AsyncData(count);
});

void clearChatTabBadge(WidgetRef ref) {
  ref.read(chatTabBadgeVisibleProvider.notifier).state = false;
}

void showChatTabBadge(WidgetRef ref) {
  ref.read(chatTabBadgeVisibleProvider.notifier).state = true;
}
