//
//  Generated code. Do not modify.
//  source: app/v1/post.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use postVisibilityDescriptor instead')
const PostVisibility$json = {
  '1': 'PostVisibility',
  '2': [
    {'1': 'UNSPECIFIED', '2': 0},
    {'1': 'SELF_ONLY', '2': 1},
    {'1': 'PUBLIC', '2': 2},
    {'1': 'FRIENDS_ONLY', '2': 3},
    {'1': 'SQUARE_ONLY', '2': 4},
  ],
};

/// Descriptor for `PostVisibility`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List postVisibilityDescriptor = $convert.base64Decode(
    'Cg5Qb3N0VmlzaWJpbGl0eRIPCgtVTlNQRUNJRklFRBAAEg0KCVNFTEZfT05MWRABEgoKBlBVQk'
    'xJQxACEhAKDEZSSUVORFNfT05MWRADEg8KC1NRVUFSRV9PTkxZEAQ=');

@$core.Deprecated('Use postNotificationTypeDescriptor instead')
const PostNotificationType$json = {
  '1': 'PostNotificationType',
  '2': [
    {'1': 'POST_LIKED', '2': 0},
    {'1': 'POST_COMMENTED', '2': 1},
    {'1': 'COMMENT_REPLIED', '2': 2},
  ],
};

/// Descriptor for `PostNotificationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List postNotificationTypeDescriptor = $convert.base64Decode(
    'ChRQb3N0Tm90aWZpY2F0aW9uVHlwZRIOCgpQT1NUX0xJS0VEEAASEgoOUE9TVF9DT01NRU5URU'
    'QQARITCg9DT01NRU5UX1JFUExJRUQQAg==');

@$core.Deprecated('Use followUserRequestDescriptor instead')
const FollowUserRequest$json = {
  '1': 'FollowUserRequest',
  '2': [
    {'1': 'target_user_id', '3': 1, '4': 1, '5': 9, '10': 'targetUserId'},
  ],
};

/// Descriptor for `FollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followUserRequestDescriptor = $convert.base64Decode(
    'ChFGb2xsb3dVc2VyUmVxdWVzdBIkCg50YXJnZXRfdXNlcl9pZBgBIAEoCVIMdGFyZ2V0VXNlck'
    'lk');

@$core.Deprecated('Use followUserResponseDescriptor instead')
const FollowUserResponse$json = {
  '1': 'FollowUserResponse',
  '2': [
    {'1': 'relation', '3': 1, '4': 1, '5': 11, '6': '.app.v1.GetFollowRelationResponse', '10': 'relation'},
  ],
};

/// Descriptor for `FollowUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followUserResponseDescriptor = $convert.base64Decode(
    'ChJGb2xsb3dVc2VyUmVzcG9uc2USPQoIcmVsYXRpb24YASABKAsyIS5hcHAudjEuR2V0Rm9sbG'
    '93UmVsYXRpb25SZXNwb25zZVIIcmVsYXRpb24=');

@$core.Deprecated('Use unfollowUserRequestDescriptor instead')
const UnfollowUserRequest$json = {
  '1': 'UnfollowUserRequest',
  '2': [
    {'1': 'target_user_id', '3': 1, '4': 1, '5': 9, '10': 'targetUserId'},
  ],
};

/// Descriptor for `UnfollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfollowUserRequestDescriptor = $convert.base64Decode(
    'ChNVbmZvbGxvd1VzZXJSZXF1ZXN0EiQKDnRhcmdldF91c2VyX2lkGAEgASgJUgx0YXJnZXRVc2'
    'VySWQ=');

@$core.Deprecated('Use unfollowUserResponseDescriptor instead')
const UnfollowUserResponse$json = {
  '1': 'UnfollowUserResponse',
  '2': [
    {'1': 'relation', '3': 1, '4': 1, '5': 11, '6': '.app.v1.GetFollowRelationResponse', '10': 'relation'},
  ],
};

/// Descriptor for `UnfollowUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfollowUserResponseDescriptor = $convert.base64Decode(
    'ChRVbmZvbGxvd1VzZXJSZXNwb25zZRI9CghyZWxhdGlvbhgBIAEoCzIhLmFwcC52MS5HZXRGb2'
    'xsb3dSZWxhdGlvblJlc3BvbnNlUghyZWxhdGlvbg==');

