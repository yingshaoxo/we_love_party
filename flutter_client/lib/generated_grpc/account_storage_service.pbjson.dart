///
//  Generated code. Do not modify.
//  source: account_storage_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = const {
  '1': 'CreateUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');
@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = const {
  '1': 'CreateUserResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVVc2VyUmVzcG9uc2USFgoGcmVzdWx0GAEgASgJUgZyZXN1bHQSGQoFZXJyb3IYAiABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = const {
  '1': 'DeleteUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode('ChFEZWxldGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');
@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = const {
  '1': 'DeleteUserResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode('ChJEZWxldGVVc2VyUmVzcG9uc2USFgoGcmVzdWx0GAEgASgJUgZyZXN1bHQSGQoFZXJyb3IYAiABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
@$core.Deprecated('Use updateUserRequestDescriptor instead')
const UpdateUserRequest$json = const {
  '1': 'UpdateUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'password', '17': true},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'username', '17': true},
    const {'1': 'head_image', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'headImage', '17': true},
    const {'1': 'sex', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'sex', '17': true},
    const {'1': 'age', '3': 6, '4': 1, '5': 5, '9': 4, '10': 'age', '17': true},
  ],
  '8': const [
    const {'1': '_password'},
    const {'1': '_username'},
    const {'1': '_head_image'},
    const {'1': '_sex'},
    const {'1': '_age'},
  ],
};

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSHwoIcGFzc3dvcmQYAiABKAlIAFIIcGFzc3dvcmSIAQESHwoIdXNlcm5hbWUYAyABKAlIAVIIdXNlcm5hbWWIAQESIgoKaGVhZF9pbWFnZRgEIAEoCUgCUgloZWFkSW1hZ2WIAQESFQoDc2V4GAUgASgFSANSA3NleIgBARIVCgNhZ2UYBiABKAVIBFIDYWdliAEBQgsKCV9wYXNzd29yZEILCglfdXNlcm5hbWVCDQoLX2hlYWRfaW1hZ2VCBgoEX3NleEIGCgRfYWdl');
@$core.Deprecated('Use updateUserResponseDescriptor instead')
const UpdateUserResponse$json = const {
  '1': 'UpdateUserResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 9, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `UpdateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserResponseDescriptor = $convert.base64Decode('ChJVcGRhdGVVc2VyUmVzcG9uc2USFgoGcmVzdWx0GAEgASgJUgZyZXN1bHQSGQoFZXJyb3IYAiABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
