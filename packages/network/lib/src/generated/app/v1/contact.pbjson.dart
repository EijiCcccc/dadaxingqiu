//
//  Generated code. Do not modify.
//  source: app/v1/contact.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contactUserItemDescriptor instead')
const ContactUserItem$json = {
  '1': 'ContactUserItem',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'remark_name', '3': 3, '4': 1, '5': 9, '10': 'remarkName'},
    {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'gender', '3': 5, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 6, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'intimacy', '3': 7, '4': 1, '5': 3, '10': 'intimacy'},
    {'1': 'is_following', '3': 8, '4': 1, '5': 8, '10': 'isFollowing'},
    {'1': 'is_followed_by', '3': 9, '4': 1, '5': 8, '10': 'isFollowedBy'},
    {'1': 'is_mutual_follow', '3': 10, '4': 1, '5': 8, '10': 'isMutualFollow'},
    {'1': 'relation_updated_at', '3': 11, '4': 1, '5': 3, '10': 'relationUpdatedAt'},
  ],
};

/// Descriptor for `ContactUserItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactUserItemDescriptor = $convert.base64Decode(
    'Cg9Db250YWN0VXNlckl0ZW0SFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2tuYW1lGA'
    'IgASgJUghuaWNrbmFtZRIfCgtyZW1hcmtfbmFtZRgDIAEoCVIKcmVtYXJrTmFtZRIhCgxkaXNw'
    'bGF5X25hbWUYBCABKAlSC2Rpc3BsYXlOYW1lEhYKBmdlbmRlchgFIAEoBVIGZ2VuZGVyEh0KCm'
    'F2YXRhcl91cmwYBiABKAlSCWF2YXRhclVybBIaCghpbnRpbWFjeRgHIAEoA1IIaW50aW1hY3kS'
    'IQoMaXNfZm9sbG93aW5nGAggASgIUgtpc0ZvbGxvd2luZxIkCg5pc19mb2xsb3dlZF9ieRgJIA'
    'EoCFIMaXNGb2xsb3dlZEJ5EigKEGlzX211dHVhbF9mb2xsb3cYCiABKAhSDmlzTXV0dWFsRm9s'
    'bG93Ei4KE3JlbGF0aW9uX3VwZGF0ZWRfYXQYCyABKANSEXJlbGF0aW9uVXBkYXRlZEF0');

@$core.Deprecated('Use getContactFriendsResponseDescriptor instead')
const GetContactFriendsResponse$json = {
  '1': 'GetContactFriendsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.ContactUserItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetContactFriendsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactFriendsResponseDescriptor = $convert.base64Decode(
    'ChlHZXRDb250YWN0RnJpZW5kc1Jlc3BvbnNlEi0KBWl0ZW1zGAEgAygLMhcuYXBwLnYxLkNvbn'
    'RhY3RVc2VySXRlbVIFaXRlbXMSEgoEcGFnZRgCIAEoBVIEcGFnZRIbCglwYWdlX3NpemUYAyAB'
    'KAVSCHBhZ2VTaXplEhkKCGhhc19tb3JlGAQgASgIUgdoYXNNb3Jl');

@$core.Deprecated('Use getContactFollowingResponseDescriptor instead')
const GetContactFollowingResponse$json = {
  '1': 'GetContactFollowingResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.ContactUserItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetContactFollowingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactFollowingResponseDescriptor = $convert.base64Decode(
    'ChtHZXRDb250YWN0Rm9sbG93aW5nUmVzcG9uc2USLQoFaXRlbXMYASADKAsyFy5hcHAudjEuQ2'
    '9udGFjdFVzZXJJdGVtUgVpdGVtcxISCgRwYWdlGAIgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgD'
    'IAEoBVIIcGFnZVNpemUSGQoIaGFzX21vcmUYBCABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use getContactFollowersResponseDescriptor instead')
const GetContactFollowersResponse$json = {
  '1': 'GetContactFollowersResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.ContactUserItem', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetContactFollowersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactFollowersResponseDescriptor = $convert.base64Decode(
    'ChtHZXRDb250YWN0Rm9sbG93ZXJzUmVzcG9uc2USLQoFaXRlbXMYASADKAsyFy5hcHAudjEuQ2'
    '9udGFjdFVzZXJJdGVtUgVpdGVtcxISCgRwYWdlGAIgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgD'
    'IAEoBVIIcGFnZVNpemUSGQoIaGFzX21vcmUYBCABKAhSB2hhc01vcmU=');

