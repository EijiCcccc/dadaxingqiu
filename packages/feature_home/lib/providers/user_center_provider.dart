import 'package:feature_home/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 个人中心 Provider（当前登录用户摘要，对应 GET `/api/v1/me/summary`）
final userCenterProvider = FutureProvider.autoDispose<MySummary>((ref) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.getMySummary();
});
