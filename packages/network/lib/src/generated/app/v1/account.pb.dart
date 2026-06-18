//
//  Generated code. Do not modify.
//  source: app/v1/account.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class MySummary extends $pb.GeneratedMessage {
  factory MySummary({
    $core.String? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.String? onlineStatus,
    $core.Iterable<$0.UserTag>? tags,
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
    if (onlineStatus != null) {
      $result.onlineStatus = onlineStatus;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  MySummary._() : super();
  factory MySummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MySummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MySummary', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'avatarUrl')
    ..aOS(5, _omitFieldNames ? '' : 'onlineStatus')
    ..pc<$0.UserTag>(6, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $0.UserTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MySummary clone() => MySummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MySummary copyWith(void Function(MySummary) updates) => super.copyWith((message) => updates(message as MySummary)) as MySummary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MySummary create() => MySummary._();
  MySummary createEmptyInstance() => create();
  static $pb.PbList<MySummary> createRepeated() => $pb.PbList<MySummary>();
  @$core.pragma('dart2js:noInline')
  static MySummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MySummary>(create);
  static MySummary? _defaultInstance;

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
  $core.String get onlineStatus => $_getSZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.UserTag> get tags => $_getList(5);
}

class SettingsInfo extends $pb.GeneratedMessage {
  factory SettingsInfo({
    $core.bool? themeSyncEnabled,
    $core.String? privacyPolicyUrl,
    $core.String? userAgreementUrl,
    $core.String? aboutUrl,
    $core.bool? feedbackEnabled,
  }) {
    final $result = create();
    if (themeSyncEnabled != null) {
      $result.themeSyncEnabled = themeSyncEnabled;
    }
    if (privacyPolicyUrl != null) {
      $result.privacyPolicyUrl = privacyPolicyUrl;
    }
    if (userAgreementUrl != null) {
      $result.userAgreementUrl = userAgreementUrl;
    }
    if (aboutUrl != null) {
      $result.aboutUrl = aboutUrl;
    }
    if (feedbackEnabled != null) {
      $result.feedbackEnabled = feedbackEnabled;
    }
    return $result;
  }
  SettingsInfo._() : super();
  factory SettingsInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SettingsInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingsInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'themeSyncEnabled')
    ..aOS(2, _omitFieldNames ? '' : 'privacyPolicyUrl')
    ..aOS(3, _omitFieldNames ? '' : 'userAgreementUrl')
    ..aOS(4, _omitFieldNames ? '' : 'aboutUrl')
    ..aOB(5, _omitFieldNames ? '' : 'feedbackEnabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SettingsInfo clone() => SettingsInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SettingsInfo copyWith(void Function(SettingsInfo) updates) => super.copyWith((message) => updates(message as SettingsInfo)) as SettingsInfo;

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
  void clearThemeSyncEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get privacyPolicyUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set privacyPolicyUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivacyPolicyUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivacyPolicyUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userAgreementUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set userAgreementUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserAgreementUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserAgreementUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get aboutUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set aboutUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAboutUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAboutUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get feedbackEnabled => $_getBF(4);
  @$pb.TagNumber(5)
  set feedbackEnabled($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFeedbackEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearFeedbackEnabled() => $_clearField(5);
}

class GetVersionResponse extends $pb.GeneratedMessage {
  factory GetVersionResponse({
    $core.String? latestVersion,
    $core.bool? forceUpdate,
    $core.String? downloadUrl,
    $core.String? releaseNotes,
  }) {
    final $result = create();
    if (latestVersion != null) {
      $result.latestVersion = latestVersion;
    }
    if (forceUpdate != null) {
      $result.forceUpdate = forceUpdate;
    }
    if (downloadUrl != null) {
      $result.downloadUrl = downloadUrl;
    }
    if (releaseNotes != null) {
      $result.releaseNotes = releaseNotes;
    }
    return $result;
  }
  GetVersionResponse._() : super();
  factory GetVersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetVersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'latestVersion')
    ..aOB(2, _omitFieldNames ? '' : 'forceUpdate')
    ..aOS(3, _omitFieldNames ? '' : 'downloadUrl')
    ..aOS(4, _omitFieldNames ? '' : 'releaseNotes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVersionResponse clone() => GetVersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVersionResponse copyWith(void Function(GetVersionResponse) updates) => super.copyWith((message) => updates(message as GetVersionResponse)) as GetVersionResponse;

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
  void clearLatestVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get forceUpdate => $_getBF(1);
  @$pb.TagNumber(2)
  set forceUpdate($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasForceUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearForceUpdate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get downloadUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set downloadUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDownloadUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearDownloadUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get releaseNotes => $_getSZ(3);
  @$pb.TagNumber(4)
  set releaseNotes($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReleaseNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearReleaseNotes() => $_clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
