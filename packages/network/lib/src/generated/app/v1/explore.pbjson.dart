///
//  Generated code. Do not modify.
//  source: app/v1/explore.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use exploreCardDescriptor instead')
const ExploreCard$json = const {
  '1': 'ExploreCard',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    const {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    const {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'tags', '3': 5, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `ExploreCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exploreCardDescriptor = $convert.base64Decode('CgtFeHBsb3JlQ2FyZBIXCgd1c2VyX2lkGAEgASgDUgZ1c2VySWQSGgoIbmlja25hbWUYAiABKAlSCG5pY2tuYW1lEhYKBmdlbmRlchgDIAEoBVIGZ2VuZGVyEh0KCmF2YXRhcl91cmwYBCABKAlSCWF2YXRhclVybBIjCgR0YWdzGAUgAygLMg8uYXBwLnYxLlVzZXJUYWdSBHRhZ3M=');
@$core.Deprecated('Use getExploreCardsResponseDescriptor instead')
const GetExploreCardsResponse$json = const {
  '1': 'GetExploreCardsResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.app.v1.ExploreCard', '10': 'items'},
    const {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    const {'1': 'page_size', '3': 3, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'has_more', '3': 4, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `GetExploreCardsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExploreCardsResponseDescriptor = $convert.base64Decode('ChdHZXRFeHBsb3JlQ2FyZHNSZXNwb25zZRIpCgVpdGVtcxgBIAMoCzITLmFwcC52MS5FeHBsb3JlQ2FyZFIFaXRlbXMSEgoEcGFnZRgCIAEoBVIEcGFnZRIbCglwYWdlX3NpemUYAyABKAVSCHBhZ2VTaXplEhkKCGhhc19tb3JlGAQgASgIUgdoYXNNb3Jl');
