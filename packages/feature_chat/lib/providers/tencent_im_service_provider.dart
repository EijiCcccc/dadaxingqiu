import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../im/tencent_im_service.dart';
import 'chat_conversations_provider.dart';
import 'chat_messages_provider.dart';
import 'chat_repository_provider.dart';

final tencentImServiceProvider = Provider<TencentImService>((ref) {
  final repository = ref.watch(chatRepositoryProvider);
  final service = TencentImService(
    fetchSession: repository.getIMSession,
  );

  service.onConversationsChanged = () {
    ref.read(chatConversationsProvider.notifier).refreshFromIm();
  };

  service.onMessagesChanged = (userId) {
    ref.read(chatMessagesProvider(userId).notifier).refreshFromIm();
  };

  ref.onDispose(() {
    service.onConversationsChanged = null;
    service.onMessagesChanged = null;
  });

  return service;
});

final tencentImLoggedInProvider = StateProvider<bool>((ref) {
  ref.watch(tencentImServiceProvider);
  return ref.read(tencentImServiceProvider).isLoggedIn;
});
