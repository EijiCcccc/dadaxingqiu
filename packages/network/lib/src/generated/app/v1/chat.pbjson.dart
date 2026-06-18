//
//  Generated code. Do not modify.
//  source: app/v1/chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getChatSettingsResponseDescriptor instead')
const GetChatSettingsResponse$json = {
  '1': 'GetChatSettingsResponse',
  '2': [
    {'1': 'peer_user_id', '3': 1, '4': 1, '5': 9, '10': 'peerUserId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'remark_name', '3': 3, '4': 1, '5': 9, '10': 'remarkName'},
    {'1': 'display_name', '3': 4, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_url', '3': 5, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'is_pinned', '3': 6, '4': 1, '5': 8, '10': 'isPinned'},
    {'1': 'pinned_at', '3': 7, '4': 1, '5': 3, '10': 'pinnedAt'},
    {'1': 'chat_background_url', '3': 8, '4': 1, '5': 9, '10': 'chatBackgroundUrl'},
    {'1': 'is_following', '3': 9, '4': 1, '5': 8, '10': 'isFollowing'},
    {'1': 'is_followed_by', '3': 10, '4': 1, '5': 8, '10': 'isFollowedBy'},
    {'1': 'is_mutual_follow', '3': 11, '4': 1, '5': 8, '10': 'isMutualFollow'},
    {'1': 'intimacy', '3': 12, '4': 1, '5': 3, '10': 'intimacy'},
  ],
};

/// Descriptor for `GetChatSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatSettingsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRDaGF0U2V0dGluZ3NSZXNwb25zZRIgCgxwZWVyX3VzZXJfaWQYASABKAlSCnBlZXJVc2'
    'VySWQSGgoIbmlja25hbWUYAiABKAlSCG5pY2tuYW1lEh8KC3JlbWFya19uYW1lGAMgASgJUgpy'
    'ZW1hcmtOYW1lEiEKDGRpc3BsYXlfbmFtZRgEIAEoCVILZGlzcGxheU5hbWUSHQoKYXZhdGFyX3'
    'VybBgFIAEoCVIJYXZhdGFyVXJsEhsKCWlzX3Bpbm5lZBgGIAEoCFIIaXNQaW5uZWQSGwoJcGlu'
    'bmVkX2F0GAcgASgDUghwaW5uZWRBdBIuChNjaGF0X2JhY2tncm91bmRfdXJsGAggASgJUhFjaG'
    'F0QmFja2dyb3VuZFVybBIhCgxpc19mb2xsb3dpbmcYCSABKAhSC2lzRm9sbG93aW5nEiQKDmlz'
    'X2ZvbGxvd2VkX2J5GAogASgIUgxpc0ZvbGxvd2VkQnkSKAoQaXNfbXV0dWFsX2ZvbGxvdxgLIA'
    'EoCFIOaXNNdXR1YWxGb2xsb3cSGgoIaW50aW1hY3kYDCABKANSCGludGltYWN5');

@$core.Deprecated('Use updateChatPinRequestDescriptor instead')
const UpdateChatPinRequest$json = {
  '1': 'UpdateChatPinRequest',
  '2': [
    {'1': 'is_pinned', '3': 1, '4': 1, '5': 8, '10': 'isPinned'},
  ],
};

/// Descriptor for `UpdateChatPinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatPinRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDaGF0UGluUmVxdWVzdBIbCglpc19waW5uZWQYASABKAhSCGlzUGlubmVk');

@$core.Deprecated('Use updateChatPinResponseDescriptor instead')
const UpdateChatPinResponse$json = {
  '1': 'UpdateChatPinResponse',
  '2': [
    {'1': 'is_pinned', '3': 1, '4': 1, '5': 8, '10': 'isPinned'},
    {'1': 'pinned_at', '3': 2, '4': 1, '5': 3, '10': 'pinnedAt'},
  ],
};

/// Descriptor for `UpdateChatPinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatPinResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVDaGF0UGluUmVzcG9uc2USGwoJaXNfcGlubmVkGAEgASgIUghpc1Bpbm5lZBIbCg'
    'lwaW5uZWRfYXQYAiABKANSCHBpbm5lZEF0');

@$core.Deprecated('Use updateUserRemarkRequestDescriptor instead')
const UpdateUserRemarkRequest$json = {
  '1': 'UpdateUserRemarkRequest',
  '2': [
    {'1': 'remark_name', '3': 1, '4': 1, '5': 9, '10': 'remarkName'},
  ],
};

/// Descriptor for `UpdateUserRemarkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRemarkRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVVc2VyUmVtYXJrUmVxdWVzdBIfCgtyZW1hcmtfbmFtZRgBIAEoCVIKcmVtYXJrTm'
    'FtZQ==');

