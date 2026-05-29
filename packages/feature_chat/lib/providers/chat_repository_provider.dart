import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/chat_repository.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return ChatRepository(client);
});
