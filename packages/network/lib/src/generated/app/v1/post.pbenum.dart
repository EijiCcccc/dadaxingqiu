///
//  Generated code. Do not modify.
//  source: app/v1/post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PostVisibility extends $pb.ProtobufEnum {
  static const PostVisibility UNSPECIFIED = PostVisibility._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPECIFIED');
  static const PostVisibility SELF_ONLY = PostVisibility._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SELF_ONLY');
  static const PostVisibility PUBLIC = PostVisibility._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUBLIC');
  static const PostVisibility FRIENDS_ONLY = PostVisibility._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FRIENDS_ONLY');
  static const PostVisibility SQUARE_ONLY = PostVisibility._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SQUARE_ONLY');

  static const $core.List<PostVisibility> values = <PostVisibility> [
    UNSPECIFIED,
    SELF_ONLY,
    PUBLIC,
    FRIENDS_ONLY,
    SQUARE_ONLY,
  ];

  static final $core.Map<$core.int, PostVisibility> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostVisibility? valueOf($core.int value) => _byValue[value];

  const PostVisibility._($core.int v, $core.String n) : super(v, n);
}

class PostNotificationType extends $pb.ProtobufEnum {
  static const PostNotificationType POST_LIKED = PostNotificationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST_LIKED');
  static const PostNotificationType POST_COMMENTED = PostNotificationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POST_COMMENTED');
  static const PostNotificationType COMMENT_REPLIED = PostNotificationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMENT_REPLIED');

  static const $core.List<PostNotificationType> values = <PostNotificationType> [
    POST_LIKED,
    POST_COMMENTED,
    COMMENT_REPLIED,
  ];

  static final $core.Map<$core.int, PostNotificationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostNotificationType? valueOf($core.int value) => _byValue[value];

  const PostNotificationType._($core.int v, $core.String n) : super(v, n);
}

