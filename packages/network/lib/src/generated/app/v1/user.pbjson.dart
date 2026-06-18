//
//  Generated code. Do not modify.
//  source: app/v1/user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userAvatarDescriptor instead')
const UserAvatar$json = {
  '1': 'UserAvatar',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `UserAvatar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAvatarDescriptor = $convert.base64Decode(
    'CgpVc2VyQXZhdGFyEhAKA3VybBgBIAEoCVIDdXJs');

@$core.Deprecated('Use userTagDescriptor instead')
const UserTag$json = {
  '1': 'UserTag',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `UserTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTagDescriptor = $convert.base64Decode(
    'CgdVc2VyVGFnEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBHR5cGUYAy'
    'ABKAlSBHR5cGU=');

@$core.Deprecated('Use tagGroupDescriptor instead')
const TagGroup$json = {
  '1': 'TagGroup',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'required', '3': 3, '4': 1, '5': 8, '10': 'required'},
    {'1': 'min_select', '3': 4, '4': 1, '5': 5, '10': 'minSelect'},
    {'1': 'max_select', '3': 5, '4': 1, '5': 5, '10': 'maxSelect'},
    {'1': 'items', '3': 6, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'items'},
  ],
};

/// Descriptor for `TagGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagGroupDescriptor = $convert.base64Decode(
    'CghUYWdHcm91cBISCgR0eXBlGAEgASgJUgR0eXBlEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIaCg'
    'hyZXF1aXJlZBgDIAEoCFIIcmVxdWlyZWQSHQoKbWluX3NlbGVjdBgEIAEoBVIJbWluU2VsZWN0'
    'Eh0KCm1heF9zZWxlY3QYBSABKAVSCW1heFNlbGVjdBIlCgVpdGVtcxgGIAMoCzIPLmFwcC52MS'
    '5Vc2VyVGFnUgVpdGVtcw==');

