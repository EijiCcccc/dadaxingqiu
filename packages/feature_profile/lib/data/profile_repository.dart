import 'package:core/core.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 个人资料、设置、反馈（需登录）
class ProfileRepository {
  ProfileRepository(this._client);

  final DioClient _client;

  /// GET `/api/v1/users/me`
  Future<UserProfile> getMyProfile() async {
    return _client.getPb<UserProfile>(
      ApiPath.usersMe,
      message: UserProfile.create,
    );
  }

  /// GET `/api/v1/tags` — 标签分组（可选 [scene] 查询参数）
  Future<GetTagsResponse> getTagList({String? scene}) async {
    return _client.getPb<GetTagsResponse>(
      ApiPath.tags,
      message: GetTagsResponse.create,
      queryParameters: scene != null ? {'scene': scene} : null,
    );
  }

  /// PUT `/api/v1/users/me/tags`
  Future<UpdateMyTagsResponse> updateMyTags({
    required List<Int64> tagIds,
  }) async {
    final request = UpdateMyTagsRequest()..tagIds.addAll(tagIds);
    return _client.putPb<UpdateMyTagsResponse, UpdateMyTagsRequest>(
      ApiPath.usersMeTags,
      request: request,
      message: UpdateMyTagsResponse.create,
    );
  }

  /// PUT `/api/v1/users/me/profile`
  Future<UpdateMyProfileResponse> updateMyProfile({
    required String nickname,
    required int gender,
    required String avatarUrl,
  }) async {
    final request = UpdateMyProfileRequest(
      nickname: nickname,
      gender: gender,
      avatarUrl: avatarUrl,
    );
    return _client.putPb<UpdateMyProfileResponse, UpdateMyProfileRequest>(
      ApiPath.usersMeProfile,
      request: request,
      message: UpdateMyProfileResponse.create,
    );
  }

  /// GET `/api/v1/settings`
  Future<SettingsInfo> getSettings() async {
    return _client.getPb<SettingsInfo>(
      ApiPath.settings,
      message: SettingsInfo.create,
    );
  }

  /// GET `/api/v1/settings/version`
  Future<GetVersionResponse> getVersion() async {
    return _client.getPb<GetVersionResponse>(
      ApiPath.settingsVersion,
      message: GetVersionResponse.create,
    );
  }

  /// POST `/api/v1/feedback`
  Future<SubmitFeedbackResponse> submitFeedback({
    required String content,
    String contact = '',
  }) async {
    final request = SubmitFeedbackRequest(content: content, contact: contact);
    return _client.postPb<SubmitFeedbackResponse, SubmitFeedbackRequest>(
      ApiPath.feedback,
      request: request,
      message: SubmitFeedbackResponse.create,
    );
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return ProfileRepository(client);
});
