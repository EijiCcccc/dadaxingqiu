import 'package:feature_auth/data/data.dart';
import 'package:feature_auth/providers/auth_login_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 登录状态
final loginStateProvider =
    NotifierProvider<LoginNotifier, AsyncValue<LoginResult?>>(LoginNotifier.new);

class LoginNotifier extends Notifier<AsyncValue<LoginResult?>> {
  @override
  AsyncValue<LoginResult?> build() => const AsyncValue.data(null);

  Future<void> loginWithWechat() async {
    state = const AsyncValue.loading();
    final service = ref.read(authLoginServiceProvider);
    final res = await service.loginWithWechat();
    if (res.error != null) {
      state = AsyncValue.error(res.error!, StackTrace.current);
    } else {
      state = AsyncValue.data(res.result);
    }
  }

  Future<void> loginWithApple() async {
    state = const AsyncValue.loading();
    final service = ref.read(authLoginServiceProvider);
    final res = await service.loginWithApple();
    if (res.error != null) {
      state = AsyncValue.error(res.error!, StackTrace.current);
    } else {
      state = AsyncValue.data(res.result);
    }
  }
}
