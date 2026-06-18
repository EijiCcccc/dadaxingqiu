import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import '../../providers/chat_repository_provider.dart';

final chatIntimacyProvider = FutureProvider.autoDispose
    .family<GetIMIntimacyResponse, String>((ref, peerUserId) async {
  final repo = ref.watch(chatRepositoryProvider);
  return repo.getIMIntimacy(peerUserId: peerUserId);
});
