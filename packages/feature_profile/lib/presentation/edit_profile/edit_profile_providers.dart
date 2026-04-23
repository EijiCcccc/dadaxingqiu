import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:feature_profile/presentation/edit_profile/avatar_upload_provider.dart';
import 'package:feature_profile/presentation/edit_profile/edit_profile_state.dart';
import 'package:feature_profile/presentation/profile_tab/my_profile_provider.dart';
import 'package:feature_profile/presentation/profile_user_display.dart';
import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:network/network.dart';
import 'package:permission_handler/permission_handler.dart';

export 'edit_profile_state.dart';

class EditProfileNotifier
    extends AutoDisposeFamilyAsyncNotifier<EditProfileState, String> {
  /// 直接走 [ProfileRepository.getMyProfile]；保存成功后刷新 [myProfileProvider] 以同步内存缓存。
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
      ref.read(myProfileProvider.notifier).refresh();
    } finally {
      final v = state.valueOrNull;
      if (v != null) {
        state = AsyncData(v.copyWith(isSubmitting: false));
      }
    }
  }
}

/// [userId] 为 [UserProfile.id] 的字符串
final editProfileProvider = AsyncNotifierProvider.autoDispose
    .family<EditProfileNotifier, EditProfileState, String>(
  EditProfileNotifier.new,
);

/// 头像选择状态

class AvatarPickerState {
  const AvatarPickerState({
    this.isLoading = false,
    this.error,
    this.pickedFile,
  });

  final bool isLoading;
  final String? error;
  final XFile? pickedFile;

  bool get isSuccess => pickedFile != null;

  AvatarPickerState copyWith({
    bool? isLoading,
    String? error,
    XFile? pickedFile,
  }) {
    return AvatarPickerState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      pickedFile: pickedFile ?? this.pickedFile,
    );
  }
}

/// 头像选择并上传的 Provider
final avatarPickerProvider =
    NotifierProvider<AvatarPickerNotifier, AvatarPickerState>(
  AvatarPickerNotifier.new,
);

class AvatarPickerNotifier extends Notifier<AvatarPickerState> {
  @override
  AvatarPickerState build() => const AvatarPickerState();

  /// 获取相册权限（区分 iOS/Android）
  Future<Permission> _getPhotosPermission() async {
    if (Platform.isIOS) {
      return Permission.photos;
    }
    // Android
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      return Permission.photos;
    }
    return Permission.storage;
  }

  /// 请求相册权限，返回是否授权成功
  Future<bool> requestPermission() async {
    final permission = await _getPhotosPermission();
    final status = await permission.request();
    return status.isGranted;
  }

  /// 检查当前权限状态
  Future<PermissionStatus> checkPermission() async {
    final permission = await _getPhotosPermission();
    return permission.status;
  }

  /// 打开系统设置
  Future<void> openSettings() async {
    await openAppSettings();
  }

  /// 选择并上传头像
  /// 返回上传后的公开 URL，失败返回 null
  Future<String?> pickAndUploadAvatar() async {
    // 检查权限
    final permission = await _getPhotosPermission();
    final status = await permission.status;
    if (!status.isGranted) {
      state = state.copyWith(
        error: '需要相册权限才能选择头像',
      );
      return null;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      // 打开相册选择图片
      final XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 400,
        maxHeight: 400,
        imageQuality: 85,
      );

      if (file == null) {
        state = state.copyWith(isLoading: false);
        return null;
      }

      state = state.copyWith(pickedFile: file);

      // 读取图片并上传
      final imageBytes = await File(file.path).readAsBytes();
      final ext = file.path.split('.').last.toLowerCase();
      final contentType = ext == 'jpg' ? 'image/jpeg' : 'image/$ext';

      final publicUrl = await ref
          .read(avatarUploadProvider.notifier)
          .uploadAvatar(
            imageBytes: imageBytes,
            contentType: contentType,
            fileName: file.name,
          );

      if (publicUrl == null) {
        state = state.copyWith(
          isLoading: false,
          error: '头像上传失败',
        );
        return null;
      }

      state = state.copyWith(isLoading: false);
      return publicUrl;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '选择或上传头像失败: $e',
      );
      return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void reset() {
    state = const AvatarPickerState();
  }
}
