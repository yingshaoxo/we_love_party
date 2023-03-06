///
//  Generated code. Do not modify.
//  source: account_auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = const {
  '1': 'HelloRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode('CgxIZWxsb1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use helloReplyDescriptor instead')
const HelloReply$json = const {
  '1': 'HelloReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloReplyDescriptor = $convert.base64Decode('CgpIZWxsb1JlcGx5EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use registerReplyDescriptor instead')
const RegisterReply$json = const {
  '1': 'RegisterReply',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `RegisterReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReplyDescriptor = $convert.base64Decode('Cg1SZWdpc3RlclJlcGx5EhYKBnJlc3VsdBgBIAEoCVIGcmVzdWx0EhkKBWVycm9yGAIgASgJSABSBWVycm9yiAEBQggKBl9lcnJvcg==');
@$core.Deprecated('Use registerConfirmRequestDescriptor instead')
const RegisterConfirmRequest$json = const {
  '1': 'RegisterConfirmRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'random_string', '3': 2, '4': 1, '5': 9, '10': 'randomString'},
  ],
};

/// Descriptor for `RegisterConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerConfirmRequestDescriptor = $convert.base64Decode('ChZSZWdpc3RlckNvbmZpcm1SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIjCg1yYW5kb21fc3RyaW5nGAIgASgJUgxyYW5kb21TdHJpbmc=');
@$core.Deprecated('Use registerConfirmReplyDescriptor instead')
const RegisterConfirmReply$json = const {
  '1': 'RegisterConfirmReply',
  '2': const [
    const {'1': 'jwt', '3': 1, '4': 1, '5': 9, '10': 'jwt'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `RegisterConfirmReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerConfirmReplyDescriptor = $convert.base64Decode('ChRSZWdpc3RlckNvbmZpcm1SZXBseRIQCgNqd3QYASABKAlSA2p3dBIZCgVlcnJvchgCIAEoCUgAUgVlcnJvcogBAUIICgZfZXJyb3I=');
@$core.Deprecated('Use isJwtOkRequestDescriptor instead')
const IsJwtOkRequest$json = const {
  '1': 'IsJwtOkRequest',
  '2': const [
    const {'1': 'jwt', '3': 1, '4': 1, '5': 9, '10': 'jwt'},
  ],
};

/// Descriptor for `IsJwtOkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isJwtOkRequestDescriptor = $convert.base64Decode('Cg5Jc0p3dE9rUmVxdWVzdBIQCgNqd3QYASABKAlSA2p3dA==');
@$core.Deprecated('Use isJwtOkReplyDescriptor instead')
const IsJwtOkReply$json = const {
  '1': 'IsJwtOkReply',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `IsJwtOkReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isJwtOkReplyDescriptor = $convert.base64Decode('CgxJc0p3dE9rUmVwbHkSFAoFZW1haWwYASABKAlSBWVtYWlsEhkKBWVycm9yGAIgASgJSABSBWVycm9yiAEBQggKBl9lcnJvcg==');
@$core.Deprecated('Use isAdminRequestDescriptor instead')
const IsAdminRequest$json = const {
  '1': 'IsAdminRequest',
  '2': const [
    const {'1': 'jwt', '3': 1, '4': 1, '5': 9, '10': 'jwt'},
  ],
};

/// Descriptor for `IsAdminRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isAdminRequestDescriptor = $convert.base64Decode('Cg5Jc0FkbWluUmVxdWVzdBIQCgNqd3QYASABKAlSA2p3dA==');
@$core.Deprecated('Use isAdminResponseDescriptor instead')
const IsAdminResponse$json = const {
  '1': 'IsAdminResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'yes', '3': 2, '4': 1, '5': 8, '10': 'yes'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `IsAdminResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isAdminResponseDescriptor = $convert.base64Decode('Cg9Jc0FkbWluUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESEAoDeWVzGAIgASgIUgN5ZXNCCAoGX2Vycm9y');
@$core.Deprecated('Use isOnlineRequestDescriptor instead')
const IsOnlineRequest$json = const {
  '1': 'IsOnlineRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'email', '17': true},
  ],
  '8': const [
    const {'1': '_email'},
  ],
};

/// Descriptor for `IsOnlineRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isOnlineRequestDescriptor = $convert.base64Decode('Cg9Jc09ubGluZVJlcXVlc3QSGQoFZW1haWwYASABKAlIAFIFZW1haWyIAQFCCAoGX2VtYWls');
@$core.Deprecated('Use isOnlineResponseDescriptor instead')
const IsOnlineResponse$json = const {
  '1': 'IsOnlineResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'online', '3': 2, '4': 1, '5': 8, '10': 'online'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `IsOnlineResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isOnlineResponseDescriptor = $convert.base64Decode('ChBJc09ubGluZVJlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBEhYKBm9ubGluZRgCIAEoCFIGb25saW5lQggKBl9lcnJvcg==');
@$core.Deprecated('Use userModelDescriptor instead')
const UserModel$json = const {
  '1': 'UserModel',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'username', '17': true},
    const {'1': 'head_image', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'headImage', '17': true},
    const {'1': 'sex', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'sex', '17': true},
    const {'1': 'age', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'age', '17': true},
  ],
  '8': const [
    const {'1': '_username'},
    const {'1': '_head_image'},
    const {'1': '_sex'},
    const {'1': '_age'},
  ],
};

/// Descriptor for `UserModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userModelDescriptor = $convert.base64Decode('CglVc2VyTW9kZWwSFAoFZW1haWwYASABKAlSBWVtYWlsEh8KCHVzZXJuYW1lGAIgASgJSABSCHVzZXJuYW1liAEBEiIKCmhlYWRfaW1hZ2UYAyABKAlIAVIJaGVhZEltYWdliAEBEhUKA3NleBgEIAEoBUgCUgNzZXiIAQESFQoDYWdlGAUgASgFSANSA2FnZYgBAUILCglfdXNlcm5hbWVCDQoLX2hlYWRfaW1hZ2VCBgoEX3NleEIGCgRfYWdl');
@$core.Deprecated('Use locationOfFreeMapDescriptor instead')
const LocationOfFreeMap$json = const {
  '1': 'LocationOfFreeMap',
  '2': const [
    const {'1': 'location_id', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'locationId', '17': true},
    const {'1': 'uploader_email', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'uploaderEmail', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'y_latitude', '3': 4, '4': 1, '5': 1, '10': 'yLatitude'},
    const {'1': 'x_longitude', '3': 5, '4': 1, '5': 1, '10': 'xLongitude'},
    const {'1': 'scores', '3': 6, '4': 1, '5': 1, '10': 'scores'},
    const {'1': 'open_all_day', '3': 7, '4': 1, '5': 8, '10': 'openAllDay'},
    const {'1': 'has_charger', '3': 8, '4': 1, '5': 8, '10': 'hasCharger'},
    const {'1': 'has_wifi', '3': 9, '4': 1, '5': 8, '10': 'hasWifi'},
    const {'1': 'has_water', '3': 10, '4': 1, '5': 8, '10': 'hasWater'},
    const {'1': 'has_hot_water', '3': 11, '4': 1, '5': 8, '10': 'hasHotWater'},
    const {'1': 'has_desk', '3': 12, '4': 1, '5': 8, '10': 'hasDesk'},
    const {'1': 'has_chair', '3': 13, '4': 1, '5': 8, '10': 'hasChair'},
    const {'1': 'has_toilet', '3': 14, '4': 1, '5': 8, '10': 'hasToilet'},
    const {'1': 'has_showering', '3': 15, '4': 1, '5': 8, '10': 'hasShowering'},
    const {'1': 'has_package_receiving_station', '3': 16, '4': 1, '5': 8, '10': 'hasPackageReceivingStation'},
    const {'1': 'has_kfc', '3': 17, '4': 1, '5': 8, '10': 'hasKfc'},
    const {'1': 'has_mcdonald', '3': 18, '4': 1, '5': 8, '10': 'hasMcdonald'},
    const {'1': 'has_store', '3': 19, '4': 1, '5': 8, '10': 'hasStore'},
  ],
  '8': const [
    const {'1': '_location_id'},
    const {'1': '_uploader_email'},
  ],
};

/// Descriptor for `LocationOfFreeMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationOfFreeMapDescriptor = $convert.base64Decode('ChFMb2NhdGlvbk9mRnJlZU1hcBIkCgtsb2NhdGlvbl9pZBgBIAEoBUgAUgpsb2NhdGlvbklkiAEBEioKDnVwbG9hZGVyX2VtYWlsGAIgASgJSAFSDXVwbG9hZGVyRW1haWyIAQESEgoEbmFtZRgDIAEoCVIEbmFtZRIdCgp5X2xhdGl0dWRlGAQgASgBUgl5TGF0aXR1ZGUSHwoLeF9sb25naXR1ZGUYBSABKAFSCnhMb25naXR1ZGUSFgoGc2NvcmVzGAYgASgBUgZzY29yZXMSIAoMb3Blbl9hbGxfZGF5GAcgASgIUgpvcGVuQWxsRGF5Eh8KC2hhc19jaGFyZ2VyGAggASgIUgpoYXNDaGFyZ2VyEhkKCGhhc193aWZpGAkgASgIUgdoYXNXaWZpEhsKCWhhc193YXRlchgKIAEoCFIIaGFzV2F0ZXISIgoNaGFzX2hvdF93YXRlchgLIAEoCFILaGFzSG90V2F0ZXISGQoIaGFzX2Rlc2sYDCABKAhSB2hhc0Rlc2sSGwoJaGFzX2NoYWlyGA0gASgIUghoYXNDaGFpchIdCgpoYXNfdG9pbGV0GA4gASgIUgloYXNUb2lsZXQSIwoNaGFzX3Nob3dlcmluZxgPIAEoCFIMaGFzU2hvd2VyaW5nEkEKHWhhc19wYWNrYWdlX3JlY2VpdmluZ19zdGF0aW9uGBAgASgIUhpoYXNQYWNrYWdlUmVjZWl2aW5nU3RhdGlvbhIXCgdoYXNfa2ZjGBEgASgIUgZoYXNLZmMSIQoMaGFzX21jZG9uYWxkGBIgASgIUgtoYXNNY2RvbmFsZBIbCgloYXNfc3RvcmUYEyABKAhSCGhhc1N0b3JlQg4KDF9sb2NhdGlvbl9pZEIRCg9fdXBsb2FkZXJfZW1haWw=');
