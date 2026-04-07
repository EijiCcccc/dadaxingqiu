///
//  Generated code. Do not modify.
//  source: app/v1/auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'client.pb.dart' as $1;

class WechatLoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WechatLoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOM<$1.ClientInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  WechatLoginRequest._() : super();
  factory WechatLoginRequest({
    $core.String? code,
    $1.ClientInfo? clientInfo,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (clientInfo != null) {
      _result.clientInfo = clientInfo;
    }
    return _result;
  }
  factory WechatLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WechatLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WechatLoginRequest clone() => WechatLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WechatLoginRequest copyWith(void Function(WechatLoginRequest) updates) => super.copyWith((message) => updates(message as WechatLoginRequest)) as WechatLoginRequest; // ignore: deprecated_member_use
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
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $1.ClientInfo get clientInfo => $_getN(1);
  @$pb.TagNumber(2)
  set clientInfo($1.ClientInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientInfo() => clearField(2);
  @$pb.TagNumber(2)
  $1.ClientInfo ensureClientInfo() => $_ensure(1);
}

class RefreshTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..aOM<$1.ClientInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest({
    $core.String? refreshToken,
    $1.ClientInfo? clientInfo,
  }) {
    final _result = create();
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (clientInfo != null) {
      _result.clientInfo = clientInfo;
    }
    return _result;
  }
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest copyWith(void Function(RefreshTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshTokenRequest)) as RefreshTokenRequest; // ignore: deprecated_member_use
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
  void clearRefreshToken() => clearField(1);

  @$pb.TagNumber(2)
  $1.ClientInfo get clientInfo => $_getN(1);
  @$pb.TagNumber(2)
  set clientInfo($1.ClientInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientInfo() => clearField(2);
  @$pb.TagNumber(2)
  $1.ClientInfo ensureClientInfo() => $_ensure(1);
}

class AppleLoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppleLoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'identityToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authorizationCode')
    ..aOM<$1.ClientInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  AppleLoginRequest._() : super();
  factory AppleLoginRequest({
    $core.String? identityToken,
    $core.String? authorizationCode,
    $1.ClientInfo? clientInfo,
  }) {
    final _result = create();
    if (identityToken != null) {
      _result.identityToken = identityToken;
    }
    if (authorizationCode != null) {
      _result.authorizationCode = authorizationCode;
    }
    if (clientInfo != null) {
      _result.clientInfo = clientInfo;
    }
    return _result;
  }
  factory AppleLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppleLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppleLoginRequest clone() => AppleLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppleLoginRequest copyWith(void Function(AppleLoginRequest) updates) => super.copyWith((message) => updates(message as AppleLoginRequest)) as AppleLoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppleLoginRequest create() => AppleLoginRequest._();
  AppleLoginRequest createEmptyInstance() => create();
  static $pb.PbList<AppleLoginRequest> createRepeated() => $pb.PbList<AppleLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static AppleLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppleLoginRequest>(create);
  static AppleLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get identityToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set identityToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdentityToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentityToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorizationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorizationCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorizationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorizationCode() => clearField(2);

  @$pb.TagNumber(3)
  $1.ClientInfo get clientInfo => $_getN(2);
  @$pb.TagNumber(3)
  set clientInfo($1.ClientInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientInfo() => clearField(3);
  @$pb.TagNumber(3)
  $1.ClientInfo ensureClientInfo() => $_ensure(2);
}

class LogoutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogoutRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<$1.ClientInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientInfo', subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  LogoutRequest._() : super();
  factory LogoutRequest({
    $1.ClientInfo? clientInfo,
  }) {
    final _result = create();
    if (clientInfo != null) {
      _result.clientInfo = clientInfo;
    }
    return _result;
  }
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest)) as LogoutRequest; // ignore: deprecated_member_use
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
  set clientInfo($1.ClientInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientInfo() => clearField(1);
  @$pb.TagNumber(1)
  $1.ClientInfo ensureClientInfo() => $_ensure(0);
}

class LoginUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginUser', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isProfiled')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isTagged')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  LoginUser._() : super();
  factory LoginUser({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.bool? isProfiled,
    $core.bool? isTagged,
    $core.int? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (avatarUrl != null) {
      _result.avatarUrl = avatarUrl;
    }
    if (isProfiled != null) {
      _result.isProfiled = isProfiled;
    }
    if (isTagged != null) {
      _result.isTagged = isTagged;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory LoginUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUser clone() => LoginUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUser copyWith(void Function(LoginUser) updates) => super.copyWith((message) => updates(message as LoginUser)) as LoginUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginUser create() => LoginUser._();
  LoginUser createEmptyInstance() => create();
  static $pb.PbList<LoginUser> createRepeated() => $pb.PbList<LoginUser>();
  @$core.pragma('dart2js:noInline')
  static LoginUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUser>(create);
  static LoginUser? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get gender => $_getIZ(2);
  @$pb.TagNumber(3)
  set gender($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatarUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isProfiled => $_getBF(4);
  @$pb.TagNumber(5)
  set isProfiled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsProfiled() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsProfiled() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isTagged => $_getBF(5);
  @$pb.TagNumber(6)
  set isTagged($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsTagged() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsTagged() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get status => $_getIZ(6);
  @$pb.TagNumber(7)
  set status($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}

class TokenPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TokenPair', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  TokenPair._() : super();
  factory TokenPair({
    $core.String? accessToken,
    $core.String? refreshToken,
    $fixnum.Int64? expiresIn,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    if (expiresIn != null) {
      _result.expiresIn = expiresIn;
    }
    return _result;
  }
  factory TokenPair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TokenPair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TokenPair clone() => TokenPair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TokenPair copyWith(void Function(TokenPair) updates) => super.copyWith((message) => updates(message as TokenPair)) as TokenPair; // ignore: deprecated_member_use
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
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expiresIn => $_getI64(2);
  @$pb.TagNumber(3)
  set expiresIn($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => clearField(3);
}

class WechatLoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WechatLoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<LoginUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: LoginUser.create)
    ..aOM<TokenPair>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token', subBuilder: TokenPair.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextStep')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isNewUser')
    ..hasRequiredFields = false
  ;

  WechatLoginResponse._() : super();
  factory WechatLoginResponse({
    LoginUser? user,
    TokenPair? token,
    $core.String? nextStep,
    $core.bool? isNewUser,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (token != null) {
      _result.token = token;
    }
    if (nextStep != null) {
      _result.nextStep = nextStep;
    }
    if (isNewUser != null) {
      _result.isNewUser = isNewUser;
    }
    return _result;
  }
  factory WechatLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WechatLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WechatLoginResponse clone() => WechatLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WechatLoginResponse copyWith(void Function(WechatLoginResponse) updates) => super.copyWith((message) => updates(message as WechatLoginResponse)) as WechatLoginResponse; // ignore: deprecated_member_use
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
  set user(LoginUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  LoginUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenPair get token => $_getN(1);
  @$pb.TagNumber(2)
  set token(TokenPair v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  TokenPair ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nextStep => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextStep($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextStep() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isNewUser => $_getBF(3);
  @$pb.TagNumber(4)
  set isNewUser($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsNewUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewUser() => clearField(4);
}

class AppleLoginResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppleLoginResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<LoginUser>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: LoginUser.create)
    ..aOM<TokenPair>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token', subBuilder: TokenPair.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextStep')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isNewUser')
    ..hasRequiredFields = false
  ;

  AppleLoginResponse._() : super();
  factory AppleLoginResponse({
    LoginUser? user,
    TokenPair? token,
    $core.String? nextStep,
    $core.bool? isNewUser,
  }) {
    final _result = create();
    if (user != null) {
      _result.user = user;
    }
    if (token != null) {
      _result.token = token;
    }
    if (nextStep != null) {
      _result.nextStep = nextStep;
    }
    if (isNewUser != null) {
      _result.isNewUser = isNewUser;
    }
    return _result;
  }
  factory AppleLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppleLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppleLoginResponse clone() => AppleLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppleLoginResponse copyWith(void Function(AppleLoginResponse) updates) => super.copyWith((message) => updates(message as AppleLoginResponse)) as AppleLoginResponse; // ignore: deprecated_member_use
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
  set user(LoginUser v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  LoginUser ensureUser() => $_ensure(0);

  @$pb.TagNumber(2)
  TokenPair get token => $_getN(1);
  @$pb.TagNumber(2)
  set token(TokenPair v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
  @$pb.TagNumber(2)
  TokenPair ensureToken() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get nextStep => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextStep($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextStep() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isNewUser => $_getBF(3);
  @$pb.TagNumber(4)
  set isNewUser($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsNewUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNewUser() => clearField(4);
}

class RefreshTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<TokenPair>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token', subBuilder: TokenPair.create)
    ..hasRequiredFields = false
  ;

  RefreshTokenResponse._() : super();
  factory RefreshTokenResponse({
    TokenPair? token,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory RefreshTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse clone() => RefreshTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenResponse copyWith(void Function(RefreshTokenResponse) updates) => super.copyWith((message) => updates(message as RefreshTokenResponse)) as RefreshTokenResponse; // ignore: deprecated_member_use
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
  set token(TokenPair v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
  @$pb.TagNumber(1)
  TokenPair ensureToken() => $_ensure(0);
}

class LogoutResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogoutResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  LogoutResponse._() : super();
  factory LogoutResponse({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory LogoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogoutResponse clone() => LogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogoutResponse copyWith(void Function(LogoutResponse) updates) => super.copyWith((message) => updates(message as LogoutResponse)) as LogoutResponse; // ignore: deprecated_member_use
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
  void clearSuccess() => clearField(1);
}

