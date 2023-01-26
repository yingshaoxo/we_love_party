///
//  Generated code. Do not modify.
//  source: room_control_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = const {
  '1': 'CreateRoomRequest',
  '2': const [
    const {'1': 'roomName', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVSb29tUmVxdWVzdBIaCghyb29tTmFtZRgBIAEoCVIIcm9vbU5hbWU=');
@$core.Deprecated('Use createRoomResponseDescriptor instead')
const CreateRoomResponse$json = const {
  '1': 'CreateRoomResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `CreateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVSb29tUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESGAoHc3VjY2VzcxgCIAEoCFIHc3VjY2Vzc0IICgZfZXJyb3I=');
@$core.Deprecated('Use allowJoinRequestDescriptor instead')
const AllowJoinRequest$json = const {
  '1': 'AllowJoinRequest',
  '2': const [
    const {'1': 'roomName', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'identity', '3': 2, '4': 1, '5': 9, '10': 'identity'},
  ],
};

/// Descriptor for `AllowJoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allowJoinRequestDescriptor = $convert.base64Decode('ChBBbGxvd0pvaW5SZXF1ZXN0EhoKCHJvb21OYW1lGAEgASgJUghyb29tTmFtZRIaCghpZGVudGl0eRgCIAEoCVIIaWRlbnRpdHk=');
@$core.Deprecated('Use allowJoinResponseDescriptor instead')
const AllowJoinResponse$json = const {
  '1': 'AllowJoinResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'accessToken', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `AllowJoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allowJoinResponseDescriptor = $convert.base64Decode('ChFBbGxvd0pvaW5SZXNwb25zZRIZCgVlcnJvchgBIAEoCUgAUgVlcnJvcogBARIgCgthY2Nlc3NUb2tlbhgCIAEoCVILYWNjZXNzVG9rZW5CCAoGX2Vycm9y');
@$core.Deprecated('Use listRoomsRequestDescriptor instead')
const ListRoomsRequest$json = const {
  '1': 'ListRoomsRequest',
};

/// Descriptor for `ListRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRoomsRequestDescriptor = $convert.base64Decode('ChBMaXN0Um9vbXNSZXF1ZXN0');
@$core.Deprecated('Use roomInfoDescriptor instead')
const RoomInfo$json = const {
  '1': 'RoomInfo',
  '2': const [
    const {'1': 'roomName', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'numberOfParticipants', '3': 2, '4': 1, '5': 5, '10': 'numberOfParticipants'},
  ],
};

/// Descriptor for `RoomInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomInfoDescriptor = $convert.base64Decode('CghSb29tSW5mbxIaCghyb29tTmFtZRgBIAEoCVIIcm9vbU5hbWUSMgoUbnVtYmVyT2ZQYXJ0aWNpcGFudHMYAiABKAVSFG51bWJlck9mUGFydGljaXBhbnRz');
@$core.Deprecated('Use listRoomsResponseDescriptor instead')
const ListRoomsResponse$json = const {
  '1': 'ListRoomsResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'rooms', '3': 2, '4': 3, '5': 11, '6': '.room_control_service.RoomInfo', '10': 'rooms'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `ListRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRoomsResponseDescriptor = $convert.base64Decode('ChFMaXN0Um9vbXNSZXNwb25zZRIZCgVlcnJvchgBIAEoCUgAUgVlcnJvcogBARI0CgVyb29tcxgCIAMoCzIeLnJvb21fY29udHJvbF9zZXJ2aWNlLlJvb21JbmZvUgVyb29tc0IICgZfZXJyb3I=');
@$core.Deprecated('Use deleteRoomRequestDescriptor instead')
const DeleteRoomRequest$json = const {
  '1': 'DeleteRoomRequest',
  '2': const [
    const {'1': 'roomName', '3': 1, '4': 1, '5': 9, '10': 'roomName'},
  ],
};

/// Descriptor for `DeleteRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomRequestDescriptor = $convert.base64Decode('ChFEZWxldGVSb29tUmVxdWVzdBIaCghyb29tTmFtZRgBIAEoCVIIcm9vbU5hbWU=');
@$core.Deprecated('Use deleteRoomResponseDescriptor instead')
const DeleteRoomResponse$json = const {
  '1': 'DeleteRoomResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeleteRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomResponseDescriptor = $convert.base64Decode('ChJEZWxldGVSb29tUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESGAoHc3VjY2VzcxgCIAEoCFIHc3VjY2Vzc0IICgZfZXJyb3I=');
