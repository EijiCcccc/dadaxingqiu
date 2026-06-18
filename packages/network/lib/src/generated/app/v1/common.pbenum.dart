//
//  Generated code. Do not modify.
//  source: app/v1/common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ClientPlatform extends $pb.ProtobufEnum {
  static const ClientPlatform CLIENT_PLATFORM_UNSPECIFIED = ClientPlatform._(0, _omitEnumNames ? '' : 'CLIENT_PLATFORM_UNSPECIFIED');
  static const ClientPlatform CLIENT_PLATFORM_IOS = ClientPlatform._(1, _omitEnumNames ? '' : 'CLIENT_PLATFORM_IOS');
  static const ClientPlatform CLIENT_PLATFORM_ANDROID = ClientPlatform._(2, _omitEnumNames ? '' : 'CLIENT_PLATFORM_ANDROID');

  static const $core.List<ClientPlatform> values = <ClientPlatform> [
    CLIENT_PLATFORM_UNSPECIFIED,
    CLIENT_PLATFORM_IOS,
    CLIENT_PLATFORM_ANDROID,
  ];

  static final $core.Map<$core.int, ClientPlatform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPlatform? valueOf($core.int value) => _byValue[value];

  const ClientPlatform._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