@$core.Deprecated('Use getFollowRelationResponseDescriptor instead')
const GetFollowRelationResponse$json = {
  '1': 'GetFollowRelationResponse',
  '2': [
    {'1': 'target_user_id', '3': 1, '4': 1, '5': 9, '10': 'targetUserId'},
    {'1': 'is_following', '3': 2, '4': 1, '5': 8, '10': 'isFollowing'},
    {'1': 'is_followed_by_target_user', '3': 3, '4': 1, '5': 8, '10': 'isFollowedByTargetUser'},
    {'1': 'is_mutual_follow', '3': 4, '4': 1, '5': 8, '10': 'isMutualFollow'},
  ],
};

/// Descriptor for `GetFollowRelationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowRelationResponseDescriptor = $convert.base64Decode(
    'ChlHZXRGb2xsb3dSZWxhdGlvblJlc3BvbnNlEiQKDnRhcmdldF91c2VyX2lkGAEgASgJUgx0YX'
    'JnZXRVc2VySWQSIQoMaXNfZm9sbG93aW5nGAIgASgIUgtpc0ZvbGxvd2luZxI6Chppc19mb2xs'
    'b3dlZF9ieV90YXJnZXRfdXNlchgDIAEoCFIWaXNGb2xsb3dlZEJ5VGFyZ2V0VXNlchIoChBpc1'
    '9tdXR1YWxfZm9sbG93GAQgASgIUg5pc011dHVhbEZvbGxvdw==');

@$core.Deprecated('Use postImageDescriptor instead')
const PostImage$json = {
  '1': 'PostImage',
  '2': [
    {'1': 'image_url', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'thumb_url', '3': 2, '4': 1, '5': 9, '10': 'thumbUrl'},
    {'1': 'sort_order', '3': 3, '4': 1, '5': 5, '10': 'sortOrder'},
  ],
};

/// Descriptor for `PostImage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postImageDescriptor = $convert.base64Decode(
    'CglQb3N0SW1hZ2USGwoJaW1hZ2VfdXJsGAEgASgJUghpbWFnZVVybBIbCgl0aHVtYl91cmwYAi'
    'ABKAlSCHRodW1iVXJsEh0KCnNvcnRfb3JkZXIYAyABKAVSCXNvcnRPcmRlcg==');

@$core.Deprecated('Use postAuthorRelationDescriptor instead')
const PostAuthorRelation$json = {
  '1': 'PostAuthorRelation',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'is_following', '3': 5, '4': 1, '5': 8, '10': 'isFollowing'},
    {'1': 'is_followed_by', '3': 6, '4': 1, '5': 8, '10': 'isFollowedBy'},
    {'1': 'is_mutual_follow', '3': 7, '4': 1, '5': 8, '10': 'isMutualFollow'},
  ],
};

/// Descriptor for `PostAuthorRelation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postAuthorRelationDescriptor = $convert.base64Decode(
    'ChJQb3N0QXV0aG9yUmVsYXRpb24SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2tuYW'
    '1lGAIgASgJUghuaWNrbmFtZRIWCgZnZW5kZXIYAyABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJs'
    'GAQgASgJUglhdmF0YXJVcmwSIQoMaXNfZm9sbG93aW5nGAUgASgIUgtpc0ZvbGxvd2luZxIkCg'
    '5pc19mb2xsb3dlZF9ieRgGIAEoCFIMaXNGb2xsb3dlZEJ5EigKEGlzX211dHVhbF9mb2xsb3cY'
    'ByABKAhSDmlzTXV0dWFsRm9sbG93');

