/// 全局 Provider 定义
///
/// 在此添加应用级状态，如：DioClient、用户信息、主题偏好等
/// DioClient 由主项目 main.dart 初始化并 override
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// DioClient Provider
///
/// 主项目在 main.dart 中通过 ProviderScope.overrides 注入实际实例
/// 各 feature 的 Repository 通过 ref.watch(dioClientProvider) 获取
final dioClientProvider = Provider<DioClient>((ref) {
  throw UnimplementedError(
    'dioClientProvider 必须在 main.dart 中通过 ProviderScope.overrides 注入',
  );
});
