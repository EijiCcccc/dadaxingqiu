//
//  Generated code. Do not modify.
//  source: app/v1/account.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mySummaryDescriptor instead')
const MySummary$json = {
  '1': 'MySummary',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'online_status', '3': 5, '4': 1, '5': 9, '10': 'onlineStatus'},
    {'1': 'tags', '3': 6, '4': 3, '5': 11, '6': '.app.v1.UserTag', '10': 'tags'},
  ],
};

/// Descriptor for `MySummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mySummaryDescriptor = $convert.base64Decode(
    'CglNeVN1bW1hcnkSDgoCaWQYASABKAlSAmlkEhoKCG5pY2tuYW1lGAIgASgJUghuaWNrbmFtZR'
    'IWCgZnZW5kZXIYAyABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJsGAQgASgJUglhdmF0YXJVcmwS'
    'IwoNb25saW5lX3N0YXR1cxgFIAEoCVIMb25saW5lU3RhdHVzEiMKBHRhZ3MYBiADKAsyDy5hcH'
    'AudjEuVXNlclRhZ1IEdGFncw==');

@$core.Deprecated('Use settingsInfoDescriptor instead')
const SettingsInfo$json = {
  '1': 'SettingsInfo',
  '2': [
    {'1': 'theme_sync_enabled', '3': 1, '4': 1, '5': 8, '10': 'themeSyncEnabled'},
    {'1': 'privacy_policy_url', '3': 2, '4': 1, '5': 9, '10': 'privacyPolicyUrl'},
    {'1': 'user_agreement_url', '3': 3, '4': 1, '5': 9, '10': 'userAgreementUrl'},
    {'1': 'about_url', '3': 4, '4': 1, '5': 9, '10': 'aboutUrl'},
    {'1': 'feedback_enabled', '3': 5, '4': 1, '5': 8, '10': 'feedbackEnabled'},
  ],
};

/// Descriptor for `SettingsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingsInfoDescriptor = $convert.base64Decode(
    'CgxTZXR0aW5nc0luZm8SLAoSdGhlbWVfc3luY19lbmFibGVkGAEgASgIUhB0aGVtZVN5bmNFbm'
    'FibGVkEiwKEnByaXZhY3lfcG9saWN5X3VybBgCIAEoCVIQcHJpdmFjeVBvbGljeVVybBIsChJ1'
    'c2VyX2FncmVlbWVudF91cmwYAyABKAlSEHVzZXJBZ3JlZW1lbnRVcmwSGwoJYWJvdXRfdXJsGA'
    'QgASgJUghhYm91dFVybBIpChBmZWVkYmFja19lbmFibGVkGAUgASgIUg9mZWVkYmFja0VuYWJs'
    'ZWQ=');

@$core.Deprecated('Use getVersionResponseDescriptor instead')
const GetVersionResponse$json = {
  '1': 'GetVersionResponse',
  '2': [
    {'1': 'latest_version', '3': 1, '4': 1, '5': 9, '10': 'latestVersion'},
    {'1': 'force_update', '3': 2, '4': 1, '5': 8, '10': 'forceUpdate'},
    {'1': 'download_url', '3': 3, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'release_notes', '3': 4, '4': 1, '5': 9, '10': 'releaseNotes'},
  ],
};

/// Descriptor for `GetVersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVersionResponseDescriptor = $convert.base64Decode(
    'ChJHZXRWZXJzaW9uUmVzcG9uc2USJQoObGF0ZXN0X3ZlcnNpb24YASABKAlSDWxhdGVzdFZlcn'
    'Npb24SIQoMZm9yY2VfdXBkYXRlGAIgASgIUgtmb3JjZVVwZGF0ZRIhCgxkb3dubG9hZF91cmwY'
    'AyABKAlSC2Rvd25sb2FkVXJsEiMKDXJlbGVhc2Vfbm90ZXMYBCABKAlSDHJlbGVhc2VOb3Rlcw'
    '==');

