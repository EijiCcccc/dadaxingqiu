///
//  Generated code. Do not modify.
//  source: app/v1/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class MySummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MySummary', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onlineStatus')
    ..pc<$0.UserTag>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $0.UserTag.create)
    ..hasRequiredFields = false
  ;

  MySummary._() : super();
  factory MySummary({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.String? onlineStatus,
    $core.Iterable<$0.UserTag>? tags,
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
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory MySummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MySummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MySummary clone() => MySummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MySummary copyWith(void Function(MySummary) updates) => super.copyWith((message) => updates(message as MySummary)) as MySummary; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MySummary create() => MySummary._();
  MySummary createEmptyInstance() => create();
  static $pb.PbList<MySummary> createRepeated() => $pb.PbList<MySummary>();
  @$core.pragma('dart2js:noInline')
  static MySummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MySummary>(create);
  static MySummary? _defaultInstance;

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
  $core.String get onlineStatus => $_getSZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$0.UserTag> get tags => $_getList(5);
}

class SettingsInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SettingsInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'themeSyncEnabled')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privacyPolicyUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAgreementUrl')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'aboutUrl')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedbackEnabled')
    ..hasRequiredFields = false
  ;

  SettingsInfo._() : super();
  factory SettingsInfo({
    $core.bool? themeSyncEnabled,
    $core.String? privacyPolicyUrl,
    $core.String? userAgreementUrl,
    $core.String? aboutUrl,
    $core.bool? feedbackEnabled,
  }) {
    final _result = create();
    if (themeSyncEnabled != null) {
      _result.themeSyncEnabled = themeSyncEnabled;
    }
    if (privacyPolicyUrl != null) {
      _result.privacyPolicyUrl = privacyPolicyUrl;
    }
    if (userAgreementUrl != null) {
      _result.userAgreementUrl = userAgreementUrl;
    }
    if (aboutUrl != null) {
      _result.aboutUrl = aboutUrl;
    }
    if (feedbackEnabled != null) {
      _result.feedbackEnabled = feedbackEnabled;
    }
    return _result;
  }
  factory SettingsInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingsInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingsInfo clone() => SettingsInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingsInfo copyWith(void Function(SettingsInfo) updates) => super.copyWith((message) => updates(message as SettingsInfo)) as SettingsInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SettingsInfo create() => SettingsInfo._();
  SettingsInfo createEmptyInstance() => create();
  static $pb.PbList<SettingsInfo> createRepeated() => $pb.PbList<SettingsInfo>();
  @$core.pragma('dart2js:noInline')
  static SettingsInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingsInfo>(create);
  static SettingsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get themeSyncEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set themeSyncEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThemeSyncEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearThemeSyncEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get privacyPolicyUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set privacyPolicyUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivacyPolicyUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivacyPolicyUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userAgreementUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set userAgreementUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserAgreementUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserAgreementUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get aboutUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set aboutUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAboutUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAboutUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get feedbackEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set feedbackEnabled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFeedbackEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearFeedbackEnabled() => clearField(5);
}

class GetVersionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetVersionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latestVersion')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forceUpdate')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'downloadUrl')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseNotes')
    ..hasRequiredFields = false
  ;

  GetVersionResponse._() : super();
  factory GetVersionResponse({
    $core.String? latestVersion,
    $core.bool? forceUpdate,
    $core.String? downloadUrl,
    $core.String? releaseNotes,
  }) {
    final _result = create();
    if (latestVersion != null) {
      _result.latestVersion = latestVersion;
    }
    if (forceUpdate != null) {
      _result.forceUpdate = forceUpdate;
    }
    if (downloadUrl != null) {
      _result.downloadUrl = downloadUrl;
    }
    if (releaseNotes != null) {
      _result.releaseNotes = releaseNotes;
    }
    return _result;
  }
  factory GetVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVersionResponse clone() => GetVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVersionResponse copyWith(void Function(GetVersionResponse) updates) => super.copyWith((message) => updates(message as GetVersionResponse)) as GetVersionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetVersionResponse create() => GetVersionResponse._();
  GetVersionResponse createEmptyInstance() => create();
  static $pb.PbList<GetVersionResponse> createRepeated() => $pb.PbList<GetVersionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVersionResponse>(create);
  static GetVersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get latestVersion => $_getSZ(0);
  @$pb.TagNumber(1)
  set latestVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatestVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatestVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get forceUpdate => $_getBF(1);
  @$pb.TagNumber(2)
  set forceUpdate($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForceUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearForceUpdate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get downloadUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set downloadUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDownloadUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearDownloadUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get releaseNotes => $_getSZ(3);
  @$pb.TagNumber(4)
  set releaseNotes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReleaseNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearReleaseNotes() => clearField(4);
}