@$core.Deprecated('Use postItemDescriptor instead')
const PostItem$json = {
  '1': 'PostItem',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'author', '3': 2, '4': 1, '5': 11, '6': '.app.v1.PostAuthorRelation', '10': 'author'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'images', '3': 4, '4': 3, '5': 11, '6': '.app.v1.PostImage', '10': 'images'},
    {'1': 'visibility', '3': 5, '4': 1, '5': 14, '6': '.app.v1.PostVisibility', '10': 'visibility'},
    {'1': 'is_deleted', '3': 6, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deleted_at', '3': 7, '4': 1, '5': 3, '10': 'deletedAt'},
    {'1': 'like_count', '3': 8, '4': 1, '5': 3, '10': 'likeCount'},
    {'1': 'comment_count', '3': 9, '4': 1, '5': 3, '10': 'commentCount'},
    {'1': 'is_liked_by_me', '3': 10, '4': 1, '5': 8, '10': 'isLikedByMe'},
    {'1': 'created_at', '3': 11, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 12, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `PostItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postItemDescriptor = $convert.base64Decode(
    'CghQb3N0SXRlbRIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQSMgoGYXV0aG9yGAIgASgLMhouYX'
    'BwLnYxLlBvc3RBdXRob3JSZWxhdGlvblIGYXV0aG9yEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRl'
    'bnQSKQoGaW1hZ2VzGAQgAygLMhEuYXBwLnYxLlBvc3RJbWFnZVIGaW1hZ2VzEjYKCnZpc2liaW'
    'xpdHkYBSABKA4yFi5hcHAudjEuUG9zdFZpc2liaWxpdHlSCnZpc2liaWxpdHkSHQoKaXNfZGVs'
    'ZXRlZBgGIAEoCFIJaXNEZWxldGVkEh0KCmRlbGV0ZWRfYXQYByABKANSCWRlbGV0ZWRBdBIdCg'
    'psaWtlX2NvdW50GAggASgDUglsaWtlQ291bnQSIwoNY29tbWVudF9jb3VudBgJIAEoA1IMY29t'
    'bWVudENvdW50EiMKDmlzX2xpa2VkX2J5X21lGAogASgIUgtpc0xpa2VkQnlNZRIdCgpjcmVhdG'
    'VkX2F0GAsgASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgMIAEoA1IJdXBkYXRlZEF0');

@$core.Deprecated('Use getSquarePostsResponseDescriptor instead')
const GetSquarePostsResponse$json = {
  '1': 'GetSquarePostsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.PostItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetSquarePostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSquarePostsResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTcXVhcmVQb3N0c1Jlc3BvbnNlEiYKBWl0ZW1zGAEgAygLMhAuYXBwLnYxLlBvc3RJdG'
    'VtUgVpdGVtcxISCgRwYWdlGAIgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgDIAEoBVIIcGFnZVNp'
    'emUSGQoIaGFzX21vcmUYBCABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use getFriendPostsResponseDescriptor instead')
const GetFriendPostsResponse$json = {
  '1': 'GetFriendPostsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.PostItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetFriendPostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendPostsResponseDescriptor = $convert.base64Decode(
    'ChZHZXRGcmllbmRQb3N0c1Jlc3BvbnNlEiYKBWl0ZW1zGAEgAygLMhAuYXBwLnYxLlBvc3RJdG'
    'VtUgVpdGVtcxISCgRwYWdlGAIgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgDIAEoBVIIcGFnZVNp'
    'emUSGQoIaGFzX21vcmUYBCABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use createPostImageUploadRequestDescriptor instead')
const CreatePostImageUploadRequest$json = {
  '1': 'CreatePostImageUploadRequest',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 2, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `CreatePostImageUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostImageUploadRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVQb3N0SW1hZ2VVcGxvYWRSZXF1ZXN0EhsKCWZpbGVfbmFtZRgBIAEoCVIIZmlsZU'
    '5hbWUSIQoMY29udGVudF90eXBlGAIgASgJUgtjb250ZW50VHlwZQ==');

@$core.Deprecated('Use createPostImageUploadResponseDescriptor instead')
const CreatePostImageUploadResponse$json = {
  '1': 'CreatePostImageUploadResponse',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'upload_url', '3': 2, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'public_url', '3': 3, '4': 1, '5': 9, '10': 'publicUrl'},
    {'1': 'expires_in', '3': 4, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `CreatePostImageUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostImageUploadResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVQb3N0SW1hZ2VVcGxvYWRSZXNwb25zZRIdCgpvYmplY3Rfa2V5GAEgASgJUglvYm'
    'plY3RLZXkSHQoKdXBsb2FkX3VybBgCIAEoCVIJdXBsb2FkVXJsEh0KCnB1YmxpY191cmwYAyAB'
    'KAlSCXB1YmxpY1VybBIdCgpleHBpcmVzX2luGAQgASgDUglleHBpcmVzSW4=');

@$core.Deprecated('Use createPostRequestDescriptor instead')
const CreatePostRequest$json = {
  '1': 'CreatePostRequest',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    {'1': 'image_urls', '3': 2, '4': 3, '5': 9, '10': 'imageUrls'},
    {'1': 'visibility', '3': 3, '4': 1, '5': 14, '6': '.app.v1.PostVisibility', '10': 'visibility'},
  ],
};

/// Descriptor for `CreatePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVQb3N0UmVxdWVzdBIYCgdjb250ZW50GAEgASgJUgdjb250ZW50Eh0KCmltYWdlX3'
    'VybHMYAiADKAlSCWltYWdlVXJscxI2Cgp2aXNpYmlsaXR5GAMgASgOMhYuYXBwLnYxLlBvc3RW'
    'aXNpYmlsaXR5Ugp2aXNpYmlsaXR5');

@$core.Deprecated('Use createPostResponseDescriptor instead')
const CreatePostResponse$json = {
  '1': 'CreatePostResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.app.v1.PostItem', '10': 'post'},
  ],
};

