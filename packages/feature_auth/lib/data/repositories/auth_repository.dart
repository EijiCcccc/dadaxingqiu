import 'dart:io';

import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:network/network.dart';

/// 认证与注册流程相关数据仓库（微信 / Apple 登录、刷新 Token、标签、完善资料）
class AuthRepository {
  AuthRepository(this._client);

  final DioClient _client;

  Future<String> _deviceId() async {
    if (kIsWeb) return 'web';
    final deviceInfo = DeviceInfoPlugin();
    if (defaultTargetPlatform == TargetPlatform.android) {
      final a = await deviceInfo.androidInfo;
      return a.id;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final i = await deviceInfo.iosInfo;
      return i.identifierForVendor ?? 'ios';
    }
    return 'unknown';
  }

  Future<String> _clientIpPlaceholder() async => '';

  /// 第三方登录：微信 `type=1`、Apple `type=2`
  /// Apple 使用 [ApiPath.appleLogin]；若后端未开放，将请求失败
  Future<WechatLoginResponse> login({
    required int type,
    required String credential,
  }) async {
    final deviceId = await _deviceId();
    final clientIp = await _clientIpPlaceholder();

    final clientInfo = ClientInfo(deviceId: deviceId, clientIp: clientIp);

    if (type == 1) {
      final request = WechatLoginRequest(
        code: credential,
        clientInfo: clientInfo,
      );
      return _client.postPb<WechatLoginResponse, WechatLoginRequest>(
        ApiPath.wechatLogin,
        request: request,
        message: WechatLoginResponse.new,
      );
    }

    final request = AppleLoginRequest(
      identityToken: credential,
      authorizationCode: '',
      clientInfo: clientInfo,
    );
    final apple = await _client.postPb<AppleLoginResponse, AppleLoginRequest>(
      ApiPath.appleLogin,
      request: request,
      message: AppleLoginResponse.new,
    );
    return WechatLoginResponse(
      user: apple.user,
      token: apple.token,
      nextStep: apple.nextStep,
      isNewUser: apple.isNewUser,
    );
  }

  /// 刷新 Token
  Future<RefreshTokenResponse> refreshToken({
    required String refreshToken,
  }) async {
    final request = RefreshTokenRequest(
      refreshToken: refreshToken,
      clientInfo: ClientInfo(
        deviceId: await _deviceId(),
        clientIp: await _clientIpPlaceholder(),
      ),
    );
    return _client.postPb<RefreshTokenResponse, RefreshTokenRequest>(
      ApiPath.tokenRefresh,
      request: request,
      message: RefreshTokenResponse.new,
    );
  }

  /// 退出登录
  Future<LogoutResponse> logout() async {
    final request = LogoutRequest(
      clientInfo: ClientInfo(
        deviceId: await _deviceId(),
        clientIp: await _clientIpPlaceholder(),
      ),
    );
    return _client.postPb<LogoutResponse, LogoutRequest>(
      ApiPath.logout,
      request: request,
      message: LogoutResponse.new,
    );
  }

  /// 获取标签列表（分组）
  Future<GetTagsResponse> getTagList({String? scene}) async {
    return _client.getPb<GetTagsResponse>(
      ApiPath.tags,
      message: GetTagsResponse.new,
      queryParameters: scene != null ? {'scene': scene} : null,
    );
  }

  /// 修改我的资料
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
      message: UpdateMyProfileResponse.new,
    );
  }

  /// 保存我的标签
  Future<UpdateMyTagsResponse> updateMyTags({
    required List<Int64> tagIds,
  }) async {
    final request = UpdateMyTagsRequest()..tagIds.addAll(tagIds);
    return _client.putPb<UpdateMyTagsResponse, UpdateMyTagsRequest>(
      ApiPath.usersMeTags,
      request: request,
      message: UpdateMyTagsResponse.new,
    );
  }

  /// 完善资料：先更新资料再更新标签（与选标签页提交流程一致）
  Future<void> completeProfile({
    required String avatarUrl,
    required String nickname,
    required String gender,
    required List<String> tagIds,
  }) async {
    final genderInt = gender == 'male' ? 1 : 2;
    await updateMyProfile(
      nickname: nickname,
      gender: genderInt,
      avatarUrl: avatarUrl,
    );
    final ids = <Int64>[];
    for (final id in tagIds) {
      final parsed = int.tryParse(id);
      if (parsed != null) {
        ids.add(Int64(parsed));
      }
    }
    if (ids.isEmpty) {
      throw StateError('无有效标签 ID');
    }
    await updateMyTags(tagIds: ids);
  }

  
  /// POST `/api/v1/users/me/avatar/upload-token`
  Future<CreateAvatarUploadResponse> getAvatarUploadToken({
    required String fileName,
    required String contentType,
  }) async {
    final request = CreateAvatarUploadRequest(
      fileName: fileName,
      contentType: contentType,
    );
    return _client
        .postPb<CreateAvatarUploadResponse, CreateAvatarUploadRequest>(
      ApiPath.usersMeAvatarUploadToken,
      request: request,
      message: CreateAvatarUploadResponse.create,
    );
  }
}
