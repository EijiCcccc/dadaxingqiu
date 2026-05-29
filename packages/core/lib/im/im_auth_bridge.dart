import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 应用登录态与腾讯 IM 登录态的桥接接口。
/// 实现在 app 层注入，避免 feature 包之间的循环依赖。
abstract class ImAuthBridge {
  Future<void> init();

  Future<void> login(String userId);

  Future<void> logout();

  Future<void> tryAutoLogin();
}

final imAuthBridgeProvider = Provider<ImAuthBridge?>((ref) => null);