/// Descriptor for `CreatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVQb3N0UmVzcG9uc2USJAoEcG9zdBgBIAEoCzIQLmFwcC52MS5Qb3N0SXRlbVIEcG'
    '9zdA==');

@$core.Deprecated('Use getPostDetailResponseDescriptor instead')
const GetPostDetailResponse$json = {
  '1': 'GetPostDetailResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.app.v1.PostItem', '10': 'post'},
  ],
};

/// Descriptor for `GetPostDetailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostDetailResponseDescriptor = $convert.base64Decode(
    'ChVHZXRQb3N0RGV0YWlsUmVzcG9uc2USJAoEcG9zdBgBIAEoCzIQLmFwcC52MS5Qb3N0SXRlbV'
    'IEcG9zdA==');

@$core.Deprecated('Use postCommentItemDescriptor instead')
const PostCommentItem$json = {
  '1': 'PostCommentItem',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 3, '10': 'commentId'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'author', '3': 3, '4': 1, '5': 11, '6': '.app.v1.PostAuthorRelation', '10': 'author'},
    {'1': 'reply_to_comment_id', '3': 4, '4': 1, '5': 3, '10': 'replyToCommentId'},
    {'1': 'reply_to_user_id', '3': 5, '4': 1, '5': 9, '10': 'replyToUserId'},
    {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    {'1': 'display_content', '3': 7, '4': 1, '5': 9, '10': 'displayContent'},
    {'1': 'is_deleted', '3': 8, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deleted_at', '3': 9, '4': 1, '5': 3, '10': 'deletedAt'},
    {'1': 'created_at', '3': 10, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 11, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `PostCommentItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postCommentItemDescriptor = $convert.base64Decode(
    'Cg9Qb3N0Q29tbWVudEl0ZW0SHQoKY29tbWVudF9pZBgBIAEoA1IJY29tbWVudElkEhcKB3Bvc3'
    'RfaWQYAiABKANSBnBvc3RJZBIyCgZhdXRob3IYAyABKAsyGi5hcHAudjEuUG9zdEF1dGhvclJl'
    'bGF0aW9uUgZhdXRob3ISLQoTcmVwbHlfdG9fY29tbWVudF9pZBgEIAEoA1IQcmVwbHlUb0NvbW'
    '1lbnRJZBInChByZXBseV90b191c2VyX2lkGAUgASgJUg1yZXBseVRvVXNlcklkEhgKB2NvbnRl'
    'bnQYBiABKAlSB2NvbnRlbnQSJwoPZGlzcGxheV9jb250ZW50GAcgASgJUg5kaXNwbGF5Q29udG'
    'VudBIdCgppc19kZWxldGVkGAggASgIUglpc0RlbGV0ZWQSHQoKZGVsZXRlZF9hdBgJIAEoA1IJ'
    'ZGVsZXRlZEF0Eh0KCmNyZWF0ZWRfYXQYCiABKANSCWNyZWF0ZWRBdBIdCgp1cGRhdGVkX2F0GA'
    'sgASgDUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use getPostCommentsResponseDescriptor instead')
const GetPostCommentsResponse$json = {
  '1': 'GetPostCommentsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.PostCommentItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetPostCommentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostCommentsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRQb3N0Q29tbWVudHNSZXNwb25zZRItCgVpdGVtcxgBIAMoCzIXLmFwcC52MS5Qb3N0Q2'
    '9tbWVudEl0ZW1SBWl0ZW1zEhIKBHBhZ2UYAiABKAVSBHBhZ2USGwoJcGFnZV9zaXplGAMgASgF'
    'UghwYWdlU2l6ZRIZCghoYXNfbW9yZRgEIAEoCFIHaGFzTW9yZQ==');

@$core.Deprecated('Use getPostLikesResponseDescriptor instead')
const GetPostLikesResponse$json = {
  '1': 'GetPostLikesResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.PostAuthorRelation', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetPostLikesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostLikesResponseDescriptor = $convert.base64Decode(
    'ChRHZXRQb3N0TGlrZXNSZXNwb25zZRIwCgVpdGVtcxgBIAMoCzIaLmFwcC52MS5Qb3N0QXV0aG'
    '9yUmVsYXRpb25SBWl0ZW1zEhIKBHBhZ2UYAiABKAVSBHBhZ2USGwoJcGFnZV9zaXplGAMgASgF'
    'UghwYWdlU2l6ZRIZCghoYXNfbW9yZRgEIAEoCFIHaGFzTW9yZQ==');

@$core.Deprecated('Use likePostRequestDescriptor instead')
const LikePostRequest$json = {
  '1': 'LikePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `LikePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostRequestDescriptor = $convert.base64Decode(
    'Cg9MaWtlUG9zdFJlcXVlc3QSFwoHcG9zdF9pZBgBIAEoA1IGcG9zdElk');

@$core.Deprecated('Use likePostResponseDescriptor instead')
const LikePostResponse$json = {
  '1': 'LikePostResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'like_count', '3': 2, '4': 1, '5': 3, '10': 'likeCount'},
    {'1': 'is_liked', '3': 3, '4': 1, '5': 8, '10': 'isLiked'},
  ],
};

/// Descriptor for `LikePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostResponseDescriptor = $convert.base64Decode(
    'ChBMaWtlUG9zdFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHQoKbGlrZV9jb3'
    'VudBgCIAEoA1IJbGlrZUNvdW50EhkKCGlzX2xpa2VkGAMgASgIUgdpc0xpa2Vk');

@$core.Deprecated('Use unlikePostRequestDescriptor instead')
const UnlikePostRequest$json = {
  '1': 'UnlikePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `UnlikePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlikePostRequestDescriptor = $convert.base64Decode(
    'ChFVbmxpa2VQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQ=');

@$core.Deprecated('Use unlikePostResponseDescriptor instead')
const UnlikePostResponse$json = {
  '1': 'UnlikePostResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'like_count', '3': 2, '4': 1, '5': 3, '10': 'likeCount'},
    {'1': 'is_liked', '3': 3, '4': 1, '5': 8, '10': 'isLiked'},
  ],
};

