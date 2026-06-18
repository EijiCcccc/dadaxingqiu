//
//  Generated code. Do not modify.
//  source: app/v1/im.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getIMSessionResponseDescriptor instead')
const GetIMSessionResponse$json = {
  '1': 'GetIMSessionResponse',
  '2': [
    {'1': 'sdk_app_id', '3': 1, '4': 1, '5': 3, '10': 'sdkAppId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'user_sig', '3': 3, '4': 1, '5': 9, '10': 'userSig'},
    {'1': 'expire_at', '3': 4, '4': 1, '5': 3, '10': 'expireAt'},
    {'1': 'nickname', '3': 5, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'avatar_url', '3': 6, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `GetIMSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIMSessionResponseDescriptor = $convert.base64Decode(
    'ChRHZXRJTVNlc3Npb25SZXNwb25zZRIcCgpzZGtfYXBwX2lkGAEgASgDUghzZGtBcHBJZBIXCg'
    'd1c2VyX2lkGAIgASgJUgZ1c2VySWQSGQoIdXNlcl9zaWcYAyABKAlSB3VzZXJTaWcSGwoJZXhw'
    'aXJlX2F0GAQgASgDUghleHBpcmVBdBIaCghuaWNrbmFtZRgFIAEoCVIIbmlja25hbWUSHQoKYX'
    'ZhdGFyX3VybBgGIAEoCVIJYXZhdGFyVXJs');

@$core.Deprecated('Use iMConversationMetaDescriptor instead')
const IMConversationMeta$json = {
  '1': 'IMConversationMeta',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'remark_name', '3': 3, '4': 1, '5': 9, '10': 'remarkName'},
    {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'gender', '3': 5, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 6, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'intimacy', '3': 7, '4': 1, '5': 3, '10': 'intimacy'},
    {'1': 'is_pinned', '3': 8, '4': 1, '5': 8, '10': 'isPinned'},
    {'1': 'pinned_at', '3': 9, '4': 1, '5': 3, '10': 'pinnedAt'},
    {'1': 'chat_background_url', '3': 10, '4': 1, '5': 9, '10': 'chatBackgroundUrl'},
    {'1': 'is_following', '3': 11, '4': 1, '5': 8, '10': 'isFollowing'},
    {'1': 'is_followed_by', '3': 12, '4': 1, '5': 8, '10': 'isFollowedBy'},
    {'1': 'is_mutual_follow', '3': 13, '4': 1, '5': 8, '10': 'isMutualFollow'},
    {'1': 'is_deleted', '3': 14, '4': 1, '5': 8, '10': 'isDeleted'},
    {'1': 'deleted_at', '3': 15, '4': 1, '5': 3, '10': 'deletedAt'},
  ],
};

/// Descriptor for `IMConversationMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List iMConversationMetaDescriptor = $convert.base64Decode(
    'ChJJTUNvbnZlcnNhdGlvbk1ldGESFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2tuYW'
    '1lGAIgASgJUghuaWNrbmFtZRIfCgtyZW1hcmtfbmFtZRgDIAEoCVIKcmVtYXJrTmFtZRIhCgxk'
    'aXNwbGF5X25hbWUYBCABKAlSC2Rpc3BsYXlOYW1lEhYKBmdlbmRlchgFIAEoBVIGZ2VuZGVyEh'
    '0KCmF2YXRhcl91cmwYBiABKAlSCWF2YXRhclVybBIaCghpbnRpbWFjeRgHIAEoA1IIaW50aW1h'
    'Y3kSGwoJaXNfcGlubmVkGAggASgIUghpc1Bpbm5lZBIbCglwaW5uZWRfYXQYCSABKANSCHBpbm'
    '5lZEF0Ei4KE2NoYXRfYmFja2dyb3VuZF91cmwYCiABKAlSEWNoYXRCYWNrZ3JvdW5kVXJsEiEK'
    'DGlzX2ZvbGxvd2luZxgLIAEoCFILaXNGb2xsb3dpbmcSJAoOaXNfZm9sbG93ZWRfYnkYDCABKA'
    'hSDGlzRm9sbG93ZWRCeRIoChBpc19tdXR1YWxfZm9sbG93GA0gASgIUg5pc011dHVhbEZvbGxv'
    'dxIdCgppc19kZWxldGVkGA4gASgIUglpc0RlbGV0ZWQSHQoKZGVsZXRlZF9hdBgPIAEoA1IJZG'
    'VsZXRlZEF0');

@$core.Deprecated('Use getIMConversationMetaResponseDescriptor instead')
const GetIMConversationMetaResponse$json = {
  '1': 'GetIMConversationMetaResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.IMConversationMeta', '10': 'items'},
  ],
};

/// Descriptor for `GetIMConversationMetaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIMConversationMetaResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRJTUNvbnZlcnNhdGlvbk1ldGFSZXNwb25zZRIwCgVpdGVtcxgBIAMoCzIaLmFwcC52MS'
    '5JTUNvbnZlcnNhdGlvbk1ldGFSBWl0ZW1z');

@$core.Deprecated('Use getIMIntimacyResponseDescriptor instead')
const GetIMIntimacyResponse$json = {
  '1': 'GetIMIntimacyResponse',
  '2': [
    {'1': 'peer_user_id', '3': 1, '4': 1, '5': 9, '10': 'peerUserId'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'sent_count', '3': 4, '4': 1, '5': 3, '10': 'sentCount'},
    {'1': 'received_count', '3': 5, '4': 1, '5': 3, '10': 'receivedCount'},
    {'1': 'intimacy', '3': 6, '4': 1, '5': 3, '10': 'intimacy'},
  ],
};

/// Descriptor for `GetIMIntimacyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIMIntimacyResponseDescriptor = $convert.base64Decode(
    'ChVHZXRJTUludGltYWN5UmVzcG9uc2USIAoMcGVlcl91c2VyX2lkGAEgASgJUgpwZWVyVXNlck'
    'lkEiEKDGRpc3BsYXlfbmFtZRgCIAEoCVILZGlzcGxheU5hbWUSHQoKYXZhdGFyX3VybBgDIAEo'
    'CVIJYXZhdGFyVXJsEh0KCnNlbnRfY291bnQYBCABKANSCXNlbnRDb3VudBIlCg5yZWNlaXZlZF'
    '9jb3VudBgFIAEoA1INcmVjZWl2ZWRDb3VudBIaCghpbnRpbWFjeRgGIAEoA1IIaW50aW1hY3k=');

