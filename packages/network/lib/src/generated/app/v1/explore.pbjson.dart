//
//  Generated code. Do not modify.
//  source: app/v1/explore.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use exploreCardDescriptor instead')
const ExploreCard$json = {
  '1': 'ExploreCard',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'tags', '3': 5, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `ExploreCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exploreCardDescriptor = $convert.base64Decode(
    'CgtFeHBsb3JlQ2FyZBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGgoIbmlja25hbWUYAiABKA'
    'lSCG5pY2tuYW1lEhYKBmdlbmRlchgDIAEoBVIGZ2VuZGVyEh0KCmF2YXRhcl91cmwYBCABKAlS'
    'CWF2YXRhclVybBIjCgR0YWdzGAUgAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');

@$core.Deprecated('Use getExploreCardsResponseDescriptor instead')
const GetExploreCardsResponse$json = {
  '1': 'GetExploreCardsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.ExploreCard', '10': 'items'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetExploreCardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExploreCardsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRFeHBsb3JlQ2FyZHNSZXNwb25zZRIpCgVpdGVtcxgBIAMoCzITLmFwcC52MS5FeHBsb3'
    'JlQ2FyZFIFaXRlbXMSEgoEcGFnZRgCIAEoBVIEcGFnZRIbCglwYWdlX3NpemUYAyABKAVSCHBh'
    'Z2VTaXplEhkKCGhhc19tb3JlGAQgASgIUgdoYXNNb3Jl');