/// Descriptor for `UnlikePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unlikePostResponseDescriptor = $convert.base64Decode(
    'ChJVbmxpa2VQb3N0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIdCgpsaWtlX2'
    'NvdW50GAIgASgDUglsaWtlQ291bnQSGQoIaXNfbGlrZWQYAyABKAhSB2lzTGlrZWQ=');

@$core.Deprecated('Use createPostCommentRequestDescriptor instead')
const CreatePostCommentRequest$json = {
  '1': 'CreatePostCommentRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `CreatePostCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostCommentRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVQb3N0Q29tbWVudFJlcXVlc3QSFwoHcG9zdF9pZBgBIAEoA1IGcG9zdElkEhgKB2'
    'NvbnRlbnQYAiABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use createPostCommentResponseDescriptor instead')
const CreatePostCommentResponse$json = {
  '1': 'CreatePostCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.app.v1.PostCommentItem', '10': 'comment'},
  ],
};

/// Descriptor for `CreatePostCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPostCommentResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVQb3N0Q29tbWVudFJlc3BvbnNlEjEKB2NvbW1lbnQYASABKAsyFy5hcHAudjEuUG'
    '9zdENvbW1lbnRJdGVtUgdjb21tZW50');

@$core.Deprecated('Use replyPostCommentRequestDescriptor instead')
const ReplyPostCommentRequest$json = {
  '1': 'ReplyPostCommentRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'comment_id', '3': 2, '4': 1, '5': 3, '10': 'commentId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `ReplyPostCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyPostCommentRequestDescriptor = $convert.base64Decode(
    'ChdSZXBseVBvc3RDb21tZW50UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQSHQoKY2'
    '9tbWVudF9pZBgCIAEoA1IJY29tbWVudElkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use replyPostCommentResponseDescriptor instead')
const ReplyPostCommentResponse$json = {
  '1': 'ReplyPostCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.app.v1.PostCommentItem', '10': 'comment'},
  ],
};

/// Descriptor for `ReplyPostCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyPostCommentResponseDescriptor = $convert.base64Decode(
    'ChhSZXBseVBvc3RDb21tZW50UmVzcG9uc2USMQoHY29tbWVudBgBIAEoCzIXLmFwcC52MS5Qb3'
    'N0Q29tbWVudEl0ZW1SB2NvbW1lbnQ=');

@$core.Deprecated('Use deletePostCommentRequestDescriptor instead')
const DeletePostCommentRequest$json = {
  '1': 'DeletePostCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 3, '10': 'commentId'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `DeletePostCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostCommentRequestDescriptor = $convert.base64Decode(
    'ChhEZWxldGVQb3N0Q29tbWVudFJlcXVlc3QSHQoKY29tbWVudF9pZBgBIAEoA1IJY29tbWVudE'
    'lkEhcKB3Bvc3RfaWQYAiABKANSBnBvc3RJZA==');

@$core.Deprecated('Use deletePostCommentResponseDescriptor instead')
const DeletePostCommentResponse$json = {
  '1': 'DeletePostCommentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePostCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostCommentResponseDescriptor = $convert.base64Decode(
    'ChlEZWxldGVQb3N0Q29tbWVudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use deletePostRequestDescriptor instead')
const DeletePostRequest$json = {
  '1': 'DeletePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `DeletePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQ=');

@$core.Deprecated('Use deletePostResponseDescriptor instead')
const DeletePostResponse$json = {
  '1': 'DeletePostResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVQb3N0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use updatePostVisibilityRequestDescriptor instead')
const UpdatePostVisibilityRequest$json = {
  '1': 'UpdatePostVisibilityRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'visibility', '3': 2, '4': 1, '5': 14, '6': '.app.v1.PostVisibility', '10': 'visibility'},
  ],
};

