//
//  Generated code. Do not modify.
//  source: app/v1/common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientPlatformDescriptor instead')
const ClientPlatform$json = {
  '1': 'ClientPlatform',
  '2': [
    {'1': 'CLIENT_PLATFORM_UNSPECIFIED', '2': 0},
    {'1': 'CLIENT_PLATFORM_IOS', '2': 1},
    {'1': 'CLIENT_PLATFORM_ANDROID', '2': 2},
  ],
};

/// Descriptor for `ClientPlatform`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List clientPlatformDescriptor = $convert.base64Decode(
    'Cg5DbGllbnRQbGF0Zm9ybRIfChtDTElFTlRfUExBVEZPUk1fVU5TUEVDSUZJRUQQABIXChNDTE'
    'lFTlRfUExBVEZPUk1fSU9TEAESGwoXQ0xJRU5UX1BMQVRGT1JNX0FORFJPSUQQAg==');

@$core.Deprecated('Use apiErrorDescriptor instead')
const ApiError$json = {
  '1': 'ApiError',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ApiError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiErrorDescriptor = $convert.base64Decode(
    'CghBcGlFcnJvchISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2'
    'U=');

@$core.Deprecated('Use apiResponseMetaDescriptor instead')
const ApiResponseMeta$json = {
  '1': 'ApiResponseMeta',
  '2': [
    {'1': 'trace_id', '3': 1, '4': 1, '5': 9, '10': 'traceId'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `ApiResponseMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiResponseMetaDescriptor = $convert.base64Decode(
    'Cg9BcGlSZXNwb25zZU1ldGESGQoIdHJhY2VfaWQYASABKAlSB3RyYWNlSWQSHAoJdGltZXN0YW'
    '1wGAIgASgDUgl0aW1lc3RhbXA=');

@$core.Deprecated('Use pageInfoDescriptor instead')
const PageInfo$json = {
  '1': 'PageInfo',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 3, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `PageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageInfoDescriptor = $convert.base64Decode(
    'CghQYWdlSW5mbxISCgRwYWdlGAEgASgFUgRwYWdlEhsKCXBhZ2Vfc2l6ZRgCIAEoBVIIcGFnZV'
    'NpemUSGQoIaGFzX21vcmUYAyABKAhSB2hhc01vcmU=');

@$core.Deprecated('Use apiResponseDescriptor instead')
const ApiResponse$json = {
  '1': 'ApiResponse',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'trace_id', '3': 3, '4': 1, '5': 9, '10': 'traceId'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'data', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'data'},
  ],
};

/// Descriptor for `ApiResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiResponseDescriptor = $convert.base64Decode(
    'CgtBcGlSZXNwb25zZRISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3'
    'NhZ2USGQoIdHJhY2VfaWQYAyABKAlSB3RyYWNlSWQSHAoJdGltZXN0YW1wGAQgASgDUgl0aW1l'
    'c3RhbXASKAoEZGF0YRgFIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSBGRhdGE=');

