//
//  Generated code. Do not modify.
//  source: app/v1/contact.proto
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

class ContactUserItem extends $pb.GeneratedMessage {
  factory ContactUserItem({
    $core.String? userId,
    $core.String? nickname,
    $core.String? remarkName,
    $core.String? displayName,
    $core.int? gender,
    $core.String? avatarUrl,
    $fixnum.Int64? intimacy,
    $core.bool? isFollowing,
    $core.bool? isFollowedBy,
    $core.bool? isMutualFollow,
    $fixnum.Int64? relationUpdatedAt,
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
    if (isFollowing != null) {
      $result.isFollowing = isFollowing;
    }
    if (isFollowedBy != null) {
      $result.isFollowedBy = isFollowedBy;
    }
    if (isMutualFollow != null) {
      $result.isMutualFollow = isMutualFollow;
    }
    if (relationUpdatedAt != null) {
      $result.relationUpdatedAt = relationUpdatedAt;
    }
    return $result;
  }
  ContactUserItem._() : super();
  factory ContactUserItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactUserItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactUserItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..aOS(3, _omitFieldNames ? '' : 'remarkName')
    ..aOS(4, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'avatarUrl')
    ..aInt64(7, _omitFieldNames ? '' : 'intimacy')
    ..aOB(8, _omitFieldNames ? '' : 'isFollowing')
    ..aOB(9, _omitFieldNames ? '' : 'isFollowedBy')
    ..aOB(10, _omitFieldNames ? '' : 'isMutualFollow')
    ..aInt64(11, _omitFieldNames ? '' : 'relationUpdatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactUserItem clone() => ContactUserItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactUserItem copyWith(void Function(ContactUserItem) updates) => super.copyWith((message) => updates(message as ContactUserItem)) as ContactUserItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactUserItem create() => ContactUserItem._();
  ContactUserItem createEmptyInstance() => create();
  static $pb.PbList<ContactUserItem> createRepeated() => $pb.PbList<ContactUserItem>();
  @$core.pragma('dart2js:noInline')
  static ContactUserItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactUserItem>(create);
  static ContactUserItem? _defaultInstance;

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
  $core.bool get isFollowing => $_getBF(7);
  @$pb.TagNumber(8)
  set isFollowing($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsFollowing() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsFollowing() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isFollowedBy => $_getBF(8);
  @$pb.TagNumber(9)
  set isFollowedBy($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsFollowedBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsFollowedBy() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isMutualFollow => $_getBF(9);
  @$pb.TagNumber(10)
  set isMutualFollow($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsMutualFollow() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsMutualFollow() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get relationUpdatedAt => $_getI64(10);
  @$pb.TagNumber(11)
  set relationUpdatedAt($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRelationUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearRelationUpdatedAt() => $_clearField(11);
}

class GetContactFriendsResponse extends $pb.GeneratedMessage {
  factory GetContactFriendsResponse({
    $core.Iterable<ContactUserItem>? items,
    $core.int? page,
    $core.int? pageSize,
    $core.bool? hasMore,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (hasMore != null) {
      $result.hasMore = hasMore;
    }
    return $result;
  }
  GetContactFriendsResponse._() : super();
  factory GetContactFriendsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContactFriendsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetContactFriendsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<ContactUserItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ContactUserItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContactFriendsResponse clone() => GetContactFriendsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContactFriendsResponse copyWith(void Function(GetContactFriendsResponse) updates) => super.copyWith((message) => updates(message as GetContactFriendsResponse)) as GetContactFriendsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContactFriendsResponse create() => GetContactFriendsResponse._();
  GetContactFriendsResponse createEmptyInstance() => create();
  static $pb.PbList<GetContactFriendsResponse> createRepeated() => $pb.PbList<GetContactFriendsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContactFriendsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContactFriendsResponse>(create);
  static GetContactFriendsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ContactUserItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => $_clearField(4);
}

class GetContactFollowingResponse extends $pb.GeneratedMessage {
  factory GetContactFollowingResponse({
    $core.Iterable<ContactUserItem>? items,
    $core.int? page,
    $core.int? pageSize,
    $core.bool? hasMore,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (hasMore != null) {
      $result.hasMore = hasMore;
    }
    return $result;
  }
  GetContactFollowingResponse._() : super();
  factory GetContactFollowingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContactFollowingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetContactFollowingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<ContactUserItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ContactUserItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContactFollowingResponse clone() => GetContactFollowingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContactFollowingResponse copyWith(void Function(GetContactFollowingResponse) updates) => super.copyWith((message) => updates(message as GetContactFollowingResponse)) as GetContactFollowingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContactFollowingResponse create() => GetContactFollowingResponse._();
  GetContactFollowingResponse createEmptyInstance() => create();
  static $pb.PbList<GetContactFollowingResponse> createRepeated() => $pb.PbList<GetContactFollowingResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContactFollowingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContactFollowingResponse>(create);
  static GetContactFollowingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ContactUserItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => $_clearField(4);
}

class GetContactFollowersResponse extends $pb.GeneratedMessage {
  factory GetContactFollowersResponse({
    $core.Iterable<ContactUserItem>? items,
    $core.int? page,
    $core.int? pageSize,
    $core.bool? hasMore,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    if (page != null) {
      $result.page = page;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (hasMore != null) {
      $result.hasMore = hasMore;
    }
    return $result;
  }
  GetContactFollowersResponse._() : super();
  factory GetContactFollowersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContactFollowersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetContactFollowersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<ContactUserItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ContactUserItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContactFollowersResponse clone() => GetContactFollowersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContactFollowersResponse copyWith(void Function(GetContactFollowersResponse) updates) => super.copyWith((message) => updates(message as GetContactFollowersResponse)) as GetContactFollowersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContactFollowersResponse create() => GetContactFollowersResponse._();
  GetContactFollowersResponse createEmptyInstance() => create();
  static $pb.PbList<GetContactFollowersResponse> createRepeated() => $pb.PbList<GetContactFollowersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContactFollowersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContactFollowersResponse>(create);
  static GetContactFollowersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ContactUserItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => $_clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
