import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post_repository_provider.dart';

final postUnreadCountProvider =
    AsyncNotifierProvider<PostUnreadCountNotifier, int>(
  PostUnreadCountNotifier.new,
);

class PostUnreadCountNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    return _fetch();
  }

  Future<int> _fetch() async {
    final repo = ref.read(postRepositoryProvider);
    final response = await repo.getUnreadCount();
    return response.unreadCount.toInt();
  }

  Future<void> refresh() async {
    state = AsyncData(await _fetch());
  }

  void setCount(int value) {
    state = AsyncData(value);
  }
}
