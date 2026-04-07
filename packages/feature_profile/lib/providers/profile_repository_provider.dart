import 'package:core/core.dart';
import 'package:feature_profile/data/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return ProfileRepository(client);
});
