//
//  Generated code. Do not modify.
//  source: app/v1/feedback.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use submitFeedbackRequestDescriptor instead')
const SubmitFeedbackRequest$json = {
  '1': 'SubmitFeedbackRequest',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    {'1': 'contact', '3': 2, '4': 1, '5': 9, '10': 'contact'},
  ],
};

/// Descriptor for `SubmitFeedbackRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFeedbackRequestDescriptor = $convert.base64Decode(
    'ChVTdWJtaXRGZWVkYmFja1JlcXVlc3QSGAoHY29udGVudBgBIAEoCVIHY29udGVudBIYCgdjb2'
    '50YWN0GAIgASgJUgdjb250YWN0');

@$core.Deprecated('Use submitFeedbackResponseDescriptor instead')
const SubmitFeedbackResponse$json = {
  '1': 'SubmitFeedbackResponse',
  '2': [
    {'1': 'submitted', '3': 1, '4': 1, '5': 8, '10': 'submitted'},
  ],
};

/// Descriptor for `SubmitFeedbackResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFeedbackResponseDescriptor = $convert.base64Decode(
    'ChZTdWJtaXRGZWVkYmFja1Jlc3BvbnNlEhwKCXN1Ym1pdHRlZBgBIAEoCFIJc3VibWl0dGVk');

