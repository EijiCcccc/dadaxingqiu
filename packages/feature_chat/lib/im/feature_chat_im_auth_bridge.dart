import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../im/tencent_im_service.dart';
import '../providers/chat_conversations_provider.dart';
import '../providers/tencent_im_service_provider.dart';

class FeatureChatImAuthBridge implements ImAuthBridge {
  FeatureChatImAuthBridge(this.ref);

  final Ref ref;

  TencentImService get _im => ref.read(tencentImServiceProvider);

  @override
  Future<void> init() => _im.init();

  @override
  Future<void> login(String userId) async {
    final ok = await _im.login();
    ref.read(tencentImLoggedInProvider.notifier).state = ok;
    if (ok) {
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
    }
  }

  @override
  Future<void> logout() async {
    await _im.logout();
    ref.read(tencentImLoggedInProvider.notifier).state = false;
    ref.read(chatConversationsProvider.notifier).resetToEmpty();
  }

  @override
  Future<void> tryAutoLogin() async {
    final storage = ref.read(keyValueStorageProvider);
    final token = await storage.getString(StorageKeys.userToken);
    final userId = await storage.getString(StorageKeys.userId);
    if (token == null ||
        token.isEmpty ||
        userId == null ||
        userId.isEmpty) {
      return;
    }
    await login(userId);
  }
}

final featureChatImAuthBridgeProvider = Provider<ImAuthBridge>((ref) {
  return FeatureChatImAuthBridge(ref);
});
