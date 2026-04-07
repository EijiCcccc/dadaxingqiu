import 'package:core/core.dart';
import 'package:feature_home/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UserRepository Provider
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return UserRepository(client);
});
