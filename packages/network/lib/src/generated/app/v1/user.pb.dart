///
//  Generated code. Do not modify.
//  source: app/v1/user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class UserAvatar extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserAvatar', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  UserAvatar._() : super();
  factory UserAvatar({
    $core.String? url,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory UserAvatar.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserAvatar.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserAvatar clone() => UserAvatar()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserAvatar copyWith(void Function(UserAvatar) updates) => super.copyWith((message) => updates(message as UserAvatar)) as UserAvatar; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserAvatar create() => UserAvatar._();
  UserAvatar createEmptyInstance() => create();
  static $pb.PbList<UserAvatar> createRepeated() => $pb.PbList<UserAvatar>();
  @$core.pragma('dart2js:noInline')
  static UserAvatar getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserAvatar>(create);
  static UserAvatar? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}

class UserTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserTag', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..hasRequiredFields = false
  ;

  UserTag._() : super();
  factory UserTag({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory UserTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserTag clone() => UserTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserTag copyWith(void Function(UserTag) updates) => super.copyWith((message) => updates(message as UserTag)) as UserTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserTag create() => UserTag._();
  UserTag createEmptyInstance() => create();
  static $pb.PbList<UserTag> createRepeated() => $pb.PbList<UserTag>();
  @$core.pragma('dart2js:noInline')
  static UserTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserTag>(create);
  static UserTag? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class TagGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TagGroup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'required')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minSelect', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSelect', $pb.PbFieldType.O3)
    ..pc<UserTag>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: UserTag.create)
    ..hasRequiredFields = false
  ;

  TagGroup._() : super();
  factory TagGroup({
    $core.String? type,
    $core.String? title,
    $core.bool? required,
    $core.int? minSelect,
    $core.int? maxSelect,
    $core.Iterable<UserTag>? items,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (title != null) {
      _result.title = title;
    }
    if (required != null) {
      _result.required = required;
    }
    if (minSelect != null) {
      _result.minSelect = minSelect;
    }
    if (maxSelect != null) {
      _result.maxSelect = maxSelect;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    return _result;
  }
  factory TagGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagGroup clone() => TagGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagGroup copyWith(void Function(TagGroup) updates) => super.copyWith((message) => updates(message as TagGroup)) as TagGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagGroup create() => TagGroup._();
  TagGroup createEmptyInstance() => create();
  static $pb.PbList<TagGroup> createRepeated() => $pb.PbList<TagGroup>();
  @$core.pragma('dart2js:noInline')
  static TagGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagGroup>(create);
  static TagGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get required => $_getBF(2);
  @$pb.TagNumber(3)
  set required($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequired() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequired() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get minSelect => $_getIZ(3);
  @$pb.TagNumber(4)
  set minSelect($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinSelect() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinSelect() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxSelect => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxSelect($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxSelect() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxSelect() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<UserTag> get items => $_getList(5);
}

class UserProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isProfiled')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isTagged')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextStep')
    ..aOM<UserAvatar>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', subBuilder: UserAvatar.create)
    ..pc<UserTag>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: UserTag.create)
    ..hasRequiredFields = false
  ;

  UserProfile._() : super();
  factory UserProfile({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.int? status,
    $core.bool? isProfiled,
    $core.bool? isTagged,
    $core.String? nextStep,
    UserAvatar? avatar,
    $core.Iterable<UserTag>? tags,
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
    if (status != null) {
      _result.status = status;
    }
    if (isProfiled != null) {
      _result.isProfiled = isProfiled;
    }
    if (isTagged != null) {
      _result.isTagged = isTagged;
    }
    if (nextStep != null) {
      _result.nextStep = nextStep;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory UserProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserProfile clone() => UserProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserProfile copyWith(void Function(UserProfile) updates) => super.copyWith((message) => updates(message as UserProfile)) as UserProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserProfile create() => UserProfile._();
  UserProfile createEmptyInstance() => create();
  static $pb.PbList<UserProfile> createRepeated() => $pb.PbList<UserProfile>();
  @$core.pragma('dart2js:noInline')
  static UserProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserProfile>(create);
  static UserProfile? _defaultInstance;

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
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isProfiled => $_getBF(5);
  @$pb.TagNumber(6)
  set isProfiled($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsProfiled() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsProfiled() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isTagged => $_getBF(6);
  @$pb.TagNumber(7)
  set isTagged($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsTagged() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsTagged() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get nextStep => $_getSZ(7);
  @$pb.TagNumber(8)
  set nextStep($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNextStep() => $_has(7);
  @$pb.TagNumber(8)
  void clearNextStep() => clearField(8);

  @$pb.TagNumber(9)
  UserAvatar get avatar => $_getN(8);
  @$pb.TagNumber(9)
  set avatar(UserAvatar v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAvatar() => $_has(8);
  @$pb.TagNumber(9)
  void clearAvatar() => clearField(9);
  @$pb.TagNumber(9)
  UserAvatar ensureAvatar() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<UserTag> get tags => $_getList(9);
}

class OtherUserSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OtherUserSummary', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onlineStatus')
    ..pc<UserTag>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: UserTag.create)
    ..hasRequiredFields = false
  ;

  OtherUserSummary._() : super();
  factory OtherUserSummary({
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.String? onlineStatus,
    $core.Iterable<UserTag>? tags,
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
  factory OtherUserSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OtherUserSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OtherUserSummary clone() => OtherUserSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OtherUserSummary copyWith(void Function(OtherUserSummary) updates) => super.copyWith((message) => updates(message as OtherUserSummary)) as OtherUserSummary; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OtherUserSummary create() => OtherUserSummary._();
  OtherUserSummary createEmptyInstance() => create();
  static $pb.PbList<OtherUserSummary> createRepeated() => $pb.PbList<OtherUserSummary>();
  @$core.pragma('dart2js:noInline')
  static OtherUserSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OtherUserSummary>(create);
  static OtherUserSummary? _defaultInstance;

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
  $core.List<UserTag> get tags => $_getList(5);
}

class CreateAvatarUploadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAvatarUploadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentType')
    ..hasRequiredFields = false
  ;

  CreateAvatarUploadRequest._() : super();
  factory CreateAvatarUploadRequest({
    $core.String? fileName,
    $core.String? contentType,
  }) {
    final _result = create();
    if (fileName != null) {
      _result.fileName = fileName;
    }
    if (contentType != null) {
      _result.contentType = contentType;
    }
    return _result;
  }
  factory CreateAvatarUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAvatarUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAvatarUploadRequest clone() => CreateAvatarUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAvatarUploadRequest copyWith(void Function(CreateAvatarUploadRequest) updates) => super.copyWith((message) => updates(message as CreateAvatarUploadRequest)) as CreateAvatarUploadRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAvatarUploadRequest create() => CreateAvatarUploadRequest._();
  CreateAvatarUploadRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAvatarUploadRequest> createRepeated() => $pb.PbList<CreateAvatarUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAvatarUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAvatarUploadRequest>(create);
  static CreateAvatarUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contentType => $_getSZ(1);
  @$pb.TagNumber(2)
  set contentType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentType() => clearField(2);
}

class CreateAvatarUploadResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAvatarUploadResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'objectKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uploadUrl')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicUrl')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  CreateAvatarUploadResponse._() : super();
  factory CreateAvatarUploadResponse({
    $core.String? objectKey,
    $core.String? uploadUrl,
    $core.String? publicUrl,
    $fixnum.Int64? expiresIn,
  }) {
    final _result = create();
    if (objectKey != null) {
      _result.objectKey = objectKey;
    }
    if (uploadUrl != null) {
      _result.uploadUrl = uploadUrl;
    }
    if (publicUrl != null) {
      _result.publicUrl = publicUrl;
    }
    if (expiresIn != null) {
      _result.expiresIn = expiresIn;
    }
    return _result;
  }
  factory CreateAvatarUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAvatarUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAvatarUploadResponse clone() => CreateAvatarUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAvatarUploadResponse copyWith(void Function(CreateAvatarUploadResponse) updates) => super.copyWith((message) => updates(message as CreateAvatarUploadResponse)) as CreateAvatarUploadResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAvatarUploadResponse create() => CreateAvatarUploadResponse._();
  CreateAvatarUploadResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAvatarUploadResponse> createRepeated() => $pb.PbList<CreateAvatarUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAvatarUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAvatarUploadResponse>(create);
  static CreateAvatarUploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uploadUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set uploadUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUploadUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploadUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicUrl() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expiresIn => $_getI64(3);
  @$pb.TagNumber(4)
  set expiresIn($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpiresIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiresIn() => clearField(4);
}

class UpdateMyProfileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMyProfileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..hasRequiredFields = false
  ;

  UpdateMyProfileRequest._() : super();
  factory UpdateMyProfileRequest({
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
  }) {
    final _result = create();
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (avatarUrl != null) {
      _result.avatarUrl = avatarUrl;
    }
    return _result;
  }
  factory UpdateMyProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMyProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMyProfileRequest clone() => UpdateMyProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMyProfileRequest copyWith(void Function(UpdateMyProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateMyProfileRequest)) as UpdateMyProfileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMyProfileRequest create() => UpdateMyProfileRequest._();
  UpdateMyProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMyProfileRequest> createRepeated() => $pb.PbList<UpdateMyProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMyProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMyProfileRequest>(create);
  static UpdateMyProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nickname => $_getSZ(0);
  @$pb.TagNumber(1)
  set nickname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNickname() => $_has(0);
  @$pb.TagNumber(1)
  void clearNickname() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get gender => $_getIZ(1);
  @$pb.TagNumber(2)
  set gender($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarUrl() => clearField(3);
}

class UpdateMyProfileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMyProfileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updated')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isProfiled')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isTagged')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextStep')
    ..aOM<UserAvatar>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', subBuilder: UserAvatar.create)
    ..pc<UserTag>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: UserTag.create)
    ..hasRequiredFields = false
  ;

  UpdateMyProfileResponse._() : super();
  factory UpdateMyProfileResponse({
    $core.bool? updated,
    $fixnum.Int64? id,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.int? status,
    $core.bool? isProfiled,
    $core.bool? isTagged,
    $core.String? nextStep,
    UserAvatar? avatar,
    $core.Iterable<UserTag>? tags,
  }) {
    final _result = create();
    if (updated != null) {
      _result.updated = updated;
    }
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
    if (status != null) {
      _result.status = status;
    }
    if (isProfiled != null) {
      _result.isProfiled = isProfiled;
    }
    if (isTagged != null) {
      _result.isTagged = isTagged;
    }
    if (nextStep != null) {
      _result.nextStep = nextStep;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory UpdateMyProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMyProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMyProfileResponse clone() => UpdateMyProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMyProfileResponse copyWith(void Function(UpdateMyProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateMyProfileResponse)) as UpdateMyProfileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMyProfileResponse create() => UpdateMyProfileResponse._();
  UpdateMyProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateMyProfileResponse> createRepeated() => $pb.PbList<UpdateMyProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateMyProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMyProfileResponse>(create);
  static UpdateMyProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get updated => $_getBF(0);
  @$pb.TagNumber(1)
  set updated($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdated() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdated() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get gender => $_getIZ(3);
  @$pb.TagNumber(4)
  set gender($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatarUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatarUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatarUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isProfiled => $_getBF(6);
  @$pb.TagNumber(7)
  set isProfiled($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsProfiled() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsProfiled() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isTagged => $_getBF(7);
  @$pb.TagNumber(8)
  set isTagged($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsTagged() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsTagged() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get nextStep => $_getSZ(8);
  @$pb.TagNumber(9)
  set nextStep($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNextStep() => $_has(8);
  @$pb.TagNumber(9)
  void clearNextStep() => clearField(9);

  @$pb.TagNumber(10)
  UserAvatar get avatar => $_getN(9);
  @$pb.TagNumber(10)
  set avatar(UserAvatar v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvatar() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvatar() => clearField(10);
  @$pb.TagNumber(10)
  UserAvatar ensureAvatar() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.List<UserTag> get tags => $_getList(10);
}

class GetTagsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTagsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<TagGroup>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups', $pb.PbFieldType.PM, subBuilder: TagGroup.create)
    ..hasRequiredFields = false
  ;

  GetTagsResponse._() : super();
  factory GetTagsResponse({
    $core.Iterable<TagGroup>? groups,
  }) {
    final _result = create();
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    return _result;
  }
  factory GetTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagsResponse clone() => GetTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagsResponse copyWith(void Function(GetTagsResponse) updates) => super.copyWith((message) => updates(message as GetTagsResponse)) as GetTagsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTagsResponse create() => GetTagsResponse._();
  GetTagsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTagsResponse> createRepeated() => $pb.PbList<GetTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagsResponse>(create);
  static GetTagsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TagGroup> get groups => $_getList(0);
}

class UpdateMyTagsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMyTagsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tagIds', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  UpdateMyTagsRequest._() : super();
  factory UpdateMyTagsRequest({
    $core.Iterable<$fixnum.Int64>? tagIds,
  }) {
    final _result = create();
    if (tagIds != null) {
      _result.tagIds.addAll(tagIds);
    }
    return _result;
  }
  factory UpdateMyTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMyTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMyTagsRequest clone() => UpdateMyTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMyTagsRequest copyWith(void Function(UpdateMyTagsRequest) updates) => super.copyWith((message) => updates(message as UpdateMyTagsRequest)) as UpdateMyTagsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMyTagsRequest create() => UpdateMyTagsRequest._();
  UpdateMyTagsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMyTagsRequest> createRepeated() => $pb.PbList<UpdateMyTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMyTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMyTagsRequest>(create);
  static UpdateMyTagsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get tagIds => $_getList(0);
}

class UpdateMyTagsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMyTagsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updated')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isTagged')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextStep')
    ..pc<UserTag>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: UserTag.create)
    ..hasRequiredFields = false
  ;

  UpdateMyTagsResponse._() : super();
  factory UpdateMyTagsResponse({
    $core.bool? updated,
    $core.bool? isTagged,
    $core.String? nextStep,
    $core.Iterable<UserTag>? tags,
  }) {
    final _result = create();
    if (updated != null) {
      _result.updated = updated;
    }
    if (isTagged != null) {
      _result.isTagged = isTagged;
    }
    if (nextStep != null) {
      _result.nextStep = nextStep;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory UpdateMyTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMyTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMyTagsResponse clone() => UpdateMyTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMyTagsResponse copyWith(void Function(UpdateMyTagsResponse) updates) => super.copyWith((message) => updates(message as UpdateMyTagsResponse)) as UpdateMyTagsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMyTagsResponse create() => UpdateMyTagsResponse._();
  UpdateMyTagsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateMyTagsResponse> createRepeated() => $pb.PbList<UpdateMyTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateMyTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMyTagsResponse>(create);
  static UpdateMyTagsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get updated => $_getBF(0);
  @$pb.TagNumber(1)
  set updated($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdated() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdated() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isTagged => $_getBF(1);
  @$pb.TagNumber(2)
  set isTagged($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsTagged() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsTagged() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextStep => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextStep($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNextStep() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextStep() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<UserTag> get tags => $_getList(3);
}

