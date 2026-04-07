///
//  Generated code. Do not modify.
//  source: app/v1/common.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ClientPlatform extends $pb.ProtobufEnum {
  static const ClientPlatform CLIENT_PLATFORM_UNSPECIFIED = ClientPlatform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLIENT_PLATFORM_UNSPECIFIED');
  static const ClientPlatform CLIENT_PLATFORM_IOS = ClientPlatform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLIENT_PLATFORM_IOS');
  static const ClientPlatform CLIENT_PLATFORM_ANDROID = ClientPlatform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLIENT_PLATFORM_ANDROID');

  static const $core.List<ClientPlatform> values = <ClientPlatform> [
    CLIENT_PLATFORM_UNSPECIFIED,
    CLIENT_PLATFORM_IOS,
    CLIENT_PLATFORM_ANDROID,
  ];

  static final $core.Map<$core.int, ClientPlatform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPlatform? valueOf($core.int value) => _byValue[value];

  const ClientPlatform._($core.int v, $core.String n) : super(v, n);
}

