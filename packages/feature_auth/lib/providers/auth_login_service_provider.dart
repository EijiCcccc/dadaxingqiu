import 'package:core/core.dart';
import 'package:feature_auth/providers/auth_repository_provider.dart';
import 'package:feature_auth/services/auth_login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AuthLoginService Provider
final authLoginServiceProvider = Provider<AuthLoginService>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  final storage = ref.watch(keyValueStorageProvider);
  return AuthLoginService(authRepository: repo, storage: storage);
});
