import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';

/// IM 与聊天设置相关接口
class ChatRepository {
  ChatRepository(this._client);

  final DioClient _client;

  /// GET `/api/v1/im/session`
  Future<GetIMSessionResponse> getIMSession() async {
    return _client.getPb<GetIMSessionResponse>(
      ApiPath.imSession,
      message: GetIMSessionResponse.create,
    );
  }

  /// GET `/api/v1/im/intimacy/{peer_user_id}`
  Future<GetIMIntimacyResponse> getIMIntimacy({
    required String peerUserId,
  }) async {
    return _client.getPb<GetIMIntimacyResponse>(
      ApiPath.imIntimacy(peerUserId),
      message: GetIMIntimacyResponse.create,
    );
  }

  /// GET `/api/v1/im/conversations/meta?peer_user_ids=...`
  Future<GetIMConversationMetaResponse> getConversationMeta({
    required List<String> peerUserIds,
  }) {
    if (peerUserIds.isEmpty) {
      return Future.value(GetIMConversationMetaResponse());
    }
    return _client.getPb<GetIMConversationMetaResponse>(
      ApiPath.imConversationMeta,
      message: GetIMConversationMetaResponse.create,
      queryParameters: {
        'peer_user_ids': peerUserIds.join(','),
      },
    );
  }

  /// GET `/api/v1/chats/{peer_user_id}/settings`
  Future<GetChatSettingsResponse> getChatSettings({
    required String peerUserId,
  }) {
    return _client.getPb<GetChatSettingsResponse>(
      ApiPath.chatSettings(peerUserId),
      message: GetChatSettingsResponse.create,
    );
  }

  /// PUT `/api/v1/chats/{peer_user_id}/pin`
  Future<UpdateChatPinResponse> updateChatPin({
    required String peerUserId,
    required bool isPinned,
  }) {
    return _client.putPb<UpdateChatPinResponse, UpdateChatPinRequest>(
      ApiPath.chatPin(peerUserId),
      request: UpdateChatPinRequest()..isPinned = isPinned,
      message: UpdateChatPinResponse.create,
    );
  }

  /// PUT `/api/v1/users/{target_user_id}/remark`
  Future<UpdateUserRemarkResponse> updateUserRemark({
    required String targetUserId,
    required String remarkName,
  }) {
    return _client.putPb<UpdateUserRemarkResponse, UpdateUserRemarkRequest>(
      ApiPath.userRemark(targetUserId),
      request: UpdateUserRemarkRequest()..remarkName = remarkName,
      message: UpdateUserRemarkResponse.create,
    );
  }

  /// POST `/api/v1/chats/{peer_user_id}/background/upload-token`
  Future<CreateChatBackgroundUploadResponse> getBackgroundUploadToken({
    required String peerUserId,
    required String fileName,
    required String contentType,
  }) {
    return _client.postPb<
        CreateChatBackgroundUploadResponse,
        CreateChatBackgroundUploadRequest>(
      ApiPath.chatBackgroundUploadToken(peerUserId),
      request: CreateChatBackgroundUploadRequest()
        ..fileName = fileName
        ..contentType = contentType,
      message: CreateChatBackgroundUploadResponse.create,
    );
  }

  /// PUT `/api/v1/chats/{peer_user_id}/background`
  Future<UpdateChatBackgroundResponse> updateChatBackground({
    required String peerUserId,
    required String backgroundUrl,
  }) {
    return _client.putPb<
        UpdateChatBackgroundResponse,
        UpdateChatBackgroundRequest>(
      ApiPath.chatBackground(peerUserId),
      request: UpdateChatBackgroundRequest()..backgroundUrl = backgroundUrl,
      message: UpdateChatBackgroundResponse.create,
    );
  }

  /// POST `/api/v1/chats/{peer_user_id}/delete`
  Future<DeleteChatConversationResponse> deleteChatConversation({
    required String peerUserId,
  }) {
    return _client.postPb<
        DeleteChatConversationResponse,
        DeleteChatConversationRequest>(
      ApiPath.chatDelete(peerUserId),
      request: DeleteChatConversationRequest(),
      message: DeleteChatConversationResponse.create,
    );
  }

  /// POST `/api/v1/follows`
  Future<FollowUserResponse> followUser(String userId) {
    return _client.postPb<FollowUserResponse, FollowUserRequest>(
      ApiPath.follows,
      request: FollowUserRequest()..targetUserId = userId,
      message: FollowUserResponse.create,
    );
  }

  /// POST `/api/v1/follows/delete`
  Future<UnfollowUserResponse> unfollowUser(String userId) {
    return _client.postPb<UnfollowUserResponse, UnfollowUserRequest>(
      ApiPath.unfollowUser,
      request: UnfollowUserRequest()..targetUserId = userId,
      message: UnfollowUserResponse.create,
    );
  }

  Future<void> uploadImageToUrl({
    required String uploadUrl,
    required List<int> imageBytes,
    required String contentType,
  }) async {
    await _client.dio.put<void>(
      uploadUrl,
      data: imageBytes,
      options: Options(headers: {'Content-Type': contentType}),
    );
  }
}
