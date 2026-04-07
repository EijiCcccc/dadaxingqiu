///
//  Generated code. Do not modify.
//  source: app/v1/feedback.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use submitFeedbackRequestDescriptor instead')
const SubmitFeedbackRequest$json = const {
  '1': 'SubmitFeedbackRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'contact', '3': 2, '4': 1, '5': 9, '10': 'contact'},
  ],
};

/// Descriptor for `SubmitFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFeedbackRequestDescriptor = $convert.base64Decode('ChVTdWJtaXRGZWVkYmFja1JlcXVlc3QSGAoHY29udGVudBgBIAEoCVIHY29udGVudBIYCgdjb250YWN0GAIgASgJUgdjb250YWN0');
@$core.Deprecated('Use submitFeedbackResponseDescriptor instead')
const SubmitFeedbackResponse$json = const {
  '1': 'SubmitFeedbackResponse',
  '2': const [
    const {'1': 'submitted', '3': 1, '4': 1, '5': 8, '10': 'submitted'},
  ],
};

/// Descriptor for `SubmitFeedbackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFeedbackResponseDescriptor = $convert.base64Decode('ChZTdWJtaXRGZWVkYmFja1Jlc3BvbnNlEhwKCXN1Ym1pdHRlZBgBIAEoCFIJc3VibWl0dGVk');
