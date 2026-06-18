//
//  Generated code. Do not modify.
//  source: app/v1/post.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'post.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'post.pbenum.dart';

class FollowUserRequest extends $pb.GeneratedMessage {
  factory FollowUserRequest({
    $core.String? targetUserId,
  }) {
    final $result = create();
    if (targetUserId != null) {
      $result.targetUserId = targetUserId;
    }
    return $result;
  }
  FollowUserRequest._() : super();
  factory FollowUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FollowUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowUserRequest clone() => FollowUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowUserRequest copyWith(void Function(FollowUserRequest) updates) => super.copyWith((message) => updates(message as FollowUserRequest)) as FollowUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FollowUserRequest create() => FollowUserRequest._();
  FollowUserRequest createEmptyInstance() => create();
  static $pb.PbList<FollowUserRequest> createRepeated() => $pb.PbList<FollowUserRequest>();
  @$core.pragma('dart2js:noInline')
  static FollowUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowUserRequest>(create);
  static FollowUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);
}

class FollowUserResponse extends $pb.GeneratedMessage {
  factory FollowUserResponse({
    GetFollowRelationResponse? relation,
  }) {
    final $result = create();
    if (relation != null) {
      $result.relation = relation;
    }
    return $result;
  }
  FollowUserResponse._() : super();
  factory FollowUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FollowUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<GetFollowRelationResponse>(1, _omitFieldNames ? '' : 'relation', subBuilder: GetFollowRelationResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowUserResponse clone() => FollowUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowUserResponse copyWith(void Function(FollowUserResponse) updates) => super.copyWith((message) => updates(message as FollowUserResponse)) as FollowUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FollowUserResponse create() => FollowUserResponse._();
  FollowUserResponse createEmptyInstance() => create();
  static $pb.PbList<FollowUserResponse> createRepeated() => $pb.PbList<FollowUserResponse>();
  @$core.pragma('dart2js:noInline')
  static FollowUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowUserResponse>(create);
  static FollowUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  GetFollowRelationResponse get relation => $_getN(0);
  @$pb.TagNumber(1)
  set relation(GetFollowRelationResponse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRelation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelation() => $_clearField(1);
  @$pb.TagNumber(1)
  GetFollowRelationResponse ensureRelation() => $_ensure(0);
}

class UnfollowUserRequest extends $pb.GeneratedMessage {
  factory UnfollowUserRequest({
    $core.String? targetUserId,
  }) {
    final $result = create();
    if (targetUserId != null) {
      $result.targetUserId = targetUserId;
    }
    return $result;
  }
  UnfollowUserRequest._() : super();
  factory UnfollowUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfollowUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnfollowUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnfollowUserRequest clone() => UnfollowUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnfollowUserRequest copyWith(void Function(UnfollowUserRequest) updates) => super.copyWith((message) => updates(message as UnfollowUserRequest)) as UnfollowUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfollowUserRequest create() => UnfollowUserRequest._();
  UnfollowUserRequest createEmptyInstance() => create();
  static $pb.PbList<UnfollowUserRequest> createRepeated() => $pb.PbList<UnfollowUserRequest>();
  @$core.pragma('dart2js:noInline')
  static UnfollowUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfollowUserRequest>(create);
  static UnfollowUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);
}

class UnfollowUserResponse extends $pb.GeneratedMessage {
  factory UnfollowUserResponse({
    GetFollowRelationResponse? relation,
  }) {
    final $result = create();
    if (relation != null) {
      $result.relation = relation;
    }
    return $result;
  }
  UnfollowUserResponse._() : super();
  factory UnfollowUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnfollowUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnfollowUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<GetFollowRelationResponse>(1, _omitFieldNames ? '' : 'relation', subBuilder: GetFollowRelationResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnfollowUserResponse clone() => UnfollowUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnfollowUserResponse copyWith(void Function(UnfollowUserResponse) updates) => super.copyWith((message) => updates(message as UnfollowUserResponse)) as UnfollowUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnfollowUserResponse create() => UnfollowUserResponse._();
  UnfollowUserResponse createEmptyInstance() => create();
  static $pb.PbList<UnfollowUserResponse> createRepeated() => $pb.PbList<UnfollowUserResponse>();
  @$core.pragma('dart2js:noInline')
  static UnfollowUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnfollowUserResponse>(create);
  static UnfollowUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  GetFollowRelationResponse get relation => $_getN(0);
  @$pb.TagNumber(1)
  set relation(GetFollowRelationResponse v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRelation() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelation() => $_clearField(1);
  @$pb.TagNumber(1)
  GetFollowRelationResponse ensureRelation() => $_ensure(0);
}

class GetFollowRelationResponse extends $pb.GeneratedMessage {
  factory GetFollowRelationResponse({
    $core.String? targetUserId,
    $core.bool? isFollowing,
    $core.bool? isFollowedByTargetUser,
    $core.bool? isMutualFollow,
  }) {
    final $result = create();
    if (targetUserId != null) {
      $result.targetUserId = targetUserId;
    }
    if (isFollowing != null) {
      $result.isFollowing = isFollowing;
    }
    if (isFollowedByTargetUser != null) {
      $result.isFollowedByTargetUser = isFollowedByTargetUser;
    }
    if (isMutualFollow != null) {
      $result.isMutualFollow = isMutualFollow;
    }
    return $result;
  }
  GetFollowRelationResponse._() : super();
  factory GetFollowRelationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFollowRelationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFollowRelationResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'targetUserId')
    ..aOB(2, _omitFieldNames ? '' : 'isFollowing')
    ..aOB(3, _omitFieldNames ? '' : 'isFollowedByTargetUser')
    ..aOB(4, _omitFieldNames ? '' : 'isMutualFollow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFollowRelationResponse clone() => GetFollowRelationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFollowRelationResponse copyWith(void Function(GetFollowRelationResponse) updates) => super.copyWith((message) => updates(message as GetFollowRelationResponse)) as GetFollowRelationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFollowRelationResponse create() => GetFollowRelationResponse._();
  GetFollowRelationResponse createEmptyInstance() => create();
  static $pb.PbList<GetFollowRelationResponse> createRepeated() => $pb.PbList<GetFollowRelationResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFollowRelationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFollowRelationResponse>(create);
  static GetFollowRelationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFollowing => $_getBF(1);
  @$pb.TagNumber(2)
  set isFollowing($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFollowing() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFollowing() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isFollowedByTargetUser => $_getBF(2);
  @$pb.TagNumber(3)
  set isFollowedByTargetUser($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsFollowedByTargetUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFollowedByTargetUser() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isMutualFollow => $_getBF(3);
  @$pb.TagNumber(4)
  set isMutualFollow($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsMutualFollow() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsMutualFollow() => $_clearField(4);
}

class PostImage extends $pb.GeneratedMessage {
  factory PostImage({
    $core.String? imageUrl,
    $core.String? thumbUrl,
    $core.int? sortOrder,
  }) {
    final $result = create();
    if (imageUrl != null) {
      $result.imageUrl = imageUrl;
    }
    if (thumbUrl != null) {
      $result.thumbUrl = thumbUrl;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    return $result;
  }
  PostImage._() : super();
  factory PostImage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostImage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostImage', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'imageUrl')
    ..aOS(2, _omitFieldNames ? '' : 'thumbUrl')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sortOrder', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostImage clone() => PostImage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostImage copyWith(void Function(PostImage) updates) => super.copyWith((message) => updates(message as PostImage)) as PostImage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostImage create() => PostImage._();
  PostImage createEmptyInstance() => create();
  static $pb.PbList<PostImage> createRepeated() => $pb.PbList<PostImage>();
  @$core.pragma('dart2js:noInline')
  static PostImage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostImage>(create);
  static PostImage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get thumbUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set thumbUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThumbUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearThumbUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get sortOrder => $_getIZ(2);
  @$pb.TagNumber(3)
  set sortOrder($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSortOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortOrder() => $_clearField(3);
}

class PostAuthorRelation extends $pb.GeneratedMessage {
  factory PostAuthorRelation({
    $core.String? userId,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.bool? isFollowing,
    $core.bool? isFollowedBy,
    $core.bool? isMutualFollow,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
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
    if (isFollowing != null) {
      $result.isFollowing = isFollowing;
    }
    if (isFollowedBy != null) {
      $result.isFollowedBy = isFollowedBy;
    }
    if (isMutualFollow != null) {
      $result.isMutualFollow = isMutualFollow;
    }
    return $result;
  }
  PostAuthorRelation._() : super();
  factory PostAuthorRelation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostAuthorRelation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostAuthorRelation', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'nickname')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'avatarUrl')
    ..aOB(5, _omitFieldNames ? '' : 'isFollowing')
    ..aOB(6, _omitFieldNames ? '' : 'isFollowedBy')
    ..aOB(7, _omitFieldNames ? '' : 'isMutualFollow')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostAuthorRelation clone() => PostAuthorRelation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostAuthorRelation copyWith(void Function(PostAuthorRelation) updates) => super.copyWith((message) => updates(message as PostAuthorRelation)) as PostAuthorRelation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostAuthorRelation create() => PostAuthorRelation._();
  PostAuthorRelation createEmptyInstance() => create();
  static $pb.PbList<PostAuthorRelation> createRepeated() => $pb.PbList<PostAuthorRelation>();
  @$core.pragma('dart2js:noInline')
  static PostAuthorRelation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostAuthorRelation>(create);
  static PostAuthorRelation? _defaultInstance;

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
  $core.bool get isFollowing => $_getBF(4);
  @$pb.TagNumber(5)
  set isFollowing($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsFollowing() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsFollowing() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isFollowedBy => $_getBF(5);
  @$pb.TagNumber(6)
  set isFollowedBy($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsFollowedBy() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFollowedBy() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isMutualFollow => $_getBF(6);
  @$pb.TagNumber(7)
  set isMutualFollow($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsMutualFollow() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsMutualFollow() => $_clearField(7);
}

class PostItem extends $pb.GeneratedMessage {
  factory PostItem({
    $fixnum.Int64? postId,
    PostAuthorRelation? author,
    $core.String? content,
    $core.Iterable<PostImage>? images,
    PostVisibility? visibility,
    $core.bool? isDeleted,
    $fixnum.Int64? deletedAt,
    $fixnum.Int64? likeCount,
    $fixnum.Int64? commentCount,
    $core.bool? isLikedByMe,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (author != null) {
      $result.author = author;
    }
    if (content != null) {
      $result.content = content;
    }
    if (images != null) {
      $result.images.addAll(images);
    }
    if (visibility != null) {
      $result.visibility = visibility;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    if (deletedAt != null) {
      $result.deletedAt = deletedAt;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    if (commentCount != null) {
      $result.commentCount = commentCount;
    }
    if (isLikedByMe != null) {
      $result.isLikedByMe = isLikedByMe;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PostItem._() : super();
  factory PostItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..aOM<PostAuthorRelation>(2, _omitFieldNames ? '' : 'author', subBuilder: PostAuthorRelation.create)
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..pc<PostImage>(4, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM, subBuilder: PostImage.create)
    ..e<PostVisibility>(5, _omitFieldNames ? '' : 'visibility', $pb.PbFieldType.OE, defaultOrMaker: PostVisibility.UNSPECIFIED, valueOf: PostVisibility.valueOf, enumValues: PostVisibility.values)
    ..aOB(6, _omitFieldNames ? '' : 'isDeleted')
    ..aInt64(7, _omitFieldNames ? '' : 'deletedAt')
    ..aInt64(8, _omitFieldNames ? '' : 'likeCount')
    ..aInt64(9, _omitFieldNames ? '' : 'commentCount')
    ..aOB(10, _omitFieldNames ? '' : 'isLikedByMe')
    ..aInt64(11, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(12, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostItem clone() => PostItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostItem copyWith(void Function(PostItem) updates) => super.copyWith((message) => updates(message as PostItem)) as PostItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostItem create() => PostItem._();
  PostItem createEmptyInstance() => create();
  static $pb.PbList<PostItem> createRepeated() => $pb.PbList<PostItem>();
  @$core.pragma('dart2js:noInline')
  static PostItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostItem>(create);
  static PostItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  PostAuthorRelation get author => $_getN(1);
  @$pb.TagNumber(2)
  set author(PostAuthorRelation v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthor() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthor() => $_clearField(2);
  @$pb.TagNumber(2)
  PostAuthorRelation ensureAuthor() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<PostImage> get images => $_getList(3);

  @$pb.TagNumber(5)
  PostVisibility get visibility => $_getN(4);
  @$pb.TagNumber(5)
  set visibility(PostVisibility v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVisibility() => $_has(4);
  @$pb.TagNumber(5)
  void clearVisibility() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isDeleted => $_getBF(5);
  @$pb.TagNumber(6)
  set isDeleted($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsDeleted() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDeleted() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get deletedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set deletedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeletedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeletedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get likeCount => $_getI64(7);
  @$pb.TagNumber(8)
  set likeCount($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLikeCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearLikeCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get commentCount => $_getI64(8);
  @$pb.TagNumber(9)
  set commentCount($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCommentCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearCommentCount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isLikedByMe => $_getBF(9);
  @$pb.TagNumber(10)
  set isLikedByMe($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsLikedByMe() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsLikedByMe() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get createdAt => $_getI64(10);
  @$pb.TagNumber(11)
  set createdAt($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get updatedAt => $_getI64(11);
  @$pb.TagNumber(12)
  set updatedAt($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdatedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdatedAt() => $_clearField(12);
}

class GetSquarePostsResponse extends $pb.GeneratedMessage {
  factory GetSquarePostsResponse({
    $core.Iterable<PostItem>? items,
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
  GetSquarePostsResponse._() : super();
  factory GetSquarePostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSquarePostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSquarePostsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<PostItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PostItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSquarePostsResponse clone() => GetSquarePostsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSquarePostsResponse copyWith(void Function(GetSquarePostsResponse) updates) => super.copyWith((message) => updates(message as GetSquarePostsResponse)) as GetSquarePostsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSquarePostsResponse create() => GetSquarePostsResponse._();
  GetSquarePostsResponse createEmptyInstance() => create();
  static $pb.PbList<GetSquarePostsResponse> createRepeated() => $pb.PbList<GetSquarePostsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSquarePostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSquarePostsResponse>(create);
  static GetSquarePostsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostItem> get items => $_getList(0);

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

class GetFriendPostsResponse extends $pb.GeneratedMessage {
  factory GetFriendPostsResponse({
    $core.Iterable<PostItem>? items,
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
  GetFriendPostsResponse._() : super();
  factory GetFriendPostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFriendPostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFriendPostsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<PostItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PostItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFriendPostsResponse clone() => GetFriendPostsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFriendPostsResponse copyWith(void Function(GetFriendPostsResponse) updates) => super.copyWith((message) => updates(message as GetFriendPostsResponse)) as GetFriendPostsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFriendPostsResponse create() => GetFriendPostsResponse._();
  GetFriendPostsResponse createEmptyInstance() => create();
  static $pb.PbList<GetFriendPostsResponse> createRepeated() => $pb.PbList<GetFriendPostsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFriendPostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFriendPostsResponse>(create);
  static GetFriendPostsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostItem> get items => $_getList(0);

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

class CreatePostImageUploadRequest extends $pb.GeneratedMessage {
  factory CreatePostImageUploadRequest({
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
  CreatePostImageUploadRequest._() : super();
  factory CreatePostImageUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostImageUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostImageUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..aOS(2, _omitFieldNames ? '' : 'contentType')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostImageUploadRequest clone() => CreatePostImageUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostImageUploadRequest copyWith(void Function(CreatePostImageUploadRequest) updates) => super.copyWith((message) => updates(message as CreatePostImageUploadRequest)) as CreatePostImageUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostImageUploadRequest create() => CreatePostImageUploadRequest._();
  CreatePostImageUploadRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePostImageUploadRequest> createRepeated() => $pb.PbList<CreatePostImageUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePostImageUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostImageUploadRequest>(create);
  static CreatePostImageUploadRequest? _defaultInstance;

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

class CreatePostImageUploadResponse extends $pb.GeneratedMessage {
  factory CreatePostImageUploadResponse({
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
  CreatePostImageUploadResponse._() : super();
  factory CreatePostImageUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostImageUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostImageUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
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
  CreatePostImageUploadResponse clone() => CreatePostImageUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostImageUploadResponse copyWith(void Function(CreatePostImageUploadResponse) updates) => super.copyWith((message) => updates(message as CreatePostImageUploadResponse)) as CreatePostImageUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostImageUploadResponse create() => CreatePostImageUploadResponse._();
  CreatePostImageUploadResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePostImageUploadResponse> createRepeated() => $pb.PbList<CreatePostImageUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePostImageUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostImageUploadResponse>(create);
  static CreatePostImageUploadResponse? _defaultInstance;

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

class CreatePostRequest extends $pb.GeneratedMessage {
  factory CreatePostRequest({
    $core.String? content,
    $core.Iterable<$core.String>? imageUrls,
    PostVisibility? visibility,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    if (imageUrls != null) {
      $result.imageUrls.addAll(imageUrls);
    }
    if (visibility != null) {
      $result.visibility = visibility;
    }
    return $result;
  }
  CreatePostRequest._() : super();
  factory CreatePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..pPS(2, _omitFieldNames ? '' : 'imageUrls')
    ..e<PostVisibility>(3, _omitFieldNames ? '' : 'visibility', $pb.PbFieldType.OE, defaultOrMaker: PostVisibility.UNSPECIFIED, valueOf: PostVisibility.valueOf, enumValues: PostVisibility.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostRequest clone() => CreatePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostRequest copyWith(void Function(CreatePostRequest) updates) => super.copyWith((message) => updates(message as CreatePostRequest)) as CreatePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostRequest create() => CreatePostRequest._();
  CreatePostRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePostRequest> createRepeated() => $pb.PbList<CreatePostRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostRequest>(create);
  static CreatePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get imageUrls => $_getList(1);

  @$pb.TagNumber(3)
  PostVisibility get visibility => $_getN(2);
  @$pb.TagNumber(3)
  set visibility(PostVisibility v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasVisibility() => $_has(2);
  @$pb.TagNumber(3)
  void clearVisibility() => $_clearField(3);
}

class CreatePostResponse extends $pb.GeneratedMessage {
  factory CreatePostResponse({
    PostItem? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  CreatePostResponse._() : super();
  factory CreatePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<PostItem>(1, _omitFieldNames ? '' : 'post', subBuilder: PostItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostResponse clone() => CreatePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostResponse copyWith(void Function(CreatePostResponse) updates) => super.copyWith((message) => updates(message as CreatePostResponse)) as CreatePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostResponse create() => CreatePostResponse._();
  CreatePostResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePostResponse> createRepeated() => $pb.PbList<CreatePostResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostResponse>(create);
  static CreatePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostItem get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostItem v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => $_clearField(1);
  @$pb.TagNumber(1)
  PostItem ensurePost() => $_ensure(0);
}

class GetPostDetailResponse extends $pb.GeneratedMessage {
  factory GetPostDetailResponse({
    PostItem? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  GetPostDetailResponse._() : super();
  factory GetPostDetailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostDetailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostDetailResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<PostItem>(1, _omitFieldNames ? '' : 'post', subBuilder: PostItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostDetailResponse clone() => GetPostDetailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostDetailResponse copyWith(void Function(GetPostDetailResponse) updates) => super.copyWith((message) => updates(message as GetPostDetailResponse)) as GetPostDetailResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostDetailResponse create() => GetPostDetailResponse._();
  GetPostDetailResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostDetailResponse> createRepeated() => $pb.PbList<GetPostDetailResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostDetailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostDetailResponse>(create);
  static GetPostDetailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostItem get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostItem v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => $_clearField(1);
  @$pb.TagNumber(1)
  PostItem ensurePost() => $_ensure(0);
}

class PostCommentItem extends $pb.GeneratedMessage {
  factory PostCommentItem({
    $fixnum.Int64? commentId,
    $fixnum.Int64? postId,
    PostAuthorRelation? author,
    $fixnum.Int64? replyToCommentId,
    $core.String? replyToUserId,
    $core.String? content,
    $core.String? displayContent,
    $core.bool? isDeleted,
    $fixnum.Int64? deletedAt,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    if (author != null) {
      $result.author = author;
    }
    if (replyToCommentId != null) {
      $result.replyToCommentId = replyToCommentId;
    }
    if (replyToUserId != null) {
      $result.replyToUserId = replyToUserId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (displayContent != null) {
      $result.displayContent = displayContent;
    }
    if (isDeleted != null) {
      $result.isDeleted = isDeleted;
    }
    if (deletedAt != null) {
      $result.deletedAt = deletedAt;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PostCommentItem._() : super();
  factory PostCommentItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostCommentItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostCommentItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commentId')
    ..aInt64(2, _omitFieldNames ? '' : 'postId')
    ..aOM<PostAuthorRelation>(3, _omitFieldNames ? '' : 'author', subBuilder: PostAuthorRelation.create)
    ..aInt64(4, _omitFieldNames ? '' : 'replyToCommentId')
    ..aOS(5, _omitFieldNames ? '' : 'replyToUserId')
    ..aOS(6, _omitFieldNames ? '' : 'content')
    ..aOS(7, _omitFieldNames ? '' : 'displayContent')
    ..aOB(8, _omitFieldNames ? '' : 'isDeleted')
    ..aInt64(9, _omitFieldNames ? '' : 'deletedAt')
    ..aInt64(10, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(11, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostCommentItem clone() => PostCommentItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostCommentItem copyWith(void Function(PostCommentItem) updates) => super.copyWith((message) => updates(message as PostCommentItem)) as PostCommentItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostCommentItem create() => PostCommentItem._();
  PostCommentItem createEmptyInstance() => create();
  static $pb.PbList<PostCommentItem> createRepeated() => $pb.PbList<PostCommentItem>();
  @$core.pragma('dart2js:noInline')
  static PostCommentItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostCommentItem>(create);
  static PostCommentItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commentId => $_getI64(0);
  @$pb.TagNumber(1)
  set commentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get postId => $_getI64(1);
  @$pb.TagNumber(2)
  set postId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => $_clearField(2);

  @$pb.TagNumber(3)
  PostAuthorRelation get author => $_getN(2);
  @$pb.TagNumber(3)
  set author(PostAuthorRelation v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthor() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthor() => $_clearField(3);
  @$pb.TagNumber(3)
  PostAuthorRelation ensureAuthor() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get replyToCommentId => $_getI64(3);
  @$pb.TagNumber(4)
  set replyToCommentId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReplyToCommentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearReplyToCommentId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get replyToUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set replyToUserId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReplyToUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyToUserId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get displayContent => $_getSZ(6);
  @$pb.TagNumber(7)
  set displayContent($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDisplayContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisplayContent() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isDeleted => $_getBF(7);
  @$pb.TagNumber(8)
  set isDeleted($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsDeleted() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsDeleted() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get deletedAt => $_getI64(8);
  @$pb.TagNumber(9)
  set deletedAt($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDeletedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeletedAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get createdAt => $_getI64(9);
  @$pb.TagNumber(10)
  set createdAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get updatedAt => $_getI64(10);
  @$pb.TagNumber(11)
  set updatedAt($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);
}

class GetPostCommentsResponse extends $pb.GeneratedMessage {
  factory GetPostCommentsResponse({
    $core.Iterable<PostCommentItem>? items,
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
  GetPostCommentsResponse._() : super();
  factory GetPostCommentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostCommentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostCommentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<PostCommentItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PostCommentItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostCommentsResponse clone() => GetPostCommentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostCommentsResponse copyWith(void Function(GetPostCommentsResponse) updates) => super.copyWith((message) => updates(message as GetPostCommentsResponse)) as GetPostCommentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostCommentsResponse create() => GetPostCommentsResponse._();
  GetPostCommentsResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostCommentsResponse> createRepeated() => $pb.PbList<GetPostCommentsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostCommentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostCommentsResponse>(create);
  static GetPostCommentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostCommentItem> get items => $_getList(0);

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

class GetPostLikesResponse extends $pb.GeneratedMessage {
  factory GetPostLikesResponse({
    $core.Iterable<PostAuthorRelation>? items,
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
  GetPostLikesResponse._() : super();
  factory GetPostLikesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostLikesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostLikesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<PostAuthorRelation>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PostAuthorRelation.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostLikesResponse clone() => GetPostLikesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostLikesResponse copyWith(void Function(GetPostLikesResponse) updates) => super.copyWith((message) => updates(message as GetPostLikesResponse)) as GetPostLikesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostLikesResponse create() => GetPostLikesResponse._();
  GetPostLikesResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostLikesResponse> createRepeated() => $pb.PbList<GetPostLikesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostLikesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostLikesResponse>(create);
  static GetPostLikesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostAuthorRelation> get items => $_getList(0);

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

class LikePostRequest extends $pb.GeneratedMessage {
  factory LikePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  LikePostRequest._() : super();
  factory LikePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostRequest clone() => LikePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostRequest copyWith(void Function(LikePostRequest) updates) => super.copyWith((message) => updates(message as LikePostRequest)) as LikePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostRequest create() => LikePostRequest._();
  LikePostRequest createEmptyInstance() => create();
  static $pb.PbList<LikePostRequest> createRepeated() => $pb.PbList<LikePostRequest>();
  @$core.pragma('dart2js:noInline')
  static LikePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostRequest>(create);
  static LikePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class LikePostResponse extends $pb.GeneratedMessage {
  factory LikePostResponse({
    $core.bool? success,
    $fixnum.Int64? likeCount,
    $core.bool? isLiked,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    if (isLiked != null) {
      $result.isLiked = isLiked;
    }
    return $result;
  }
  LikePostResponse._() : super();
  factory LikePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aInt64(2, _omitFieldNames ? '' : 'likeCount')
    ..aOB(3, _omitFieldNames ? '' : 'isLiked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostResponse clone() => LikePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostResponse copyWith(void Function(LikePostResponse) updates) => super.copyWith((message) => updates(message as LikePostResponse)) as LikePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostResponse create() => LikePostResponse._();
  LikePostResponse createEmptyInstance() => create();
  static $pb.PbList<LikePostResponse> createRepeated() => $pb.PbList<LikePostResponse>();
  @$core.pragma('dart2js:noInline')
  static LikePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostResponse>(create);
  static LikePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get likeCount => $_getI64(1);
  @$pb.TagNumber(2)
  set likeCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isLiked => $_getBF(2);
  @$pb.TagNumber(3)
  set isLiked($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsLiked() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsLiked() => $_clearField(3);
}

class UnlikePostRequest extends $pb.GeneratedMessage {
  factory UnlikePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  UnlikePostRequest._() : super();
  factory UnlikePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlikePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlikePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlikePostRequest clone() => UnlikePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlikePostRequest copyWith(void Function(UnlikePostRequest) updates) => super.copyWith((message) => updates(message as UnlikePostRequest)) as UnlikePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlikePostRequest create() => UnlikePostRequest._();
  UnlikePostRequest createEmptyInstance() => create();
  static $pb.PbList<UnlikePostRequest> createRepeated() => $pb.PbList<UnlikePostRequest>();
  @$core.pragma('dart2js:noInline')
  static UnlikePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlikePostRequest>(create);
  static UnlikePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class UnlikePostResponse extends $pb.GeneratedMessage {
  factory UnlikePostResponse({
    $core.bool? success,
    $fixnum.Int64? likeCount,
    $core.bool? isLiked,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    if (isLiked != null) {
      $result.isLiked = isLiked;
    }
    return $result;
  }
  UnlikePostResponse._() : super();
  factory UnlikePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnlikePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnlikePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aInt64(2, _omitFieldNames ? '' : 'likeCount')
    ..aOB(3, _omitFieldNames ? '' : 'isLiked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnlikePostResponse clone() => UnlikePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnlikePostResponse copyWith(void Function(UnlikePostResponse) updates) => super.copyWith((message) => updates(message as UnlikePostResponse)) as UnlikePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnlikePostResponse create() => UnlikePostResponse._();
  UnlikePostResponse createEmptyInstance() => create();
  static $pb.PbList<UnlikePostResponse> createRepeated() => $pb.PbList<UnlikePostResponse>();
  @$core.pragma('dart2js:noInline')
  static UnlikePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnlikePostResponse>(create);
  static UnlikePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get likeCount => $_getI64(1);
  @$pb.TagNumber(2)
  set likeCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isLiked => $_getBF(2);
  @$pb.TagNumber(3)
  set isLiked($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsLiked() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsLiked() => $_clearField(3);
}

class CreatePostCommentRequest extends $pb.GeneratedMessage {
  factory CreatePostCommentRequest({
    $fixnum.Int64? postId,
    $core.String? content,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  CreatePostCommentRequest._() : super();
  factory CreatePostCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostCommentRequest clone() => CreatePostCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostCommentRequest copyWith(void Function(CreatePostCommentRequest) updates) => super.copyWith((message) => updates(message as CreatePostCommentRequest)) as CreatePostCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostCommentRequest create() => CreatePostCommentRequest._();
  CreatePostCommentRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePostCommentRequest> createRepeated() => $pb.PbList<CreatePostCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePostCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostCommentRequest>(create);
  static CreatePostCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
}

class CreatePostCommentResponse extends $pb.GeneratedMessage {
  factory CreatePostCommentResponse({
    PostCommentItem? comment,
  }) {
    final $result = create();
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  CreatePostCommentResponse._() : super();
  factory CreatePostCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePostCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePostCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<PostCommentItem>(1, _omitFieldNames ? '' : 'comment', subBuilder: PostCommentItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePostCommentResponse clone() => CreatePostCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePostCommentResponse copyWith(void Function(CreatePostCommentResponse) updates) => super.copyWith((message) => updates(message as CreatePostCommentResponse)) as CreatePostCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePostCommentResponse create() => CreatePostCommentResponse._();
  CreatePostCommentResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePostCommentResponse> createRepeated() => $pb.PbList<CreatePostCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePostCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePostCommentResponse>(create);
  static CreatePostCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostCommentItem get comment => $_getN(0);
  @$pb.TagNumber(1)
  set comment(PostCommentItem v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => $_clearField(1);
  @$pb.TagNumber(1)
  PostCommentItem ensureComment() => $_ensure(0);
}

class ReplyPostCommentRequest extends $pb.GeneratedMessage {
  factory ReplyPostCommentRequest({
    $fixnum.Int64? postId,
    $fixnum.Int64? commentId,
    $core.String? content,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  ReplyPostCommentRequest._() : super();
  factory ReplyPostCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyPostCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyPostCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..aInt64(2, _omitFieldNames ? '' : 'commentId')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyPostCommentRequest clone() => ReplyPostCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyPostCommentRequest copyWith(void Function(ReplyPostCommentRequest) updates) => super.copyWith((message) => updates(message as ReplyPostCommentRequest)) as ReplyPostCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyPostCommentRequest create() => ReplyPostCommentRequest._();
  ReplyPostCommentRequest createEmptyInstance() => create();
  static $pb.PbList<ReplyPostCommentRequest> createRepeated() => $pb.PbList<ReplyPostCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static ReplyPostCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyPostCommentRequest>(create);
  static ReplyPostCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get commentId => $_getI64(1);
  @$pb.TagNumber(2)
  set commentId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCommentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

class ReplyPostCommentResponse extends $pb.GeneratedMessage {
  factory ReplyPostCommentResponse({
    PostCommentItem? comment,
  }) {
    final $result = create();
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  ReplyPostCommentResponse._() : super();
  factory ReplyPostCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyPostCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyPostCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<PostCommentItem>(1, _omitFieldNames ? '' : 'comment', subBuilder: PostCommentItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyPostCommentResponse clone() => ReplyPostCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyPostCommentResponse copyWith(void Function(ReplyPostCommentResponse) updates) => super.copyWith((message) => updates(message as ReplyPostCommentResponse)) as ReplyPostCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyPostCommentResponse create() => ReplyPostCommentResponse._();
  ReplyPostCommentResponse createEmptyInstance() => create();
  static $pb.PbList<ReplyPostCommentResponse> createRepeated() => $pb.PbList<ReplyPostCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static ReplyPostCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyPostCommentResponse>(create);
  static ReplyPostCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostCommentItem get comment => $_getN(0);
  @$pb.TagNumber(1)
  set comment(PostCommentItem v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(1)
  void clearComment() => $_clearField(1);
  @$pb.TagNumber(1)
  PostCommentItem ensureComment() => $_ensure(0);
}

class DeletePostCommentRequest extends $pb.GeneratedMessage {
  factory DeletePostCommentRequest({
    $fixnum.Int64? commentId,
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  DeletePostCommentRequest._() : super();
  factory DeletePostCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostCommentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commentId')
    ..aInt64(2, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostCommentRequest clone() => DeletePostCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostCommentRequest copyWith(void Function(DeletePostCommentRequest) updates) => super.copyWith((message) => updates(message as DeletePostCommentRequest)) as DeletePostCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostCommentRequest create() => DeletePostCommentRequest._();
  DeletePostCommentRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePostCommentRequest> createRepeated() => $pb.PbList<DeletePostCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePostCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostCommentRequest>(create);
  static DeletePostCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commentId => $_getI64(0);
  @$pb.TagNumber(1)
  set commentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get postId => $_getI64(1);
  @$pb.TagNumber(2)
  set postId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => $_clearField(2);
}

class DeletePostCommentResponse extends $pb.GeneratedMessage {
  factory DeletePostCommentResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePostCommentResponse._() : super();
  factory DeletePostCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostCommentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostCommentResponse clone() => DeletePostCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostCommentResponse copyWith(void Function(DeletePostCommentResponse) updates) => super.copyWith((message) => updates(message as DeletePostCommentResponse)) as DeletePostCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostCommentResponse create() => DeletePostCommentResponse._();
  DeletePostCommentResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePostCommentResponse> createRepeated() => $pb.PbList<DeletePostCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePostCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostCommentResponse>(create);
  static DeletePostCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class DeletePostRequest extends $pb.GeneratedMessage {
  factory DeletePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  DeletePostRequest._() : super();
  factory DeletePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostRequest clone() => DeletePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostRequest copyWith(void Function(DeletePostRequest) updates) => super.copyWith((message) => updates(message as DeletePostRequest)) as DeletePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostRequest create() => DeletePostRequest._();
  DeletePostRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePostRequest> createRepeated() => $pb.PbList<DeletePostRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostRequest>(create);
  static DeletePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class DeletePostResponse extends $pb.GeneratedMessage {
  factory DeletePostResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePostResponse._() : super();
  factory DeletePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostResponse clone() => DeletePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostResponse copyWith(void Function(DeletePostResponse) updates) => super.copyWith((message) => updates(message as DeletePostResponse)) as DeletePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostResponse create() => DeletePostResponse._();
  DeletePostResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePostResponse> createRepeated() => $pb.PbList<DeletePostResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostResponse>(create);
  static DeletePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdatePostVisibilityRequest extends $pb.GeneratedMessage {
  factory UpdatePostVisibilityRequest({
    $fixnum.Int64? postId,
    PostVisibility? visibility,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    if (visibility != null) {
      $result.visibility = visibility;
    }
    return $result;
  }
  UpdatePostVisibilityRequest._() : super();
  factory UpdatePostVisibilityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePostVisibilityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePostVisibilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..e<PostVisibility>(2, _omitFieldNames ? '' : 'visibility', $pb.PbFieldType.OE, defaultOrMaker: PostVisibility.UNSPECIFIED, valueOf: PostVisibility.valueOf, enumValues: PostVisibility.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePostVisibilityRequest clone() => UpdatePostVisibilityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePostVisibilityRequest copyWith(void Function(UpdatePostVisibilityRequest) updates) => super.copyWith((message) => updates(message as UpdatePostVisibilityRequest)) as UpdatePostVisibilityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePostVisibilityRequest create() => UpdatePostVisibilityRequest._();
  UpdatePostVisibilityRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePostVisibilityRequest> createRepeated() => $pb.PbList<UpdatePostVisibilityRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePostVisibilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePostVisibilityRequest>(create);
  static UpdatePostVisibilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  PostVisibility get visibility => $_getN(1);
  @$pb.TagNumber(2)
  set visibility(PostVisibility v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVisibility() => $_has(1);
  @$pb.TagNumber(2)
  void clearVisibility() => $_clearField(2);
}

class UpdatePostVisibilityResponse extends $pb.GeneratedMessage {
  factory UpdatePostVisibilityResponse({
    PostItem? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  UpdatePostVisibilityResponse._() : super();
  factory UpdatePostVisibilityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePostVisibilityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePostVisibilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOM<PostItem>(1, _omitFieldNames ? '' : 'post', subBuilder: PostItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePostVisibilityResponse clone() => UpdatePostVisibilityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePostVisibilityResponse copyWith(void Function(UpdatePostVisibilityResponse) updates) => super.copyWith((message) => updates(message as UpdatePostVisibilityResponse)) as UpdatePostVisibilityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePostVisibilityResponse create() => UpdatePostVisibilityResponse._();
  UpdatePostVisibilityResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePostVisibilityResponse> createRepeated() => $pb.PbList<UpdatePostVisibilityResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePostVisibilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePostVisibilityResponse>(create);
  static UpdatePostVisibilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostItem get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostItem v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => $_clearField(1);
  @$pb.TagNumber(1)
  PostItem ensurePost() => $_ensure(0);
}

class PostNotificationItem extends $pb.GeneratedMessage {
  factory PostNotificationItem({
    $fixnum.Int64? notificationId,
    PostNotificationType? type,
    PostAuthorRelation? actor,
    $fixnum.Int64? postId,
    $fixnum.Int64? commentId,
    $fixnum.Int64? replyCommentId,
    $core.String? previewText,
    $core.String? previewThumbUrl,
    $core.bool? isRead,
    $fixnum.Int64? readAt,
    $core.bool? isPostDeleted,
    $core.bool? isCommentDeleted,
    $core.bool? isReplyCommentDeleted,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
  }) {
    final $result = create();
    if (notificationId != null) {
      $result.notificationId = notificationId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (actor != null) {
      $result.actor = actor;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    if (commentId != null) {
      $result.commentId = commentId;
    }
    if (replyCommentId != null) {
      $result.replyCommentId = replyCommentId;
    }
    if (previewText != null) {
      $result.previewText = previewText;
    }
    if (previewThumbUrl != null) {
      $result.previewThumbUrl = previewThumbUrl;
    }
    if (isRead != null) {
      $result.isRead = isRead;
    }
    if (readAt != null) {
      $result.readAt = readAt;
    }
    if (isPostDeleted != null) {
      $result.isPostDeleted = isPostDeleted;
    }
    if (isCommentDeleted != null) {
      $result.isCommentDeleted = isCommentDeleted;
    }
    if (isReplyCommentDeleted != null) {
      $result.isReplyCommentDeleted = isReplyCommentDeleted;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PostNotificationItem._() : super();
  factory PostNotificationItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostNotificationItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostNotificationItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'notificationId')
    ..e<PostNotificationType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PostNotificationType.POST_LIKED, valueOf: PostNotificationType.valueOf, enumValues: PostNotificationType.values)
    ..aOM<PostAuthorRelation>(3, _omitFieldNames ? '' : 'actor', subBuilder: PostAuthorRelation.create)
    ..aInt64(4, _omitFieldNames ? '' : 'postId')
    ..aInt64(5, _omitFieldNames ? '' : 'commentId')
    ..aInt64(6, _omitFieldNames ? '' : 'replyCommentId')
    ..aOS(7, _omitFieldNames ? '' : 'previewText')
    ..aOS(8, _omitFieldNames ? '' : 'previewThumbUrl')
    ..aOB(9, _omitFieldNames ? '' : 'isRead')
    ..aInt64(10, _omitFieldNames ? '' : 'readAt')
    ..aOB(11, _omitFieldNames ? '' : 'isPostDeleted')
    ..aOB(12, _omitFieldNames ? '' : 'isCommentDeleted')
    ..aOB(13, _omitFieldNames ? '' : 'isReplyCommentDeleted')
    ..aInt64(14, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(15, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostNotificationItem clone() => PostNotificationItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostNotificationItem copyWith(void Function(PostNotificationItem) updates) => super.copyWith((message) => updates(message as PostNotificationItem)) as PostNotificationItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostNotificationItem create() => PostNotificationItem._();
  PostNotificationItem createEmptyInstance() => create();
  static $pb.PbList<PostNotificationItem> createRepeated() => $pb.PbList<PostNotificationItem>();
  @$core.pragma('dart2js:noInline')
  static PostNotificationItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostNotificationItem>(create);
  static PostNotificationItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get notificationId => $_getI64(0);
  @$pb.TagNumber(1)
  set notificationId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationId() => $_clearField(1);

  @$pb.TagNumber(2)
  PostNotificationType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(PostNotificationType v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  PostAuthorRelation get actor => $_getN(2);
  @$pb.TagNumber(3)
  set actor(PostAuthorRelation v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasActor() => $_has(2);
  @$pb.TagNumber(3)
  void clearActor() => $_clearField(3);
  @$pb.TagNumber(3)
  PostAuthorRelation ensureActor() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get postId => $_getI64(3);
  @$pb.TagNumber(4)
  set postId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostId() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get commentId => $_getI64(4);
  @$pb.TagNumber(5)
  set commentId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCommentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCommentId() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get replyCommentId => $_getI64(5);
  @$pb.TagNumber(6)
  set replyCommentId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReplyCommentId() => $_has(5);
  @$pb.TagNumber(6)
  void clearReplyCommentId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get previewText => $_getSZ(6);
  @$pb.TagNumber(7)
  set previewText($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPreviewText() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreviewText() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get previewThumbUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set previewThumbUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPreviewThumbUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearPreviewThumbUrl() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get isRead => $_getBF(8);
  @$pb.TagNumber(9)
  set isRead($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsRead() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsRead() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get readAt => $_getI64(9);
  @$pb.TagNumber(10)
  set readAt($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasReadAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearReadAt() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isPostDeleted => $_getBF(10);
  @$pb.TagNumber(11)
  set isPostDeleted($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsPostDeleted() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsPostDeleted() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isCommentDeleted => $_getBF(11);
  @$pb.TagNumber(12)
  set isCommentDeleted($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsCommentDeleted() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsCommentDeleted() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isReplyCommentDeleted => $_getBF(12);
  @$pb.TagNumber(13)
  set isReplyCommentDeleted($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsReplyCommentDeleted() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsReplyCommentDeleted() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get createdAt => $_getI64(13);
  @$pb.TagNumber(14)
  set createdAt($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreatedAt() => $_clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get updatedAt => $_getI64(14);
  @$pb.TagNumber(15)
  set updatedAt($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasUpdatedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdatedAt() => $_clearField(15);
}

class GetPostNotificationsResponse extends $pb.GeneratedMessage {
  factory GetPostNotificationsResponse({
    $core.Iterable<PostNotificationItem>? items,
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
  GetPostNotificationsResponse._() : super();
  factory GetPostNotificationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostNotificationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostNotificationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<PostNotificationItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: PostNotificationItem.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostNotificationsResponse clone() => GetPostNotificationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostNotificationsResponse copyWith(void Function(GetPostNotificationsResponse) updates) => super.copyWith((message) => updates(message as GetPostNotificationsResponse)) as GetPostNotificationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostNotificationsResponse create() => GetPostNotificationsResponse._();
  GetPostNotificationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostNotificationsResponse> createRepeated() => $pb.PbList<GetPostNotificationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostNotificationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostNotificationsResponse>(create);
  static GetPostNotificationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostNotificationItem> get items => $_getList(0);

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

class GetPostUnreadCountResponse extends $pb.GeneratedMessage {
  factory GetPostUnreadCountResponse({
    $fixnum.Int64? unreadCount,
  }) {
    final $result = create();
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    return $result;
  }
  GetPostUnreadCountResponse._() : super();
  factory GetPostUnreadCountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostUnreadCountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostUnreadCountResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'unreadCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostUnreadCountResponse clone() => GetPostUnreadCountResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostUnreadCountResponse copyWith(void Function(GetPostUnreadCountResponse) updates) => super.copyWith((message) => updates(message as GetPostUnreadCountResponse)) as GetPostUnreadCountResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostUnreadCountResponse create() => GetPostUnreadCountResponse._();
  GetPostUnreadCountResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostUnreadCountResponse> createRepeated() => $pb.PbList<GetPostUnreadCountResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostUnreadCountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostUnreadCountResponse>(create);
  static GetPostUnreadCountResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get unreadCount => $_getI64(0);
  @$pb.TagNumber(1)
  set unreadCount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadCount() => $_clearField(1);
}

class MarkPostNotificationsReadResponse extends $pb.GeneratedMessage {
  factory MarkPostNotificationsReadResponse({
    $core.bool? success,
    $fixnum.Int64? unreadCount,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    return $result;
  }
  MarkPostNotificationsReadResponse._() : super();
  factory MarkPostNotificationsReadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkPostNotificationsReadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkPostNotificationsReadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aInt64(2, _omitFieldNames ? '' : 'unreadCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkPostNotificationsReadResponse clone() => MarkPostNotificationsReadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkPostNotificationsReadResponse copyWith(void Function(MarkPostNotificationsReadResponse) updates) => super.copyWith((message) => updates(message as MarkPostNotificationsReadResponse)) as MarkPostNotificationsReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkPostNotificationsReadResponse create() => MarkPostNotificationsReadResponse._();
  MarkPostNotificationsReadResponse createEmptyInstance() => create();
  static $pb.PbList<MarkPostNotificationsReadResponse> createRepeated() => $pb.PbList<MarkPostNotificationsReadResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkPostNotificationsReadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkPostNotificationsReadResponse>(create);
  static MarkPostNotificationsReadResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get unreadCount => $_getI64(1);
  @$pb.TagNumber(2)
  set unreadCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnreadCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnreadCount() => $_clearField(2);
}

class MarkPostNotificationsReadRequest extends $pb.GeneratedMessage {
  factory MarkPostNotificationsReadRequest() => create();
  MarkPostNotificationsReadRequest._() : super();
  factory MarkPostNotificationsReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkPostNotificationsReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkPostNotificationsReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'app.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkPostNotificationsReadRequest clone() => MarkPostNotificationsReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkPostNotificationsReadRequest copyWith(void Function(MarkPostNotificationsReadRequest) updates) => super.copyWith((message) => updates(message as MarkPostNotificationsReadRequest)) as MarkPostNotificationsReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkPostNotificationsReadRequest create() => MarkPostNotificationsReadRequest._();
  MarkPostNotificationsReadRequest createEmptyInstance() => create();
  static $pb.PbList<MarkPostNotificationsReadRequest> createRepeated() => $pb.PbList<MarkPostNotificationsReadRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkPostNotificationsReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkPostNotificationsReadRequest>(create);
  static MarkPostNotificationsReadRequest? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
