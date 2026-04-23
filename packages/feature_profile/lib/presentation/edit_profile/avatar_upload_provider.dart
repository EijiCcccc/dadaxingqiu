import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

export 'package:network/network.dart' show GetAvatarUploadTokenResponse;

/// 头像上传状态
@immutable
class AvatarUploadState {
  const AvatarUploadState({
    this.isLoading = false,
    this.error,
    this.publicUrl,
    this.uploadResponse,
  });

  final bool isLoading;
  final Object? error;
  final String? publicUrl;
  final CreateAvatarUploadResponse? uploadResponse;

  bool get isSuccess => publicUrl != null;
}

/// 头像上传 Provider
final avatarUploadProvider =
    NotifierProvider<AvatarUploadNotifier, AvatarUploadState>(
  AvatarUploadNotifier.new,
);

class AvatarUploadNotifier extends Notifier<AvatarUploadState> {
  @override
  AvatarUploadState build() {
    return const AvatarUploadState();
  }

  /// 上传头像
  /// [imageBytes] 图片二进制数据
  /// [contentType] 如 'image/jpeg', 'image/png'
  Future<String?> uploadAvatar({
    required List<int> imageBytes,
    required String contentType,
    required String fileName,
  }) async {
    state = const AvatarUploadState(isLoading: true);

    try {
      // 1. 获取上传 Token 和 URL
      final response =
          await ref.read(profileRepositoryProvider).getAvatarUploadToken(
                fileName: fileName,
                contentType: contentType,
              );

      // 2. 上传图片到返回的 URL
      await ref.read(profileRepositoryProvider).uploadAvatarToUrl(
            uploadUrl: response.uploadUrl,
            imageBytes: imageBytes,
            headers: {
              'Content-Type': contentType,
            },
          );

      // 3. 更新状态为成功
      state = AvatarUploadState(
        publicUrl: response.publicUrl,
        uploadResponse: response,
      );

      return response.publicUrl;
    } catch (e) {
      state = AvatarUploadState(error: e);
      return null;
    }
  }

  /// 重置状态
  void reset() {
    state = const AvatarUploadState();
  }
}
