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

/// Descriptor for `UpdateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserRequestDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSHwoIdXNlcm5hbWUYAiABKAlIAFIIdXNlcm5hbWWIAQESIgoKaGVhZF9pbWFnZRgDIAEoCUgBUgloZWFkSW1hZ2WIAQESFQoDc2V4GAQgASgFSAJSA3NleIgBARIVCgNhZ2UYBSABKAVIA1IDYWdliAEBQgsKCV91c2VybmFtZUINCgtfaGVhZF9pbWFnZUIGCgRfc2V4QgYKBF9hZ2U=');
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
@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = const {
  '1': 'GetUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode('Cg5HZXRVc2VyUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWw=');
@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = const {
  '1': 'GetUserResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'user_exists', '3': 2, '4': 1, '5': 8, '10': 'userExists'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'username', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'username', '17': true},
    const {'1': 'head_image', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'headImage', '17': true},
    const {'1': 'sex', '3': 6, '4': 1, '5': 5, '9': 3, '10': 'sex', '17': true},
    const {'1': 'age', '3': 7, '4': 1, '5': 5, '9': 4, '10': 'age', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
    const {'1': '_username'},
    const {'1': '_head_image'},
    const {'1': '_sex'},
    const {'1': '_age'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode('Cg9HZXRVc2VyUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESHwoLdXNlcl9leGlzdHMYAiABKAhSCnVzZXJFeGlzdHMSFAoFZW1haWwYAyABKAlSBWVtYWlsEh8KCHVzZXJuYW1lGAQgASgJSAFSCHVzZXJuYW1liAEBEiIKCmhlYWRfaW1hZ2UYBSABKAlIAlIJaGVhZEltYWdliAEBEhUKA3NleBgGIAEoBUgDUgNzZXiIAQESFQoDYWdlGAcgASgFSARSA2FnZYgBAUIICgZfZXJyb3JCCwoJX3VzZXJuYW1lQg0KC19oZWFkX2ltYWdlQgYKBF9zZXhCBgoEX2FnZQ==');