/// Descriptor for `UpdatePostVisibilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostVisibilityRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVQb3N0VmlzaWJpbGl0eVJlcXVlc3QSFwoHcG9zdF9pZBgBIAEoA1IGcG9zdElkEj'
    'YKCnZpc2liaWxpdHkYAiABKA4yFi5hcHAudjEuUG9zdFZpc2liaWxpdHlSCnZpc2liaWxpdHk=');

@$core.Deprecated('Use updatePostVisibilityResponseDescriptor instead')
const UpdatePostVisibilityResponse$json = {
  '1': 'UpdatePostVisibilityResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.app.v1.PostItem', '10': 'post'},
  ],
};

/// Descriptor for `UpdatePostVisibilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostVisibilityResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVQb3N0VmlzaWJpbGl0eVJlc3BvbnNlEiQKBHBvc3QYASABKAsyEC5hcHAudjEuUG'
    '9zdEl0ZW1SBHBvc3Q=');

@$core.Deprecated('Use postNotificationItemDescriptor instead')
const PostNotificationItem$json = {
  '1': 'PostNotificationItem',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 3, '10': 'notificationId'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.app.v1.PostNotificationType', '10': 'type'},
    {'1': 'actor', '3': 3, '4': 1, '5': 11, '6': '.app.v1.PostAuthorRelation', '10': 'actor'},
    {'1': 'post_id', '3': 4, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'comment_id', '3': 5, '4': 1, '5': 3, '10': 'commentId'},
    {'1': 'reply_comment_id', '3': 6, '4': 1, '5': 3, '10': 'replyCommentId'},
    {'1': 'preview_text', '3': 7, '4': 1, '5': 9, '10': 'previewText'},
    {'1': 'preview_thumb_url', '3': 8, '4': 1, '5': 9, '10': 'previewThumbUrl'},
    {'1': 'is_read', '3': 9, '4': 1, '5': 8, '10': 'isRead'},
    {'1': 'read_at', '3': 10, '4': 1, '5': 3, '10': 'readAt'},
    {'1': 'is_post_deleted', '3': 11, '4': 1, '5': 8, '10': 'isPostDeleted'},
    {'1': 'is_comment_deleted', '3': 12, '4': 1, '5': 8, '10': 'isCommentDeleted'},
    {'1': 'is_reply_comment_deleted', '3': 13, '4': 1, '5': 8, '10': 'isReplyCommentDeleted'},
    {'1': 'created_at', '3': 14, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 15, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `PostNotificationItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postNotificationItemDescriptor = $convert.base64Decode(
    'ChRQb3N0Tm90aWZpY2F0aW9uSXRlbRInCg9ub3RpZmljYXRpb25faWQYASABKANSDm5vdGlmaW'
    'NhdGlvbklkEjAKBHR5cGUYAiABKA4yHC5hcHAudjEuUG9zdE5vdGlmaWNhdGlvblR5cGVSBHR5'
    'cGUSMAoFYWN0b3IYAyABKAsyGi5hcHAudjEuUG9zdEF1dGhvclJlbGF0aW9uUgVhY3RvchIXCg'
    'dwb3N0X2lkGAQgASgDUgZwb3N0SWQSHQoKY29tbWVudF9pZBgFIAEoA1IJY29tbWVudElkEigK'
    'EHJlcGx5X2NvbW1lbnRfaWQYBiABKANSDnJlcGx5Q29tbWVudElkEiEKDHByZXZpZXdfdGV4dB'
    'gHIAEoCVILcHJldmlld1RleHQSKgoRcHJldmlld190aHVtYl91cmwYCCABKAlSD3ByZXZpZXdU'
    'aHVtYlVybBIXCgdpc19yZWFkGAkgASgIUgZpc1JlYWQSFwoHcmVhZF9hdBgKIAEoA1IGcmVhZE'
    'F0EiYKD2lzX3Bvc3RfZGVsZXRlZBgLIAEoCFINaXNQb3N0RGVsZXRlZBIsChJpc19jb21tZW50'
    'X2RlbGV0ZWQYDCABKAhSEGlzQ29tbWVudERlbGV0ZWQSNwoYaXNfcmVwbHlfY29tbWVudF9kZW'
    'xldGVkGA0gASgIUhVpc1JlcGx5Q29tbWVudERlbGV0ZWQSHQoKY3JlYXRlZF9hdBgOIAEoA1IJ'
    'Y3JlYXRlZEF0Eh0KCnVwZGF0ZWRfYXQYDyABKANSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use getPostNotificationsResponseDescriptor instead')
const GetPostNotificationsResponse$json = {
  '1': 'GetPostNotificationsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.PostNotificationItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetPostNotificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostNotificationsResponseDescriptor = $convert.base64Decode(
    'ChxHZXRQb3N0Tm90aWZpY2F0aW9uc1Jlc3BvbnNlEjIKBWl0ZW1zGAEgAygLMhwuYXBwLnYxLl'
    'Bvc3ROb3RpZmljYXRpb25JdGVtUgVpdGVtcxISCgRwYWdlGAIgASgFUgRwYWdlEhsKCXBhZ2Vf'
    'c2l6ZRgDIAEoBVIIcGFnZVNpemUSGQoIaGFzX21vcmUYBCABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use getPostUnreadCountResponseDescriptor instead')
const GetPostUnreadCountResponse$json = {
  '1': 'GetPostUnreadCountResponse',
  '2': [
    {'1': 'unread_count', '3': 1, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `GetPostUnreadCountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostUnreadCountResponseDescriptor = $convert.base64Decode(
    'ChpHZXRQb3N0VW5yZWFkQ291bnRSZXNwb25zZRIhCgx1bnJlYWRfY291bnQYASABKANSC3Vucm'
    'VhZENvdW50');

@$core.Deprecated('Use markPostNotificationsReadResponseDescriptor instead')
const MarkPostNotificationsReadResponse$json = {
  '1': 'MarkPostNotificationsReadResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'unread_count', '3': 2, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `MarkPostNotificationsReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markPostNotificationsReadResponseDescriptor = $convert.base64Decode(
    'CiFNYXJrUG9zdE5vdGlmaWNhdGlvbnNSZWFkUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3'
    'VjY2VzcxIhCgx1bnJlYWRfY291bnQYAiABKANSC3VucmVhZENvdW50');

@$core.Deprecated('Use markPostNotificationsReadRequestDescriptor instead')
const MarkPostNotificationsReadRequest$json = {
  '1': 'MarkPostNotificationsReadRequest',
};

/// Descriptor for `MarkPostNotificationsReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markPostNotificationsReadRequestDescriptor = $convert.base64Decode(
    'CiBNYXJrUG9zdE5vdGlmaWNhdGlvbnNSZWFkUmVxdWVzdA==');

