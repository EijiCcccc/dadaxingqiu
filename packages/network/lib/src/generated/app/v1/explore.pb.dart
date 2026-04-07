///
//  Generated code. Do not modify.
//  source: app/v1/explore.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

class ExploreCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ExploreCard', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatarUrl')
    ..pc<$0.UserTag>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $0.UserTag.create)
    ..hasRequiredFields = false
  ;

  ExploreCard._() : super();
  factory ExploreCard({
    $fixnum.Int64? userId,
    $core.String? nickname,
    $core.int? gender,
    $core.String? avatarUrl,
    $core.Iterable<$0.UserTag>? tags,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
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
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    return _result;
  }
  factory ExploreCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExploreCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExploreCard clone() => ExploreCard()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExploreCard copyWith(void Function(ExploreCard) updates) => super.copyWith((message) => updates(message as ExploreCard)) as ExploreCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExploreCard create() => ExploreCard._();
  ExploreCard createEmptyInstance() => create();
  static $pb.PbList<ExploreCard> createRepeated() => $pb.PbList<ExploreCard>();
  @$core.pragma('dart2js:noInline')
  static ExploreCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExploreCard>(create);
  static ExploreCard? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

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
  $core.List<$0.UserTag> get tags => $_getList(4);
}

class GetExploreCardsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetExploreCardsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'app.v1'), createEmptyInstance: create)
    ..pc<ExploreCard>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', $pb.PbFieldType.PM, subBuilder: ExploreCard.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  GetExploreCardsResponse._() : super();
  factory GetExploreCardsResponse({
    $core.Iterable<ExploreCard>? items,
    $core.int? page,
    $core.int? pageSize,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (page != null) {
      _result.page = page;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory GetExploreCardsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetExploreCardsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetExploreCardsResponse clone() => GetExploreCardsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetExploreCardsResponse copyWith(void Function(GetExploreCardsResponse) updates) => super.copyWith((message) => updates(message as GetExploreCardsResponse)) as GetExploreCardsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetExploreCardsResponse create() => GetExploreCardsResponse._();
  GetExploreCardsResponse createEmptyInstance() => create();
  static $pb.PbList<GetExploreCardsResponse> createRepeated() => $pb.PbList<GetExploreCardsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetExploreCardsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetExploreCardsResponse>(create);
  static GetExploreCardsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ExploreCard> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasMore => $_getBF(3);
  @$pb.TagNumber(4)
  set hasMore($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasMore() => clearField(4);
}

