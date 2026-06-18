//
//  Generated code. Do not modify.
//  source: app/v1/auth.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'client.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class WechatLoginRequest extends $pb.GeneratedMessage {
  factory WechatLoginRequest({
    $core.String? code,
    $1.ClientInfo? clientInfo,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (clientInfo != null) {
      $result.clientInfo = clientInfo;
    }
    return $result;
  }
  WechatLoginRequest._() : super();
  factory WechatLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WechatLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WechatLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOM<$1.ClientInfo>(2, _omitFieldNames ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WechatLoginRequest clone() => WechatLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WechatLoginRequest copyWith(void Function(WechatLoginRequest) updates) => super.copyWith((message) => updates(message as WechatLoginRequest)) as WechatLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WechatLoginRequest create() => WechatLoginRequest._();
  WechatLoginRequest createEmptyInstance() => create();
  static $pb.PbList<WechatLoginRequest> createRepeated() => $pb.PbList<WechatLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static WechatLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WechatLoginRequest>(create);
  static WechatLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.ClientInfo get clientInfo => $_getN(1);
  @$pb.TagNumber(2)
  set clientInfo($1.ClientInfo v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ClientInfo ensureClientInfo() => $_ensure(1);
}

class RefreshTokenRequest extends $pb.GeneratedMessage {
  factory RefreshTokenRequest({
    $core.String? refreshToken,
    $1.ClientInfo? clientInfo,
  }) {
    final $result = create();
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (clientInfo != null) {
      $result.clientInfo = clientInfo;
    }
    return $result;
  }
  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refreshToken')
    ..aOM<$1.ClientInfo>(2, _omitFieldNames ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest copyWith(void Function(RefreshTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshTokenRequest)) as RefreshTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest create() => RefreshTokenRequest._();
  RefreshTokenRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenRequest> createRepeated() => $pb.PbList<RefreshTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenRequest>(create);
  static RefreshTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refreshToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set refreshToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefreshToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.ClientInfo get clientInfo => $_getN(1);
  @$pb.TagNumber(2)
  set clientInfo($1.ClientInfo v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientInfo() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.ClientInfo ensureClientInfo() => $_ensure(1);
}

class AppleLoginRequest extends $pb.GeneratedMessage {
  factory AppleLoginRequest({
    $core.String? identityToken,
    $core.String? authorizationCode,
    $1.ClientInfo? clientInfo,
  }) {
    final $result = create();
    if (identityToken != null) {
      $result.identityToken = identityToken;
    }
    if (authorizationCode != null) {
      $result.authorizationCode = authorizationCode;
    }
    if (clientInfo != null) {
      $result.clientInfo = clientInfo;
    }
    return $result;
  }
  AppleLoginRequest._() : super();
  factory AppleLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppleLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AppleLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identityToken')
    ..aOS(2, _omitFieldNames ? '' : 'authorizationCode')
    ..aOM<$1.ClientInfo>(3, _omitFieldNames ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppleLoginRequest clone() => AppleLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppleLoginRequest copyWith(void Function(AppleLoginRequest) updates) => super.copyWith((message) => updates(message as AppleLoginRequest)) as AppleLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppleLoginRequest create() => AppleLoginRequest._();
  AppleLoginRequest createEmptyInstance() => create();
  static $pb.PbList<AppleLoginRequest> createRepeated() => $pb.PbList<AppleLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static AppleLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppleLoginRequest>(create);
  static AppleLoginRequest? _defaultInstance;

  /// Reserved for future Apple Sign In rollout. No server route is exposed yet.
  @$pb.TagNumber(1)
  $core.String get identityToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set identityToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdentityToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.ClientInfo get clientInfo => $_getN(2);
  @$pb.TagNumber(3)
  set clientInfo($1.ClientInfo v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ClientInfo ensureClientInfo() => $_ensure(2);
}

class LogoutRequest extends $pb.GeneratedMessage {
  factory LogoutRequest({
    $1.ClientInfo? clientInfo,
  }) {
    final $result = create();
    if (clientInfo != null) {
      $result.clientInfo = clientInfo;
    }
    return $result;
  }
  LogoutRequest._() : super();
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<$1.ClientInfo>(1, _omitFieldNames ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest)) as LogoutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  LogoutRequest createEmptyInstance() => create();
  static $pb.PbList<LogoutRequest> createRepeated() => $pb.PbList<LogoutRequest>();
  @$core.pragma('dart2js:noInline')
  static LogoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutRequest>(create);
  static LogoutRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ClientInfo get clientInfo => $_getN(0);
  @$pb.TagNumber(1)
  set clientInfo($1.ClientInfo v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientInfo() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.ClientInfo ensureClientInfo() => $_ensure(0);
}

class LoginUser extends $pb.GeneratedMessage {
  factory LoginUser({
    $core.String? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.bool? isProfiled,
    $core.bool? isTagged,
    $core.int? status,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    if (isProfiled != null) {
      $result.isProfiled = isProfiled;
    }
    if (isTagged != null) {
      $result.isTagged = isTagged;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  LoginUser._() : super();
  factory LoginUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'avatarUrl')
    ..aOB(5, _omitFieldNames ? '' : 'isProfiled')
    ..aOB(6, _omitFieldNames ? '' : 'isTagged')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUser clone() => LoginUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUser copyWith(void Function(LoginUser) updates) => super.copyWith((message) => updates(message as LoginUser)) as LoginUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginUser create() => LoginUser._();
  LoginUser createEmptyInstance() => create();
  static $pb.PbList<LoginUser> createRepeated() => $pb.PbList<LoginUser>();
  @$core.pragma('dart2js:noInline')
  static LoginUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUser>(create);
  static LoginUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get gender => $_getIZ(2);
  @$pb.TagNumber(3)
  set gender($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatarUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isProfiled => $_getBF(4);
  @$pb.TagNumber(5)
  set isProfiled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsProfiled() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsProfiled() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isTagged => $_getBF(5);
  @$pb.TagNumber(6)
  set isTagged($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsTagged() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsTagged() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get status => $_getIZ(6);
  @$pb.TagNumber(7)
  set status($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);
}

class TokenPair extends $pb.GeneratedMessage {
  factory TokenPair({
    $core.String? accessToken,
    $core.String? refreshToken,
    $fixnum.Int64? expiresIn,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      $result.refreshToken = refreshToken;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    return $result;
  }
  TokenPair._() : super();
  factory TokenPair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenPair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TokenPair', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'refreshToken')
    ..aInt64(3, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenPair clone() => TokenPair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenPair copyWith(void Function(TokenPair) updates) => super.copyWith((message) => updates(message as TokenPair)) as TokenPair;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TokenPair create() => TokenPair._();
  TokenPair createEmptyInstance() => create();
  static $pb.PbList<TokenPair> createRepeated() => $pb.PbList<TokenPair>();
  @$core.pragma('dart2js:noInline')
  static TokenPair getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TokenPair>(create);
  static TokenPair? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expiresIn => $_getI64(2);
  @$pb.TagNumber(3)
  set expiresIn($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => $_clearField(3);
}

class WechatLoginResponse extends $pb.GeneratedMessage {
  factory WechatLoginResponse({
    LoginUser? user,
    TokenPair? token,
    $core.String? nextStep,
    $core.bool? isNewUser,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (token != null) {
      $result.token = token;
    }
    if (nextStep != null) {
      $result.nextStep = nextStep;
    }
    if (isNewUser != null) {
      $result.isNewUser = isNewUser;
    }
    return $result;
  }
  WechatLoginResponse._() : super();
  factory WechatLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WechatLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WechatLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<LoginUser>(1, _omitFieldNames ? '' : 'user', subBuilder: LoginUser.create)
    ..aOM<TokenPair>(2, _omitFieldNames ? '' : 'token', subBuilder: TokenPair.create)
    ..aOS(3, _omitFieldNames ? '' : 'nextStep')
    ..aOB(4, _omitFieldNames ? '' : 'isNewUser')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WechatLoginResponse clone() => WechatLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WechatLoginResponse copyWith(void Function(WechatLoginResponse) updates) => super.copyWith((message) => updates(message as WechatLoginResponse)) as WechatLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WechatLoginResponse create() => WechatLoginResponse._();
  WechatLoginResponse createEmptyInstance() => create();
  static $pb.PbList<WechatLoginResponse> createRepeated() => $pb.PbList<WechatLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static WechatLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WechatLoginResponse>(create);
  static WechatLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LoginUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(LoginUser v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  LoginUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenPair get token => $_getN(1);
  @$pb.TagNumber(2)
  set token(TokenPair v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenPair ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nextStep => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextStep($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextStep() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isNewUser => $_getBF(3);
  @$pb.TagNumber(4)
  set isNewUser($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsNewUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewUser() => $_clearField(4);
}

class AppleLoginResponse extends $pb.GeneratedMessage {
  factory AppleLoginResponse({
    LoginUser? user,
    TokenPair? token,
    $core.String? nextStep,
    $core.bool? isNewUser,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    if (token != null) {
      $result.token = token;
    }
    if (nextStep != null) {
      $result.nextStep = nextStep;
    }
    if (isNewUser != null) {
      $result.isNewUser = isNewUser;
    }
    return $result;
  }
  AppleLoginResponse._() : super();
  factory AppleLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppleLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AppleLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<LoginUser>(1, _omitFieldNames ? '' : 'user', subBuilder: LoginUser.create)
    ..aOM<TokenPair>(2, _omitFieldNames ? '' : 'token', subBuilder: TokenPair.create)
    ..aOS(3, _omitFieldNames ? '' : 'nextStep')
    ..aOB(4, _omitFieldNames ? '' : 'isNewUser')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppleLoginResponse clone() => AppleLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppleLoginResponse copyWith(void Function(AppleLoginResponse) updates) => super.copyWith((message) => updates(message as AppleLoginResponse)) as AppleLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AppleLoginResponse create() => AppleLoginResponse._();
  AppleLoginResponse createEmptyInstance() => create();
  static $pb.PbList<AppleLoginResponse> createRepeated() => $pb.PbList<AppleLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static AppleLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppleLoginResponse>(create);
  static AppleLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LoginUser get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(LoginUser v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  LoginUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenPair get token => $_getN(1);
  @$pb.TagNumber(2)
  set token(TokenPair v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);
  @$pb.TagNumber(2)
  TokenPair ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nextStep => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextStep($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextStep() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isNewUser => $_getBF(3);
  @$pb.TagNumber(4)
  set isNewUser($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsNewUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewUser() => $_clearField(4);
}

class RefreshTokenResponse extends $pb.GeneratedMessage {
  factory RefreshTokenResponse({
    TokenPair? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  RefreshTokenResponse._() : super();
  factory RefreshTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RefreshTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<TokenPair>(1, _omitFieldNames ? '' : 'token', subBuilder: TokenPair.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse copyWith(void Function(RefreshTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshTokenResponse)) as RefreshTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse create() => RefreshTokenResponse._();
  RefreshTokenResponse createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenResponse> createRepeated() => $pb.PbList<RefreshTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenResponse>(create);
  static RefreshTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  TokenPair get token => $_getN(0);
  @$pb.TagNumber(1)
  set token(TokenPair v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);
  @$pb.TagNumber(1)
  TokenPair ensureToken() => $_ensure(0);
}

class LogoutResponse extends $pb.GeneratedMessage {
  factory LogoutResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  LogoutResponse._() : super();
  factory LogoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogoutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutResponse clone() => LogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutResponse copyWith(void Function(LogoutResponse) updates) => super.copyWith((message) => updates(message as LogoutResponse)) as LogoutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogoutResponse create() => LogoutResponse._();
  LogoutResponse createEmptyInstance() => create();
  static $pb.PbList<LogoutResponse> createRepeated() => $pb.PbList<LogoutResponse>();
  @$core.pragma('dart2js:noInline')
  static LogoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogoutResponse>(create);
  static LogoutResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
