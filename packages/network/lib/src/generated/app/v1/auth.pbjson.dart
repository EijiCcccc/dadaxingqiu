//
//  Generated code. Do not modify.
//  source: app/v1/auth.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use wechatLoginRequestDescriptor instead')
const WechatLoginRequest$json = {
  '1': 'WechatLoginRequest',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'client_info', '3': 2, '4': 1, '5': 11, '6': '.app.v1.ClientInfo', '10': 'clientInfo'},
  ],
};

/// Descriptor for `WechatLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wechatLoginRequestDescriptor = $convert.base64Decode(
    'ChJXZWNoYXRMb2dpblJlcXVlc3QSEgoEY29kZRgBIAEoCVIEY29kZRIzCgtjbGllbnRfaW5mbx'
    'gCIAEoCzISLmFwcC52MS5DbGllbnRJbmZvUgpjbGllbnRJbmZv');

@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = {
  '1': 'RefreshTokenRequest',
  '2': [
    {'1': 'refresh_token', '3': 1, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'client_info', '3': 2, '4': 1, '5': 11, '6': '.app.v1.ClientInfo', '10': 'clientInfo'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode(
    'ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EiMKDXJlZnJlc2hfdG9rZW4YASABKAlSDHJlZnJlc2hUb2'
    'tlbhIzCgtjbGllbnRfaW5mbxgCIAEoCzISLmFwcC52MS5DbGllbnRJbmZvUgpjbGllbnRJbmZv');

@$core.Deprecated('Use appleLoginRequestDescriptor instead')
const AppleLoginRequest$json = {
  '1': 'AppleLoginRequest',
  '2': [
    {'1': 'identity_token', '3': 1, '4': 1, '5': 9, '10': 'identityToken'},
    {'1': 'authorization_code', '3': 2, '4': 1, '5': 9, '10': 'authorizationCode'},
    {'1': 'client_info', '3': 3, '4': 1, '5': 11, '6': '.app.v1.ClientInfo', '10': 'clientInfo'},
  ],
};

/// Descriptor for `AppleLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appleLoginRequestDescriptor = $convert.base64Decode(
    'ChFBcHBsZUxvZ2luUmVxdWVzdBIlCg5pZGVudGl0eV90b2tlbhgBIAEoCVINaWRlbnRpdHlUb2'
    'tlbhItChJhdXRob3JpemF0aW9uX2NvZGUYAiABKAlSEWF1dGhvcml6YXRpb25Db2RlEjMKC2Ns'
    'aWVudF9pbmZvGAMgASgLMhIuYXBwLnYxLkNsaWVudEluZm9SCmNsaWVudEluZm8=');

@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = {
  '1': 'LogoutRequest',
  '2': [
    {'1': 'client_info', '3': 1, '4': 1, '5': 11, '6': '.app.v1.ClientInfo', '10': 'clientInfo'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode(
    'Cg1Mb2dvdXRSZXF1ZXN0EjMKC2NsaWVudF9pbmZvGAEgASgLMhIuYXBwLnYxLkNsaWVudEluZm'
    '9SCmNsaWVudEluZm8=');

@$core.Deprecated('Use loginUserDescriptor instead')
const LoginUser$json = {
  '1': 'LoginUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'is_profiled', '3': 5, '4': 1, '5': 8, '10': 'isProfiled'},
    {'1': 'is_tagged', '3': 6, '4': 1, '5': 8, '10': 'isTagged'},
    {'1': 'status', '3': 7, '4': 1, '5': 5, '10': 'status'},
  ],
};

/// Descriptor for `LoginUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserDescriptor = $convert.base64Decode(
    'CglMb2dpblVzZXISDgoCaWQYASABKAlSAmlkEhoKCG5pY2tuYW1lGAIgASgJUghuaWNrbmFtZR'
    'IWCgZnZW5kZXIYAyABKAVSBmdlbmRlchIdCgphdmF0YXJfdXJsGAQgASgJUglhdmF0YXJVcmwS'
    'HwoLaXNfcHJvZmlsZWQYBSABKAhSCmlzUHJvZmlsZWQSGwoJaXNfdGFnZ2VkGAYgASgIUghpc1'
    'RhZ2dlZBIWCgZzdGF0dXMYByABKAVSBnN0YXR1cw==');

@$core.Deprecated('Use tokenPairDescriptor instead')
const TokenPair$json = {
  '1': 'TokenPair',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `TokenPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenPairDescriptor = $convert.base64Decode(
    'CglUb2tlblBhaXISIQoMYWNjZXNzX3Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIjCg1yZWZyZX'
    'NoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SHQoKZXhwaXJlc19pbhgDIAEoA1IJZXhwaXJl'
    'c0lu');

@$core.Deprecated('Use wechatLoginResponseDescriptor instead')
const WechatLoginResponse$json = {
  '1': 'WechatLoginResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.app.v1.LoginUser', '10': 'user'},
    {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.app.v1.TokenPair', '10': 'token'},
    {'1': 'next_step', '3': 3, '4': 1, '5': 9, '10': 'nextStep'},
    {'1': 'is_new_user', '3': 4, '4': 1, '5': 8, '10': 'isNewUser'},
  ],
};

/// Descriptor for `WechatLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wechatLoginResponseDescriptor = $convert.base64Decode(
    'ChNXZWNoYXRMb2dpblJlc3BvbnNlEiUKBHVzZXIYASABKAsyES5hcHAudjEuTG9naW5Vc2VyUg'
    'R1c2VyEicKBXRva2VuGAIgASgLMhEuYXBwLnYxLlRva2VuUGFpclIFdG9rZW4SGwoJbmV4dF9z'
    'dGVwGAMgASgJUghuZXh0U3RlcBIeCgtpc19uZXdfdXNlchgEIAEoCFIJaXNOZXdVc2Vy');

@$core.Deprecated('Use appleLoginResponseDescriptor instead')
const AppleLoginResponse$json = {
  '1': 'AppleLoginResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.app.v1.LoginUser', '10': 'user'},
    {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.app.v1.TokenPair', '10': 'token'},
    {'1': 'next_step', '3': 3, '4': 1, '5': 9, '10': 'nextStep'},
    {'1': 'is_new_user', '3': 4, '4': 1, '5': 8, '10': 'isNewUser'},
  ],
};

/// Descriptor for `AppleLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List appleLoginResponseDescriptor = $convert.base64Decode(
    'ChJBcHBsZUxvZ2luUmVzcG9uc2USJQoEdXNlchgBIAEoCzIRLmFwcC52MS5Mb2dpblVzZXJSBH'
    'VzZXISJwoFdG9rZW4YAiABKAsyES5hcHAudjEuVG9rZW5QYWlyUgV0b2tlbhIbCgluZXh0X3N0'
    'ZXAYAyABKAlSCG5leHRTdGVwEh4KC2lzX25ld191c2VyGAQgASgIUglpc05ld1VzZXI=');

@$core.Deprecated('Use refreshTokenResponseDescriptor instead')
const RefreshTokenResponse$json = {
  '1': 'RefreshTokenResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 11, '6': '.app.v1.TokenPair', '10': 'token'},
  ],
};

/// Descriptor for `RefreshTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenResponseDescriptor = $convert.base64Decode(
    'ChRSZWZyZXNoVG9rZW5SZXNwb25zZRInCgV0b2tlbhgBIAEoCzIRLmFwcC52MS5Ub2tlblBhaX'
    'JSBXRva2Vu');

@$core.Deprecated('Use logoutResponseDescriptor instead')
const LogoutResponse$json = {
  '1': 'LogoutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutResponseDescriptor = $convert.base64Decode(
    'Cg5Mb2dvdXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

