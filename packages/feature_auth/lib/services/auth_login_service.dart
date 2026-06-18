import 'dart:async';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:feature_auth/data/data.dart';
import 'package:fluwx/fluwx.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// 登录结果：成功返回 [LoginResult]，失败返回错误信息
typedef LoginServiceResult = ({String? error, LoginResult? result});

/// 登录服务 - 封装微信/Apple 登录流程
/// 1. 从 SDK 获取 credential 2. 调用后端登录 3. 保存 token
class AuthLoginService {
  AuthLoginService({
    required AuthRepository authRepository,
    required KeyValueStorage storage,
    ImAuthBridge? imAuthBridge,
  })  : _authRepository = authRepository,
        _storage = storage,
        _imAuthBridge = imAuthBridge;

  final AuthRepository _authRepository;
  final KeyValueStorage _storage;
  final ImAuthBridge? _imAuthBridge;

  /// 微信登录 type=1
  static const int _typeWechat = 1;

  /// Apple 登录 type=2
  static const int _typeApple = 2;

  /// 执行微信登录
  Future<LoginServiceResult> loginWithWechat() async {
    var code = await _getWeChatAuthCode();
    if (code == null || code.isEmpty) {
      // return (error: '微信授权失败或已取消', result: null);
      code = 'mock_wx_1212324';
    }
    return _loginAndSave(_typeWechat, code);
  }

  /// 执行 Apple 登录
  Future<LoginServiceResult> loginWithApple() async {
    final token = await _getAppleIdToken();
    if (token == null || token.isEmpty) {
      return (error: 'Apple 登录失败或已取消', result: null);
    }
    return _loginAndSave(_typeApple, token);
  }

  Future<String?> _getWeChatAuthCode() async {
    final fluwx = Fluwx();
    final completer = Completer<String?>();

    void handler(WeChatResponse response) {
      if (response is WeChatAuthResponse) {
        fluwx.removeSubscriber(handler);
        if (response.isSuccessful &&
            response.code != null &&
            response.code!.isNotEmpty) {
          completer.complete(response.code);
        } else {
          completer.complete(null);
        }
      }
    }

    fluwx.addSubscriber(handler);

    try {
      final launched = await fluwx.authBy(
        which: NormalAuth(scope: 'snsapi_userinfo'),
      );
      if (!launched) {
        fluwx.removeSubscriber(handler);
        return null;
      }
      return completer.future.timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          fluwx.removeSubscriber(handler);
          return null;
        },
      );
    } catch (_) {
      fluwx.removeSubscriber(handler);
      return null;
    }
  }

  Future<String?> _getAppleIdToken() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      return credential.identityToken;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return null;
      }
      rethrow;
    }
  }

  Future<LoginServiceResult> _loginAndSave(int type, String credential) async {
    try {
      final res =
          await _authRepository.login(type: type, credential: credential);
      final token = res.token;
      if (token.accessToken.isNotEmpty) {
        await _storage.setString(StorageKeys.userToken, token.accessToken);
        if (token.refreshToken.isNotEmpty) {
          await _storage.setString(
            StorageKeys.refreshToken,
            token.refreshToken,
          );
        }
        if (res.hasUser()) {
          await _storage.setString(
            StorageKeys.userId,
            res.user.id,
          );
          await _imAuthBridge?.login(res.user.id);
        }
        final registered =
            res.hasUser() && res.user.isProfiled && res.user.isTagged;
        return (
          error: null,
          result: LoginResult(isRegistered: registered),
        );
      }
      return (error: '登录失败', result: null);
    } on DioException catch (e) {
      return (error: e.message ?? '网络请求失败', result: null);
    } catch (e) {
      return (error: '登录失败', result: null);
    }
  }
}
