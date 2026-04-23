import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 指定用户资料状态（对应 GET `/api/v1/users/{user_id}/summary`）
@immutable
class UserProfileState {
  const UserProfileState({
    this.summary,
    this.isLoading = false,
    this.error,
  });

  final OtherUserSummary? summary;
  final bool isLoading;
  final Object? error;

  bool get hasData => summary != null;
}

/// 按 userId 拉取指定用户资料摘要
final userProfileProvider =
    NotifierProvider.family<UserProfileNotifier, UserProfileState, String>(
  UserProfileNotifier.new,
);

class UserProfileNotifier extends FamilyNotifier<UserProfileState, String> {
  @override
  UserProfileState build(String userId) {
    Future.microtask(() => _fetch(userId));
    return const UserProfileState(isLoading: true);
  }

  Future<void> _fetch(String userId) async {
    state = const UserProfileState(isLoading: true);
    try {
      final summary =
          await ref.read(profileRepositoryProvider).getUserSummary(
                userId: userId,
              );
      state = UserProfileState(summary: summary, isLoading: false);
    } catch (e) {
      state = UserProfileState(error: e, isLoading: false);
    }
  }

  Future<void> refresh() => _fetch(arg);
}