@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = {
  '1': 'UserProfile',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'status', '3': 5, '4': 1, '5': 5, '10': 'status'},
    {'1': 'is_profiled', '3': 6, '4': 1, '5': 8, '10': 'isProfiled'},
    {'1': 'is_tagged', '3': 7, '4': 1, '5': 8, '10': 'isTagged'},
    {'1': 'next_step', '3': 8, '4': 1, '5': 9, '10': 'nextStep'},
    {'1': 'avatar', '3': 9, '4': 1, '5': 11, '6': '.app.v1.UserAvatar', '10': 'avatar'},
    {'1': 'tags', '3': 10, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode(
    'CgtVc2VyUHJvZmlsZRIOCgJpZBgBIAEoCVICaWQSGgoIbmlja25hbWUYAiABKAlSCG5pY2tuYW'
    '1lEhYKBmdlbmRlchgDIAEoBVIGZ2VuZGVyEh0KCmF2YXRhcl91cmwYBCABKAlSCWF2YXRhclVy'
    'bBIWCgZzdGF0dXMYBSABKAVSBnN0YXR1cxIfCgtpc19wcm9maWxlZBgGIAEoCFIKaXNQcm9maW'
    'xlZBIbCglpc190YWdnZWQYByABKAhSCGlzVGFnZ2VkEhsKCW5leHRfc3RlcBgIIAEoCVIIbmV4'
    'dFN0ZXASKgoGYXZhdGFyGAkgASgLMhIuYXBwLnYxLlVzZXJBdmF0YXJSBmF2YXRhchIjCgR0YW'
    'dzGAogAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');

@$core.Deprecated('Use otherUserSummaryDescriptor instead')
const OtherUserSummary$json = {
  '1': 'OtherUserSummary',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'online_status', '3': 5, '4': 1, '5': 9, '10': 'onlineStatus'},
    {'1': 'tags', '3': 6, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `OtherUserSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List otherUserSummaryDescriptor = $convert.base64Decode(
    'ChBPdGhlclVzZXJTdW1tYXJ5Eg4KAmlkGAEgASgJUgJpZBIaCghuaWNrbmFtZRgCIAEoCVIIbm'
    'lja25hbWUSFgoGZ2VuZGVyGAMgASgFUgZnZW5kZXISHQoKYXZhdGFyX3VybBgEIAEoCVIJYXZh'
    'dGFyVXJsEiMKDW9ubGluZV9zdGF0dXMYBSABKAlSDG9ubGluZVN0YXR1cxIjCgR0YWdzGAYgAy'
    'gLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');

@$core.Deprecated('Use createAvatarUploadRequestDescriptor instead')
const CreateAvatarUploadRequest$json = {
  '1': 'CreateAvatarUploadRequest',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 2, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `CreateAvatarUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAvatarUploadRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVBdmF0YXJVcGxvYWRSZXF1ZXN0EhsKCWZpbGVfbmFtZRgBIAEoCVIIZmlsZU5hbW'
    'USIQoMY29udGVudF90eXBlGAIgASgJUgtjb250ZW50VHlwZQ==');

@$core.Deprecated('Use createAvatarUploadResponseDescriptor instead')
const CreateAvatarUploadResponse$json = {
  '1': 'CreateAvatarUploadResponse',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'upload_url', '3': 2, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'public_url', '3': 3, '4': 1, '5': 9, '10': 'publicUrl'},
    {'1': 'expires_in', '3': 4, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `CreateAvatarUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAvatarUploadResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVBdmF0YXJVcGxvYWRSZXNwb25zZRIdCgpvYmplY3Rfa2V5GAEgASgJUglvYmplY3'
    'RLZXkSHQoKdXBsb2FkX3VybBgCIAEoCVIJdXBsb2FkVXJsEh0KCnB1YmxpY191cmwYAyABKAlS'
    'CXB1YmxpY1VybBIdCgpleHBpcmVzX2luGAQgASgDUglleHBpcmVzSW4=');

@$core.Deprecated('Use updateMyProfileRequestDescriptor instead')
const UpdateMyProfileRequest$json = {
  '1': 'UpdateMyProfileRequest',
  '2': [
    {'1': 'nickname', '3': 1, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 2, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `UpdateMyProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyProfileRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVNeVByb2ZpbGVSZXF1ZXN0EhoKCG5pY2tuYW1lGAEgASgJUghuaWNrbmFtZRIWCg'
    'ZnZW5kZXIYAiABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJsGAMgASgJUglhdmF0YXJVcmw=');

@$core.Deprecated('Use updateMyProfileResponseDescriptor instead')
const UpdateMyProfileResponse$json = {
  '1': 'UpdateMyProfileResponse',
  '2': [
    {'1': 'updated', '3': 1, '4': 1, '5': 8, '10': 'updated'},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 4, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'status', '3': 6, '4': 1, '5': 5, '10': 'status'},
    {'1': 'is_profiled', '3': 7, '4': 1, '5': 8, '10': 'isProfiled'},
    {'1': 'is_tagged', '3': 8, '4': 1, '5': 8, '10': 'isTagged'},
    {'1': 'next_step', '3': 9, '4': 1, '5': 9, '10': 'nextStep'},
    {'1': 'avatar', '3': 10, '4': 1, '5': 11, '6': '.app.v1.UserAvatar', '10': 'avatar'},
    {'1': 'tags', '3': 11, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UpdateMyProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyProfileResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVNeVByb2ZpbGVSZXNwb25zZRIYCgd1cGRhdGVkGAEgASgIUgd1cGRhdGVkEg4KAm'
    'lkGAIgASgJUgJpZBIaCghuaWNrbmFtZRgDIAEoCVIIbmlja25hbWUSFgoGZ2VuZGVyGAQgASgF'
    'UgZnZW5kZXISHQoKYXZhdGFyX3VybBgFIAEoCVIJYXZhdGFyVXJsEhYKBnN0YXR1cxgGIAEoBV'
    'IGc3RhdHVzEh8KC2lzX3Byb2ZpbGVkGAcgASgIUgppc1Byb2ZpbGVkEhsKCWlzX3RhZ2dlZBgI'
    'IAEoCFIIaXNUYWdnZWQSGwoJbmV4dF9zdGVwGAkgASgJUghuZXh0U3RlcBIqCgZhdmF0YXIYCi'
    'ABKAsyEi5hcHAudjEuVXNlckF2YXRhclIGYXZhdGFyEiMKBHRhZ3MYCyADKAsyDy5hcHAudjEu'
    'VXNlclRhZ1IEdGFncw==');

@$core.Deprecated('Use getTagsResponseDescriptor instead')
const GetTagsResponse$json = {
  '1': 'GetTagsResponse',
  '2': [
    {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.app.v1.TagGroup', '10': 'groups'},
  ],
};

/// Descriptor for `GetTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTagsResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRUYWdzUmVzcG9uc2USKAoGZ3JvdXBzGAEgAygLMhAuYXBwLnYxLlRhZ0dyb3VwUgZncm'
    '91cHM=');

@$core.Deprecated('Use updateMyTagsRequestDescriptor instead')
const UpdateMyTagsRequest$json = {
  '1': 'UpdateMyTagsRequest',
  '2': [
    {'1': 'tag_ids', '3': 1, '4': 3, '5': 3, '10': 'tagIds'},
  ],
};

/// Descriptor for `UpdateMyTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyTagsRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVNeVRhZ3NSZXF1ZXN0EhcKB3RhZ19pZHMYASADKANSBnRhZ0lkcw==');

@$core.Deprecated('Use updateMyTagsResponseDescriptor instead')
const UpdateMyTagsResponse$json = {
  '1': 'UpdateMyTagsResponse',
  '2': [
    {'1': 'updated', '3': 1, '4': 1, '5': 8, '10': 'updated'},
    {'1': 'is_tagged', '3': 2, '4': 1, '5': 8, '10': 'isTagged'},
    {'1': 'next_step', '3': 3, '4': 1, '5': 9, '10': 'nextStep'},
    {'1': 'tags', '3': 4, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UpdateMyTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyTagsResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVNeVRhZ3NSZXNwb25zZRIYCgd1cGRhdGVkGAEgASgIUgd1cGRhdGVkEhsKCWlzX3'
    'RhZ2dlZBgCIAEoCFIIaXNUYWdnZWQSGwoJbmV4dF9zdGVwGAMgASgJUghuZXh0U3RlcBIjCgR0'
    'YWdzGAQgAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');

