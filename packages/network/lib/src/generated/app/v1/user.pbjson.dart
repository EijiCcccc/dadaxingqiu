///
//  Generated code. Do not modify.
//  source: app/v1/user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userAvatarDescriptor instead')
const UserAvatar$json = const {
  '1': 'UserAvatar',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `UserAvatar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userAvatarDescriptor = $convert.base64Decode('CgpVc2VyQXZhdGFyEhAKA3VybBgBIAEoCVIDdXJs');
@$core.Deprecated('Use userTagDescriptor instead')
const UserTag$json = const {
  '1': 'UserTag',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
  ],
};

/// Descriptor for `UserTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTagDescriptor = $convert.base64Decode('CgdVc2VyVGFnEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBHR5cGUYAyABKAlSBHR5cGU=');
@$core.Deprecated('Use tagGroupDescriptor instead')
const TagGroup$json = const {
  '1': 'TagGroup',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'required', '3': 3, '4': 1, '5': 8, '10': 'required'},
    const {'1': 'min_select', '3': 4, '4': 1, '5': 5, '10': 'minSelect'},
    const {'1': 'max_select', '3': 5, '4': 1, '5': 5, '10': 'maxSelect'},
    const {'1': 'items', '3': 6, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'items'},
  ],
};

/// Descriptor for `TagGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagGroupDescriptor = $convert.base64Decode('CghUYWdHcm91cBISCgR0eXBlGAEgASgJUgR0eXBlEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIaCghyZXF1aXJlZBgDIAEoCFIIcmVxdWlyZWQSHQoKbWluX3NlbGVjdBgEIAEoBVIJbWluU2VsZWN0Eh0KCm1heF9zZWxlY3QYBSABKAVSCW1heFNlbGVjdBIlCgVpdGVtcxgGIAMoCzIPLmFwcC52MS5Vc2VyVGFnUgVpdGVtcw==');
@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = const {
  '1': 'UserProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    const {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'status', '3': 5, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'is_profiled', '3': 6, '4': 1, '5': 8, '10': 'isProfiled'},
    const {'1': 'is_tagged', '3': 7, '4': 1, '5': 8, '10': 'isTagged'},
    const {'1': 'next_step', '3': 8, '4': 1, '5': 9, '10': 'nextStep'},
    const {'1': 'avatar', '3': 9, '4': 1, '5': 11, '6': '.app.v1.UserAvatar', '10': 'avatar'},
    const {'1': 'tags', '3': 10, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode('CgtVc2VyUHJvZmlsZRIOCgJpZBgBIAEoA1ICaWQSGgoIbmlja25hbWUYAiABKAlSCG5pY2tuYW1lEhYKBmdlbmRlchgDIAEoBVIGZ2VuZGVyEh0KCmF2YXRhcl91cmwYBCABKAlSCWF2YXRhclVybBIWCgZzdGF0dXMYBSABKAVSBnN0YXR1cxIfCgtpc19wcm9maWxlZBgGIAEoCFIKaXNQcm9maWxlZBIbCglpc190YWdnZWQYByABKAhSCGlzVGFnZ2VkEhsKCW5leHRfc3RlcBgIIAEoCVIIbmV4dFN0ZXASKgoGYXZhdGFyGAkgASgLMhIuYXBwLnYxLlVzZXJBdmF0YXJSBmF2YXRhchIjCgR0YWdzGAogAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');
@$core.Deprecated('Use updateMyProfileRequestDescriptor instead')
const UpdateMyProfileRequest$json = const {
  '1': 'UpdateMyProfileRequest',
  '2': const [
    const {'1': 'nickname', '3': 1, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'gender', '3': 2, '4': 1, '5': 5, '10': 'gender'},
    const {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `UpdateMyProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyProfileRequestDescriptor = $convert.base64Decode('ChZVcGRhdGVNeVByb2ZpbGVSZXF1ZXN0EhoKCG5pY2tuYW1lGAEgASgJUghuaWNrbmFtZRIWCgZnZW5kZXIYAiABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJsGAMgASgJUglhdmF0YXJVcmw=');
@$core.Deprecated('Use updateMyProfileResponseDescriptor instead')
const UpdateMyProfileResponse$json = const {
  '1': 'UpdateMyProfileResponse',
  '2': const [
    const {'1': 'updated', '3': 1, '4': 1, '5': 8, '10': 'updated'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'gender', '3': 4, '4': 1, '5': 5, '10': 'gender'},
    const {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'status', '3': 6, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'is_profiled', '3': 7, '4': 1, '5': 8, '10': 'isProfiled'},
    const {'1': 'is_tagged', '3': 8, '4': 1, '5': 8, '10': 'isTagged'},
    const {'1': 'next_step', '3': 9, '4': 1, '5': 9, '10': 'nextStep'},
    const {'1': 'avatar', '3': 10, '4': 1, '5': 11, '6': '.app.v1.UserAvatar', '10': 'avatar'},
    const {'1': 'tags', '3': 11, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UpdateMyProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyProfileResponseDescriptor = $convert.base64Decode('ChdVcGRhdGVNeVByb2ZpbGVSZXNwb25zZRIYCgd1cGRhdGVkGAEgASgIUgd1cGRhdGVkEg4KAmlkGAIgASgDUgJpZBIaCghuaWNrbmFtZRgDIAEoCVIIbmlja25hbWUSFgoGZ2VuZGVyGAQgASgFUgZnZW5kZXISHQoKYXZhdGFyX3VybBgFIAEoCVIJYXZhdGFyVXJsEhYKBnN0YXR1cxgGIAEoBVIGc3RhdHVzEh8KC2lzX3Byb2ZpbGVkGAcgASgIUgppc1Byb2ZpbGVkEhsKCWlzX3RhZ2dlZBgIIAEoCFIIaXNUYWdnZWQSGwoJbmV4dF9zdGVwGAkgASgJUghuZXh0U3RlcBIqCgZhdmF0YXIYCiABKAsyEi5hcHAudjEuVXNlckF2YXRhclIGYXZhdGFyEiMKBHRhZ3MYCyADKAsyDy5hcHAudjEuVXNlclRhZ1IEdGFncw==');
@$core.Deprecated('Use getTagsResponseDescriptor instead')
const GetTagsResponse$json = const {
  '1': 'GetTagsResponse',
  '2': const [
    const {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.app.v1.TagGroup', '10': 'groups'},
  ],
};

/// Descriptor for `GetTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTagsResponseDescriptor = $convert.base64Decode('Cg9HZXRUYWdzUmVzcG9uc2USKAoGZ3JvdXBzGAEgAygLMhAuYXBwLnYxLlRhZ0dyb3VwUgZncm91cHM=');
@$core.Deprecated('Use updateMyTagsRequestDescriptor instead')
const UpdateMyTagsRequest$json = const {
  '1': 'UpdateMyTagsRequest',
  '2': const [
    const {'1': 'tag_ids', '3': 1, '4': 3, '5': 3, '10': 'tagIds'},
  ],
};

/// Descriptor for `UpdateMyTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyTagsRequestDescriptor = $convert.base64Decode('ChNVcGRhdGVNeVRhZ3NSZXF1ZXN0EhcKB3RhZ19pZHMYASADKANSBnRhZ0lkcw==');
@$core.Deprecated('Use updateMyTagsResponseDescriptor instead')
const UpdateMyTagsResponse$json = const {
  '1': 'UpdateMyTagsResponse',
  '2': const [
    const {'1': 'updated', '3': 1, '4': 1, '5': 8, '10': 'updated'},
    const {'1': 'is_tagged', '3': 2, '4': 1, '5': 8, '10': 'isTagged'},
    const {'1': 'next_step', '3': 3, '4': 1, '5': 9, '10': 'nextStep'},
    const {'1': 'tags', '3': 4, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `UpdateMyTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMyTagsResponseDescriptor = $convert.base64Decode('ChRVcGRhdGVNeVRhZ3NSZXNwb25zZRIYCgd1cGRhdGVkGAEgASgIUgd1cGRhdGVkEhsKCWlzX3RhZ2dlZBgCIAEoCFIIaXNUYWdnZWQSGwoJbmV4dF9zdGVwGAMgASgJUghuZXh0U3RlcBIjCgR0YWdzGAQgAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');
