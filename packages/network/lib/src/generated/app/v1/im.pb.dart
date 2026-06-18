//
//  Generated code. Do not modify.
//  source: app/v1/im.proto
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

class GetIMSessionResponse extends $pb.GeneratedMessage {
  factory GetIMSessionResponse({
    $fixnum.Int64? sdkAppId,
    $core.String? userId,
    $core.String? userSig,
    $fixnum.Int64? expireAt,
    $core.String? nickname,
    $core.String? avatarUrl,
  }) {
    final $result = create();
    if (sdkAppId != null) {
      $result.sdkAppId = sdkAppId;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (userSig != null) {
      $result.userSig = userSig;
    }
    if (expireAt != null) {
      $result.expireAt = expireAt;
    }
    if (nickname != null) {
      $result.nickname = nickname;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    return $result;
  }
  GetIMSessionResponse._() : super();
  factory GetIMSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIMSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIMSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sdkAppId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'userSig')
    ..aInt64(4, _omitFieldNames ? '' : 'expireAt')
    ..aOS(5, _omitFieldNames ? '' : 'nickname')
    ..aOS(6, _omitFieldNames ? '' : 'avatarUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIMSessionResponse clone() => GetIMSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIMSessionResponse copyWith(void Function(GetIMSessionResponse) updates) => super.copyWith((message) => updates(message as GetIMSessionResponse)) as GetIMSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIMSessionResponse create() => GetIMSessionResponse._();
  GetIMSessionResponse createEmptyInstance() => create();
  static $pb.PbList<GetIMSessionResponse> createRepeated() => $pb.PbList<GetIMSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetIMSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIMSessionResponse>(create);
  static GetIMSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sdkAppId => $_getI64(0);
  @$pb.TagNumber(1)
  set sdkAppId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSdkAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdkAppId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userSig => $_getSZ(2);
  @$pb.TagNumber(3)
  set userSig($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserSig() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSig() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get expireAt => $_getI64(3);
  @$pb.TagNumber(4)
  set expireAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpireAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nickname => $_getSZ(4);
  @$pb.TagNumber(5)
  set nickname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNickname() => $_has(4);
  @$pb.TagNumber(5)
  void clearNickname() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatarUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarUrl() => $_clearField(6);
}

class IMConversationMeta extends $pb.GeneratedMessage {
  factory IMConversationMeta({
    $core.String? userId,
    $core.String? nickname,
    $core.String? remarkName,
    $core.String? displayName,
    $core.int? gender,
    $core.String? avatarUrl,
    $fixnum.Int64? intimacy,
    $core.bool? isPinned,
    $fixnum.Int64? pinnedAt,
    $core.String? chatBackgroundUrl,
    $core.bool? isFollowing,
    $core.bool? isFollowedBy,
    $core.bool? isMutualFollow,
    $core.bool? isDeleted,
    $fixnum.Int64? deletedAt,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
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
    if (gender != null) {
      $result.gender = gender;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    if (intimacy != null) {
      $result.intimacy = intimacy;
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
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    if (deletedAt != null) {
      $result.deletedAt = deletedAt;
    }
    return $result;
  }
  IMConversationMeta._() : super();
  factory IMConversationMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IMConversationMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IMConversationMeta', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'remarkName')
    ..aOS(4, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'avatarUrl')
    ..aInt64(7, _omitFieldNames ? '' : 'intimacy')
    ..aOB(8, _omitFieldNames ? '' : 'isPinned')
    ..aInt64(9, _omitFieldNames ? '' : 'pinnedAt')
    ..aOS(10, _omitFieldNames ? '' : 'chatBackgroundUrl')
    ..aOB(11, _omitFieldNames ? '' : 'isFollowing')
    ..aOB(12, _omitFieldNames ? '' : 'isFollowedBy')
    ..aOB(13, _omitFieldNames ? '' : 'isMutualFollow')
    ..aOB(14, _omitFieldNames ? '' : 'isDeleted')
    ..aInt64(15, _omitFieldNames ? '' : 'deletedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IMConversationMeta clone() => IMConversationMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IMConversationMeta copyWith(void Function(IMConversationMeta) updates) => super.copyWith((message) => updates(message as IMConversationMeta)) as IMConversationMeta;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IMConversationMeta create() => IMConversationMeta._();
  IMConversationMeta createEmptyInstance() => create();
  static $pb.PbList<IMConversationMeta> createRepeated() => $pb.PbList<IMConversationMeta>();
  @$core.pragma('dart2js:noInline')
  static IMConversationMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IMConversationMeta>(create);
  static IMConversationMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

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
  $core.int get gender => $_getIZ(4);
  @$pb.TagNumber(5)
  set gender($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatarUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get intimacy => $_getI64(6);
  @$pb.TagNumber(7)
  set intimacy($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIntimacy() => $_has(6);
  @$pb.TagNumber(7)
  void clearIntimacy() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isPinned => $_getBF(7);
  @$pb.TagNumber(8)
  set isPinned($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsPinned() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsPinned() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get pinnedAt => $_getI64(8);
  @$pb.TagNumber(9)
  set pinnedAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPinnedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearPinnedAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get chatBackgroundUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set chatBackgroundUrl($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasChatBackgroundUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearChatBackgroundUrl() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isFollowing => $_getBF(10);
  @$pb.TagNumber(11)
  set isFollowing($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsFollowing() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsFollowing() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isFollowedBy => $_getBF(11);
  @$pb.TagNumber(12)
  set isFollowedBy($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsFollowedBy() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsFollowedBy() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isMutualFollow => $_getBF(12);
  @$pb.TagNumber(13)
  set isMutualFollow($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsMutualFollow() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsMutualFollow() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isDeleted => $_getBF(13);
  @$pb.TagNumber(14)
  set isDeleted($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsDeleted() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsDeleted() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get deletedAt => $_getI64(14);
  @$pb.TagNumber(15)
  set deletedAt($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDeletedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeletedAt() => $_clearField(15);
}

class GetIMConversationMetaResponse extends $pb.GeneratedMessage {
  factory GetIMConversationMetaResponse({
    $core.Iterable<IMConversationMeta>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  GetIMConversationMetaResponse._() : super();
  factory GetIMConversationMetaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIMConversationMetaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIMConversationMetaResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<IMConversationMeta>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: IMConversationMeta.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIMConversationMetaResponse clone() => GetIMConversationMetaResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIMConversationMetaResponse copyWith(void Function(GetIMConversationMetaResponse) updates) => super.copyWith((message) => updates(message as GetIMConversationMetaResponse)) as GetIMConversationMetaResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIMConversationMetaResponse create() => GetIMConversationMetaResponse._();
  GetIMConversationMetaResponse createEmptyInstance() => create();
  static $pb.PbList<GetIMConversationMetaResponse> createRepeated() => $pb.PbList<GetIMConversationMetaResponse>();
  @$core.pragma('dart2js:noInline')
  static GetIMConversationMetaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIMConversationMetaResponse>(create);
  static GetIMConversationMetaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<IMConversationMeta> get items => $_getList(0);
}

class GetIMIntimacyResponse extends $pb.GeneratedMessage {
  factory GetIMIntimacyResponse({
    $core.String? peerUserId,
    $core.String? displayName,
    $core.String? avatarUrl,
    $fixnum.Int64? sentCount,
    $fixnum.Int64? receivedCount,
    $fixnum.Int64? intimacy,
  }) {
    final $result = create();
    if (peerUserId != null) {
      $result.peerUserId = peerUserId;
    }
    if (displayName != null) {
      $result.displayName = displayName;
    }
    if (avatarUrl != null) {
      $result.avatarUrl = avatarUrl;
    }
    if (sentCount != null) {
      $result.sentCount = sentCount;
    }
    if (receivedCount != null) {
      $result.receivedCount = receivedCount;
    }
    if (intimacy != null) {
      $result.intimacy = intimacy;
    }
    return $result;
  }
  GetIMIntimacyResponse._() : super();
  factory GetIMIntimacyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIMIntimacyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetIMIntimacyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerUserId')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..aOS(3, _omitFieldNames ? '' : 'avatarUrl')
    ..aInt64(4, _omitFieldNames ? '' : 'sentCount')
    ..aInt64(5, _omitFieldNames ? '' : 'receivedCount')
    ..aInt64(6, _omitFieldNames ? '' : 'intimacy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIMIntimacyResponse clone() => GetIMIntimacyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIMIntimacyResponse copyWith(void Function(GetIMIntimacyResponse) updates) => super.copyWith((message) => updates(message as GetIMIntimacyResponse)) as GetIMIntimacyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIMIntimacyResponse create() => GetIMIntimacyResponse._();
  GetIMIntimacyResponse createEmptyInstance() => create();
  static $pb.PbList<GetIMIntimacyResponse> createRepeated() => $pb.PbList<GetIMIntimacyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetIMIntimacyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIMIntimacyResponse>(create);
  static GetIMIntimacyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatarUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sentCount => $_getI64(3);
  @$pb.TagNumber(4)
  set sentCount($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get receivedCount => $_getI64(4);
  @$pb.TagNumber(5)
  set receivedCount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReceivedCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceivedCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get intimacy => $_getI64(5);
  @$pb.TagNumber(6)
  set intimacy($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIntimacy() => $_has(5);
  @$pb.TagNumber(6)
  void clearIntimacy() => $_clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
