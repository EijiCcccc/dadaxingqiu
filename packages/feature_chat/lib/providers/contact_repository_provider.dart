import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/contact_repository.dart';

final contactRepositoryProvider = Provider<ContactRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return ContactRepository(client);
});