@$core.Deprecated('Use updateUserRemarkResponseDescriptor instead')
const UpdateUserRemarkResponse$json = {
  '1': 'UpdateUserRemarkResponse',
  '2': [
    {'1': 'target_user_id', '3': 1, '4': 1, '5': 9, '10': 'targetUserId'},
    {'1': 'remark_name', '3': 2, '4': 1, '5': 9, '10': 'remarkName'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
  ],
};

/// Descriptor for `UpdateUserRemarkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRemarkResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVVc2VyUmVtYXJrUmVzcG9uc2USJAoOdGFyZ2V0X3VzZXJfaWQYASABKAlSDHRhcm'
    'dldFVzZXJJZBIfCgtyZW1hcmtfbmFtZRgCIAEoCVIKcmVtYXJrTmFtZRIhCgxkaXNwbGF5X25h'
    'bWUYAyABKAlSC2Rpc3BsYXlOYW1l');

@$core.Deprecated('Use createChatBackgroundUploadRequestDescriptor instead')
const CreateChatBackgroundUploadRequest$json = {
  '1': 'CreateChatBackgroundUploadRequest',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 2, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `CreateChatBackgroundUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatBackgroundUploadRequestDescriptor = $convert.base64Decode(
    'CiFDcmVhdGVDaGF0QmFja2dyb3VuZFVwbG9hZFJlcXVlc3QSGwoJZmlsZV9uYW1lGAEgASgJUg'
    'hmaWxlTmFtZRIhCgxjb250ZW50X3R5cGUYAiABKAlSC2NvbnRlbnRUeXBl');

@$core.Deprecated('Use createChatBackgroundUploadResponseDescriptor instead')
const CreateChatBackgroundUploadResponse$json = {
  '1': 'CreateChatBackgroundUploadResponse',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'upload_url', '3': 2, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'public_url', '3': 3, '4': 1, '5': 9, '10': 'publicUrl'},
    {'1': 'expires_in', '3': 4, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `CreateChatBackgroundUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatBackgroundUploadResponseDescriptor = $convert.base64Decode(
    'CiJDcmVhdGVDaGF0QmFja2dyb3VuZFVwbG9hZFJlc3BvbnNlEh0KCm9iamVjdF9rZXkYASABKA'
    'lSCW9iamVjdEtleRIdCgp1cGxvYWRfdXJsGAIgASgJUgl1cGxvYWRVcmwSHQoKcHVibGljX3Vy'
    'bBgDIAEoCVIJcHVibGljVXJsEh0KCmV4cGlyZXNfaW4YBCABKANSCWV4cGlyZXNJbg==');

@$core.Deprecated('Use updateChatBackgroundRequestDescriptor instead')
const UpdateChatBackgroundRequest$json = {
  '1': 'UpdateChatBackgroundRequest',
  '2': [
    {'1': 'background_url', '3': 1, '4': 1, '5': 9, '10': 'backgroundUrl'},
  ],
};

/// Descriptor for `UpdateChatBackgroundRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatBackgroundRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVDaGF0QmFja2dyb3VuZFJlcXVlc3QSJQoOYmFja2dyb3VuZF91cmwYASABKAlSDW'
    'JhY2tncm91bmRVcmw=');

@$core.Deprecated('Use updateChatBackgroundResponseDescriptor instead')
const UpdateChatBackgroundResponse$json = {
  '1': 'UpdateChatBackgroundResponse',
  '2': [
    {'1': 'background_url', '3': 1, '4': 1, '5': 9, '10': 'backgroundUrl'},
  ],
};

/// Descriptor for `UpdateChatBackgroundResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatBackgroundResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVDaGF0QmFja2dyb3VuZFJlc3BvbnNlEiUKDmJhY2tncm91bmRfdXJsGAEgASgJUg'
    '1iYWNrZ3JvdW5kVXJs');

@$core.Deprecated('Use deleteChatConversationRequestDescriptor instead')
const DeleteChatConversationRequest$json = {
  '1': 'DeleteChatConversationRequest',
};

/// Descriptor for `DeleteChatConversationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatConversationRequestDescriptor = $convert.base64Decode(
    'Ch1EZWxldGVDaGF0Q29udmVyc2F0aW9uUmVxdWVzdA==');

@$core.Deprecated('Use deleteChatConversationResponseDescriptor instead')
const DeleteChatConversationResponse$json = {
  '1': 'DeleteChatConversationResponse',
  '2': [
    {'1': 'deleted', '3': 1, '4': 1, '5': 8, '10': 'deleted'},
    {'1': 'deleted_at', '3': 2, '4': 1, '5': 3, '10': 'deletedAt'},
  ],
};

/// Descriptor for `DeleteChatConversationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatConversationResponseDescriptor = $convert.base64Decode(
    'Ch5EZWxldGVDaGF0Q29udmVyc2F0aW9uUmVzcG9uc2USGAoHZGVsZXRlZBgBIAEoCFIHZGVsZX'
    'RlZBIdCgpkZWxldGVkX2F0GAIgASgDUglkZWxldGVkQXQ=');

