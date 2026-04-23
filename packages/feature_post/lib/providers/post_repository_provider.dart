import 'package:core/core.dart';
import 'package:feature_post/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return PostRepository(client);
});
