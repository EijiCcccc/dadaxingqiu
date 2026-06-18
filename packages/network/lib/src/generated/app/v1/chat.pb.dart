//
//  Generated code. Do not modify.
//  source: app/v1/chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GetChatSettingsResponse extends $pb.GeneratedMessage {
  factory GetChatSettingsResponse({
    $core.String? peerUserId,
    $core.String? nickname,
    $core.String? remarkName,
    $core.String? displayName,
    $core.String? avatarUrl,
    $core.bool? isPinned,
    $fixnum.Int64? pinnedAt,
    $core.String? chatBackgroundUrl,
    $core.bool? isFollowing,
    $core.bool? isFollowedBy,
    $core.bool? isMutualFollow,
    $fixnum.Int64? intimacy,
  }) {
    final $result = create();
    if (peerUserId != null) {
      $result.peerUserId = peerUserId;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (remarkName != null) {
      $result.remarkName = remarkName;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    if (isPinned != null) {
      $result.isPinned = isPinned;
    }
    if (pinnedAt != null) {
      $result.pinnedAt = pinnedAt;
    }
    if (chatBackgroundUrl != null) {
      $result.chatBackgroundUrl = chatBackgroundUrl;
    }
    if (isFollowing != null) {
      $result.isFollowing = isFollowing;
    }
    if (isFollowedBy != null) {
      $result.isFollowedBy = isFollowedBy;
    }
    if (isMutualFollow != null) {
      $result.isMutualFollow = isMutualFollow;
    }
    if (intimacy != null) {
      $result.intimacy = intimacy;
    }
    return $result;
  }
  GetChatSettingsResponse._() : super();
  factory GetChatSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerUserId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'remarkName')
    ..aOS(4, _omitFieldNames ? '' : 'displayName')
    ..aOS(5, _omitFieldNames ? '' : 'avatarUrl')
    ..aOB(6, _omitFieldNames ? '' : 'isPinned')
    ..aInt64(7, _omitFieldNames ? '' : 'pinnedAt')
    ..aOS(8, _omitFieldNames ? '' : 'chatBackgroundUrl')
    ..aOB(9, _omitFieldNames ? '' : 'isFollowing')
    ..aOB(10, _omitFieldNames ? '' : 'isFollowedBy')
    ..aOB(11, _omitFieldNames ? '' : 'isMutualFollow')
    ..aInt64(12, _omitFieldNames ? '' : 'intimacy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatSettingsResponse clone() => GetChatSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatSettingsResponse copyWith(void Function(GetChatSettingsResponse) updates) => super.copyWith((message) => updates(message as GetChatSettingsResponse)) as GetChatSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatSettingsResponse create() => GetChatSettingsResponse._();
  GetChatSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatSettingsResponse> createRepeated() => $pb.PbList<GetChatSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatSettingsResponse>(create);
  static GetChatSettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get remarkName => $_getSZ(2);
  @$pb.TagNumber(3)
  set remarkName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemarkName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemarkName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get displayName => $_getSZ(3);
  @$pb.TagNumber(4)
  set displayName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDisplayName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDisplayName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatarUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatarUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatarUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPinned => $_getBF(5);
  @$pb.TagNumber(6)
  set isPinned($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPinned() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPinned() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get pinnedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set pinnedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPinnedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearPinnedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get chatBackgroundUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set chatBackgroundUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasChatBackgroundUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearChatBackgroundUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isFollowing => $_getBF(8);
  @$pb.TagNumber(9)
  set isFollowing($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsFollowing() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsFollowing() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isFollowedBy => $_getBF(9);
  @$pb.TagNumber(10)
  set isFollowedBy($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsFollowedBy() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsFollowedBy() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isMutualFollow => $_getBF(10);
  @$pb.TagNumber(11)
  set isMutualFollow($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsMutualFollow() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsMutualFollow() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get intimacy => $_getI64(11);
  @$pb.TagNumber(12)
  set intimacy($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIntimacy() => $_has(11);
  @$pb.TagNumber(12)
  void clearIntimacy() => $_clearField(12);
}

class UpdateChatPinRequest extends $pb.GeneratedMessage {
  factory UpdateChatPinRequest({
    $core.bool? isPinned,
  }) {
    final $result = create();
    if (isPinned != null) {
      $result.isPinned = isPinned;
    }
    return $result;
  }
  UpdateChatPinRequest._() : super();
  factory UpdateChatPinRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatPinRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatPinRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPinned')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatPinRequest clone() => UpdateChatPinRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatPinRequest copyWith(void Function(UpdateChatPinRequest) updates) => super.copyWith((message) => updates(message as UpdateChatPinRequest)) as UpdateChatPinRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatPinRequest create() => UpdateChatPinRequest._();
  UpdateChatPinRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateChatPinRequest> createRepeated() => $pb.PbList<UpdateChatPinRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatPinRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatPinRequest>(create);
  static UpdateChatPinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPinned => $_getBF(0);
  @$pb.TagNumber(1)
  set isPinned($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsPinned() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPinned() => $_clearField(1);
}

class UpdateChatPinResponse extends $pb.GeneratedMessage {
  factory UpdateChatPinResponse({
    $core.bool? isPinned,
    $fixnum.Int64? pinnedAt,
  }) {
    final $result = create();
    if (isPinned != null) {
      $result.isPinned = isPinned;
    }
    if (pinnedAt != null) {
      $result.pinnedAt = pinnedAt;
    }
    return $result;
  }
  UpdateChatPinResponse._() : super();
  factory UpdateChatPinResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatPinResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatPinResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isPinned')
    ..aInt64(2, _omitFieldNames ? '' : 'pinnedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatPinResponse clone() => UpdateChatPinResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatPinResponse copyWith(void Function(UpdateChatPinResponse) updates) => super.copyWith((message) => updates(message as UpdateChatPinResponse)) as UpdateChatPinResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatPinResponse create() => UpdateChatPinResponse._();
  UpdateChatPinResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateChatPinResponse> createRepeated() => $pb.PbList<UpdateChatPinResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatPinResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatPinResponse>(create);
  static UpdateChatPinResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isPinned => $_getBF(0);
  @$pb.TagNumber(1)
  set isPinned($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsPinned() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsPinned() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get pinnedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set pinnedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPinnedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearPinnedAt() => $_clearField(2);
}

class UpdateUserRemarkRequest extends $pb.GeneratedMessage {
  factory UpdateUserRemarkRequest({
    $core.String? remarkName,
  }) {
    final $result = create();
    if (remarkName != null) {
      $result.remarkName = remarkName;
    }
    return $result;
  }
  UpdateUserRemarkRequest._() : super();
  factory UpdateUserRemarkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserRemarkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserRemarkRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'remarkName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserRemarkRequest clone() => UpdateUserRemarkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserRemarkRequest copyWith(void Function(UpdateUserRemarkRequest) updates) => super.copyWith((message) => updates(message as UpdateUserRemarkRequest)) as UpdateUserRemarkRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserRemarkRequest create() => UpdateUserRemarkRequest._();
  UpdateUserRemarkRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserRemarkRequest> createRepeated() => $pb.PbList<UpdateUserRemarkRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserRemarkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserRemarkRequest>(create);
  static UpdateUserRemarkRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remarkName => $_getSZ(0);
  @$pb.TagNumber(1)
  set remarkName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemarkName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemarkName() => $_clearField(1);
}

class UpdateUserRemarkResponse extends $pb.GeneratedMessage {
  factory UpdateUserRemarkResponse({
    $core.String? targetUserId,
    $core.String? remarkName,
    $core.String? displayName,
  }) {
    final $result = create();
    if (targetUserId != null) {
      $result.targetUserId = targetUserId;
    }
    if (remarkName != null) {
      $result.remarkName = remarkName;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    return $result;
  }
  UpdateUserRemarkResponse._() : super();
  factory UpdateUserRemarkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserRemarkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserRemarkResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..aOS(2, _omitFieldNames ? '' : 'remarkName')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserRemarkResponse clone() => UpdateUserRemarkResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserRemarkResponse copyWith(void Function(UpdateUserRemarkResponse) updates) => super.copyWith((message) => updates(message as UpdateUserRemarkResponse)) as UpdateUserRemarkResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserRemarkResponse create() => UpdateUserRemarkResponse._();
  UpdateUserRemarkResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserRemarkResponse> createRepeated() => $pb.PbList<UpdateUserRemarkResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserRemarkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserRemarkResponse>(create);
  static UpdateUserRemarkResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get remarkName => $_getSZ(1);
  @$pb.TagNumber(2)
  set remarkName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemarkName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemarkName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => $_clearField(3);
}

class CreateChatBackgroundUploadRequest extends $pb.GeneratedMessage {
  factory CreateChatBackgroundUploadRequest({
    $core.String? fileName,
    $core.String? contentType,
  }) {
    final $result = create();
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    return $result;
  }
  CreateChatBackgroundUploadRequest._() : super();
  factory CreateChatBackgroundUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatBackgroundUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatBackgroundUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..aOS(2, _omitFieldNames ? '' : 'contentType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatBackgroundUploadRequest clone() => CreateChatBackgroundUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatBackgroundUploadRequest copyWith(void Function(CreateChatBackgroundUploadRequest) updates) => super.copyWith((message) => updates(message as CreateChatBackgroundUploadRequest)) as CreateChatBackgroundUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatBackgroundUploadRequest create() => CreateChatBackgroundUploadRequest._();
  CreateChatBackgroundUploadRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatBackgroundUploadRequest> createRepeated() => $pb.PbList<CreateChatBackgroundUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatBackgroundUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatBackgroundUploadRequest>(create);
  static CreateChatBackgroundUploadRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get contentType => $_getSZ(1);
  @$pb.TagNumber(2)
  set contentType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentType() => $_clearField(2);
}

class CreateChatBackgroundUploadResponse extends $pb.GeneratedMessage {
  factory CreateChatBackgroundUploadResponse({
    $core.String? objectKey,
    $core.String? uploadUrl,
    $core.String? publicUrl,
    $fixnum.Int64? expiresIn,
  }) {
    final $result = create();
    if (objectKey != null) {
      $result.objectKey = objectKey;
    }
    if (uploadUrl != null) {
      $result.uploadUrl = uploadUrl;
    }
    if (publicUrl != null) {
      $result.publicUrl = publicUrl;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    return $result;
  }
  CreateChatBackgroundUploadResponse._() : super();
  factory CreateChatBackgroundUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatBackgroundUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatBackgroundUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..aOS(2, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(3, _omitFieldNames ? '' : 'publicUrl')
    ..aInt64(4, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatBackgroundUploadResponse clone() => CreateChatBackgroundUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatBackgroundUploadResponse copyWith(void Function(CreateChatBackgroundUploadResponse) updates) => super.copyWith((message) => updates(message as CreateChatBackgroundUploadResponse)) as CreateChatBackgroundUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatBackgroundUploadResponse create() => CreateChatBackgroundUploadResponse._();
  CreateChatBackgroundUploadResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChatBackgroundUploadResponse> createRepeated() => $pb.PbList<CreateChatBackgroundUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChatBackgroundUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatBackgroundUploadResponse>(create);
  static CreateChatBackgroundUploadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uploadUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set uploadUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUploadUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploadUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expiresIn => $_getI64(3);
  @$pb.TagNumber(4)
  set expiresIn($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpiresIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpiresIn() => $_clearField(4);
}

class UpdateChatBackgroundRequest extends $pb.GeneratedMessage {
  factory UpdateChatBackgroundRequest({
    $core.String? backgroundUrl,
  }) {
    final $result = create();
    if (backgroundUrl != null) {
      $result.backgroundUrl = backgroundUrl;
    }
    return $result;
  }
  UpdateChatBackgroundRequest._() : super();
  factory UpdateChatBackgroundRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatBackgroundRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatBackgroundRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'backgroundUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatBackgroundRequest clone() => UpdateChatBackgroundRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatBackgroundRequest copyWith(void Function(UpdateChatBackgroundRequest) updates) => super.copyWith((message) => updates(message as UpdateChatBackgroundRequest)) as UpdateChatBackgroundRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatBackgroundRequest create() => UpdateChatBackgroundRequest._();
  UpdateChatBackgroundRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateChatBackgroundRequest> createRepeated() => $pb.PbList<UpdateChatBackgroundRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatBackgroundRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatBackgroundRequest>(create);
  static UpdateChatBackgroundRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backgroundUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set backgroundUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackgroundUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackgroundUrl() => $_clearField(1);
}

class UpdateChatBackgroundResponse extends $pb.GeneratedMessage {
  factory UpdateChatBackgroundResponse({
    $core.String? backgroundUrl,
  }) {
    final $result = create();
    if (backgroundUrl != null) {
      $result.backgroundUrl = backgroundUrl;
    }
    return $result;
  }
  UpdateChatBackgroundResponse._() : super();
  factory UpdateChatBackgroundResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatBackgroundResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatBackgroundResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'backgroundUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatBackgroundResponse clone() => UpdateChatBackgroundResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatBackgroundResponse copyWith(void Function(UpdateChatBackgroundResponse) updates) => super.copyWith((message) => updates(message as UpdateChatBackgroundResponse)) as UpdateChatBackgroundResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatBackgroundResponse create() => UpdateChatBackgroundResponse._();
  UpdateChatBackgroundResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateChatBackgroundResponse> createRepeated() => $pb.PbList<UpdateChatBackgroundResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatBackgroundResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatBackgroundResponse>(create);
  static UpdateChatBackgroundResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get backgroundUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set backgroundUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBackgroundUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearBackgroundUrl() => $_clearField(1);
}

class DeleteChatConversationRequest extends $pb.GeneratedMessage {
  factory DeleteChatConversationRequest() => create();
  DeleteChatConversationRequest._() : super();
  factory DeleteChatConversationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatConversationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChatConversationRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatConversationRequest clone() => DeleteChatConversationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatConversationRequest copyWith(void Function(DeleteChatConversationRequest) updates) => super.copyWith((message) => updates(message as DeleteChatConversationRequest)) as DeleteChatConversationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChatConversationRequest create() => DeleteChatConversationRequest._();
  DeleteChatConversationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChatConversationRequest> createRepeated() => $pb.PbList<DeleteChatConversationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatConversationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatConversationRequest>(create);
  static DeleteChatConversationRequest? _defaultInstance;
}

class DeleteChatConversationResponse extends $pb.GeneratedMessage {
  factory DeleteChatConversationResponse({
    $core.bool? deleted,
    $fixnum.Int64? deletedAt,
  }) {
    final $result = create();
    if (deleted != null) {
      $result.deleted = deleted;
    }
    if (deletedAt != null) {
      $result.deletedAt = deletedAt;
    }
    return $result;
  }
  DeleteChatConversationResponse._() : super();
  factory DeleteChatConversationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatConversationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChatConversationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'deleted')
    ..aInt64(2, _omitFieldNames ? '' : 'deletedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatConversationResponse clone() => DeleteChatConversationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatConversationResponse copyWith(void Function(DeleteChatConversationResponse) updates) => super.copyWith((message) => updates(message as DeleteChatConversationResponse)) as DeleteChatConversationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChatConversationResponse create() => DeleteChatConversationResponse._();
  DeleteChatConversationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteChatConversationResponse> createRepeated() => $pb.PbList<DeleteChatConversationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatConversationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatConversationResponse>(create);
  static DeleteChatConversationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get deleted => $_getBF(0);
  @$pb.TagNumber(1)
  set deleted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeleted() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeleted() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get deletedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set deletedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeletedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeletedAt() => $_clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
