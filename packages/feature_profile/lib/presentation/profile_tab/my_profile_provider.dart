import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 当前登录用户资料（GET `/api/v1/users/me`）
///
/// [profile] 为最近一次成功拉取的缓存；刷新失败时仍保留旧值，仅 [error] 更新。
@immutable
class MyProfileState {
  const MyProfileState({
    this.profile,
    this.isLoading = false,
    this.error,
  });

  final UserProfile? profile;
  final bool isLoading;
  final Object? error;
}

/// 拉取/刷新「我的资料」；内存中保留 [MyProfileState.profile] 直至成功覆盖或登出后 [invalidate]。
final myProfileProvider =
    NotifierProvider<MyProfileNotifier, MyProfileState>(MyProfileNotifier.new);

class MyProfileNotifier extends Notifier<MyProfileState> {
  @override
  MyProfileState build() {
    ref.keepAlive();
    ref.listen(profileRepositoryProvider, (_, __) {
      Future.microtask(_fetch);
    });
    Future.microtask(_fetch);
    return const MyProfileState(isLoading: true);
  }

  Future<void> _fetch() async {
    final prev = state.profile;
    state = MyProfileState(profile: prev, isLoading: true, error: null);
    try {
      final p = await ref.read(profileRepositoryProvider).getMyProfile();
      state = MyProfileState(profile: p, isLoading: false, error: null);
    } catch (e) {
      state = MyProfileState(
        profile: prev,
        isLoading: false,
        error: e,
      );
    }
  }

  /// 后台重新拉取；失败时保留 [MyProfileState.profile]。
  Future<void> refresh() => _fetch();

  /// 供 bootstrap 等使用：若尚无缓存则等待拉取完成。
  Future<UserProfile> ensureLoaded() async {
    if (state.profile != null) {
      return state.profile!;
    }
    try {
      await _fetch();
    } catch (_) {}
    final p = state.profile;
    if (p != null) return p;
    final e = state.error;
    if (e != null) {
      throw e is Exception ? e : Exception(e.toString());
    }
    throw StateError('UserProfile load failed');
  }
}
