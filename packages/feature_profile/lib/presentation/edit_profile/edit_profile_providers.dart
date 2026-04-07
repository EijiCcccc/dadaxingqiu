import 'dart:async';

import 'package:feature_profile/presentation/edit_profile/edit_profile_state.dart';
import 'package:feature_profile/presentation/profile_user_display.dart';
import 'package:feature_profile/presentation/profile_tab/my_profile_provider.dart';
import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

export 'edit_profile_state.dart';

class EditProfileNotifier
    extends AutoDisposeFamilyAsyncNotifier<EditProfileState, String> {
  /// 直接走 [ProfileRepository.getMyProfile]，不 `watch(myProfileProvider)`。
  @override
  FutureOr<EditProfileState> build(String userId) async {
    final repo = ref.read(profileRepositoryProvider);
    final p = await repo.getMyProfile();
    if (p.id.toString() != userId) {
      return EditProfileState.empty;
    }
    return EditProfileState(
      tagNames: p.tags.map((t) => t.name).toList(),
      avatarUrl: resolveProfileAvatarUrl(p),
      genderUi: p.gender == 2 ? 'female' : 'male',
      isSubmitting: false,
    );
  }

  void setAvatarUrl(String url) {
    final v = state.valueOrNull;
    if (v == null) return;
    state = AsyncData(v.copyWith(avatarUrl: url));
  }

  void setGender(String genderUi) {
    final v = state.valueOrNull;
    if (v == null) return;
    state = AsyncData(v.copyWith(genderUi: genderUi));
  }

  /// UI → Notifier → Repository（页面不直接 `read(profileRepositoryProvider)`）
  Future<void> submitMyProfile({required String nickname}) async {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncData(current.copyWith(isSubmitting: true));
    try {
      final repo = ref.read(profileRepositoryProvider);
      await repo.updateMyProfile(
        nickname: nickname,
        gender: genderToApiValue(current.genderUi),
        avatarUrl: current.avatarUrl,
      );
      ref.invalidate(myProfileProvider);
    } finally {
      final v = state.valueOrNull;
      if (v != null) {
        state = AsyncData(v.copyWith(isSubmitting: false));
      }
    }
  }
}

/// [userId] 为 [UserProfile.id] 的字符串（本文件仅声明此一个 Provider）
final editProfileProvider = AsyncNotifierProvider.autoDispose
    .family<EditProfileNotifier, EditProfileState, String>(
  EditProfileNotifier.new,
);
