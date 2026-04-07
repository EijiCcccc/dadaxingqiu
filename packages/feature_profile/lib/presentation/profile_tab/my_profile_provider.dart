import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 当前登录用户资料（GET `/api/v1/users/me`）
final myProfileProvider = FutureProvider.autoDispose<UserProfile>((ref) async {
  final repo = ref.watch(profileRepositoryProvider);
  return repo.getMyProfile();
});
