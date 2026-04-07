import 'package:core/core.dart';
import 'package:feature_auth/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AuthRepository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return AuthRepository(client);
});
