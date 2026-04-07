///
//  Generated code. Do not modify.
//  source: app/v1/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use mySummaryDescriptor instead')
const MySummary$json = const {
  '1': 'MySummary',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    const {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    const {'1': 'online_status', '3': 5, '4': 1, '5': 9, '10': 'onlineStatus'},
    const {'1': 'tags', '3': 6, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `MySummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mySummaryDescriptor = $convert.base64Decode('CglNeVN1bW1hcnkSDgoCaWQYASABKANSAmlkEhoKCG5pY2tuYW1lGAIgASgJUghuaWNrbmFtZRIWCgZnZW5kZXIYAyABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJsGAQgASgJUglhdmF0YXJVcmwSIwoNb25saW5lX3N0YXR1cxgFIAEoCVIMb25saW5lU3RhdHVzEiMKBHRhZ3MYBiADKAsyDy5hcHAudjEuVXNlclRhZ1IEdGFncw==');
@$core.Deprecated('Use settingsInfoDescriptor instead')
const SettingsInfo$json = const {
  '1': 'SettingsInfo',
  '2': const [
    const {'1': 'theme_sync_enabled', '3': 1, '4': 1, '5': 8, '10': 'themeSyncEnabled'},
    const {'1': 'privacy_policy_url', '3': 2, '4': 1, '5': 9, '10': 'privacyPolicyUrl'},
    const {'1': 'user_agreement_url', '3': 3, '4': 1, '5': 9, '10': 'userAgreementUrl'},
    const {'1': 'about_url', '3': 4, '4': 1, '5': 9, '10': 'aboutUrl'},
    const {'1': 'feedback_enabled', '3': 5, '4': 1, '5': 8, '10': 'feedbackEnabled'},
  ],
};

/// Descriptor for `SettingsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsInfoDescriptor = $convert.base64Decode('CgxTZXR0aW5nc0luZm8SLAoSdGhlbWVfc3luY19lbmFibGVkGAEgASgIUhB0aGVtZVN5bmNFbmFibGVkEiwKEnByaXZhY3lfcG9saWN5X3VybBgCIAEoCVIQcHJpdmFjeVBvbGljeVVybBIsChJ1c2VyX2FncmVlbWVudF91cmwYAyABKAlSEHVzZXJBZ3JlZW1lbnRVcmwSGwoJYWJvdXRfdXJsGAQgASgJUghhYm91dFVybBIpChBmZWVkYmFja19lbmFibGVkGAUgASgIUg9mZWVkYmFja0VuYWJsZWQ=');
@$core.Deprecated('Use getVersionResponseDescriptor instead')
const GetVersionResponse$json = const {
  '1': 'GetVersionResponse',
  '2': const [
    const {'1': 'latest_version', '3': 1, '4': 1, '5': 9, '10': 'latestVersion'},
    const {'1': 'force_update', '3': 2, '4': 1, '5': 8, '10': 'forceUpdate'},
    const {'1': 'download_url', '3': 3, '4': 1, '5': 9, '10': 'downloadUrl'},
    const {'1': 'release_notes', '3': 4, '4': 1, '5': 9, '10': 'releaseNotes'},
  ],
};

/// Descriptor for `GetVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVersionResponseDescriptor = $convert.base64Decode('ChJHZXRWZXJzaW9uUmVzcG9uc2USJQoObGF0ZXN0X3ZlcnNpb24YASABKAlSDWxhdGVzdFZlcnNpb24SIQoMZm9yY2VfdXBkYXRlGAIgASgIUgtmb3JjZVVwZGF0ZRIhCgxkb3dubG9hZF91cmwYAyABKAlSC2Rvd25sb2FkVXJsEiMKDXJlbGVhc2Vfbm90ZXMYBCABKAlSDHJlbGVhc2VOb3Rlcw==');
