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

import 'package:protobuf/protobuf.dart' as $pb;

class PostVisibility extends $pb.ProtobufEnum {
  static const PostVisibility UNSPECIFIED = PostVisibility._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const PostVisibility SELF_ONLY = PostVisibility._(1, _omitEnumNames ? '' : 'SELF_ONLY');
  static const PostVisibility PUBLIC = PostVisibility._(2, _omitEnumNames ? '' : 'PUBLIC');
  static const PostVisibility FRIENDS_ONLY = PostVisibility._(3, _omitEnumNames ? '' : 'FRIENDS_ONLY');
  static const PostVisibility SQUARE_ONLY = PostVisibility._(4, _omitEnumNames ? '' : 'SQUARE_ONLY');

  static const $core.List<PostVisibility> values = <PostVisibility> [
    UNSPECIFIED,
    SELF_ONLY,
    PUBLIC,
    FRIENDS_ONLY,
    SQUARE_ONLY,
  ];

  static final $core.Map<$core.int, PostVisibility> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostVisibility? valueOf($core.int value) => _byValue[value];

  const PostVisibility._(super.v, super.n);
}

class PostNotificationType extends $pb.ProtobufEnum {
  static const PostNotificationType POST_LIKED = PostNotificationType._(0, _omitEnumNames ? '' : 'POST_LIKED');
  static const PostNotificationType POST_COMMENTED = PostNotificationType._(1, _omitEnumNames ? '' : 'POST_COMMENTED');
  static const PostNotificationType COMMENT_REPLIED = PostNotificationType._(2, _omitEnumNames ? '' : 'COMMENT_REPLIED');

  static const $core.List<PostNotificationType> values = <PostNotificationType> [
    POST_LIKED,
    POST_COMMENTED,
    COMMENT_REPLIED,
  ];

  static final $core.Map<$core.int, PostNotificationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostNotificationType? valueOf($core.int value) => _byValue[value];

  const PostNotificationType._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
