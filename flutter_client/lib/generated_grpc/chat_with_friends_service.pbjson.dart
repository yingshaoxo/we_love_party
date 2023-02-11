///
//  Generated code. Do not modify.
//  source: chat_with_friends_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use chatMessageTypeDescriptor instead')
const ChatMessageType$json = const {
  '1': 'ChatMessageType',
  '2': const [
    const {'1': 'text', '2': 0},
    const {'1': 'picture', '2': 1},
    const {'1': 'audio', '2': 2},
    const {'1': 'video', '2': 3},
    const {'1': 'file', '2': 4},
  ],
};

/// Descriptor for `ChatMessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List chatMessageTypeDescriptor = $convert.base64Decode('Cg9DaGF0TWVzc2FnZVR5cGUSCAoEdGV4dBAAEgsKB3BpY3R1cmUQARIJCgVhdWRpbxACEgkKBXZpZGVvEAMSCAoEZmlsZRAE');
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'from_email', '3': 1, '4': 1, '5': 9, '10': 'fromEmail'},
    const {'1': 'to_email', '3': 2, '4': 1, '5': 9, '10': 'toEmail'},
    const {'1': 'message_type', '3': 3, '4': 1, '5': 14, '6': '.chat_with_friends_service.ChatMessageType', '10': 'messageType'},
    const {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'date_in_seconds_in_unix_timestamps', '3': 5, '4': 1, '5': 5, '10': 'dateInSecondsInUnixTimestamps'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIdCgpmcm9tX2VtYWlsGAEgASgJUglmcm9tRW1haWwSGQoIdG9fZW1haWwYAiABKAlSB3RvRW1haWwSTQoMbWVzc2FnZV90eXBlGAMgASgOMiouY2hhdF93aXRoX2ZyaWVuZHNfc2VydmljZS5DaGF0TWVzc2FnZVR5cGVSC21lc3NhZ2VUeXBlEhgKB2NvbnRlbnQYBCABKAlSB2NvbnRlbnQSSQoiZGF0ZV9pbl9zZWNvbmRzX2luX3VuaXhfdGltZXN0YW1wcxgFIAEoBVIdZGF0ZUluU2Vjb25kc0luVW5peFRpbWVzdGFtcHM=');
@$core.Deprecated('Use addOrUpdateFriendRequestDescriptor instead')
const AddOrUpdateFriendRequest$json = const {
  '1': 'AddOrUpdateFriendRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
    const {'1': 'friend', '3': 2, '4': 1, '5': 11, '6': '.chat_with_friends_service.Friend', '10': 'friend'},
  ],
};

/// Descriptor for `AddOrUpdateFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addOrUpdateFriendRequestDescriptor = $convert.base64Decode('ChhBZGRPclVwZGF0ZUZyaWVuZFJlcXVlc3QSHQoKeW91cl9lbWFpbBgBIAEoCVIJeW91ckVtYWlsEjkKBmZyaWVuZBgCIAEoCzIhLmNoYXRfd2l0aF9mcmllbmRzX3NlcnZpY2UuRnJpZW5kUgZmcmllbmQ=');
@$core.Deprecated('Use friendDescriptor instead')
const Friend$json = const {
  '1': 'Friend',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nickname', '3': 3, '4': 1, '5': 9, '10': 'nickname'},
    const {'1': 'got_blocked', '3': 4, '4': 1, '5': 8, '10': 'gotBlocked'},
    const {'1': 'super_like', '3': 5, '4': 1, '5': 8, '10': 'superLike'},
  ],
};

/// Descriptor for `Friend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendDescriptor = $convert.base64Decode('CgZGcmllbmQSFAoFZW1haWwYASABKAlSBWVtYWlsEhIKBG5hbWUYAiABKAlSBG5hbWUSGgoIbmlja25hbWUYAyABKAlSCG5pY2tuYW1lEh8KC2dvdF9ibG9ja2VkGAQgASgIUgpnb3RCbG9ja2VkEh0KCnN1cGVyX2xpa2UYBSABKAhSCXN1cGVyTGlrZQ==');
@$core.Deprecated('Use addOrUpdateFriendResponseDescriptor instead')
const AddOrUpdateFriendResponse$json = const {
  '1': 'AddOrUpdateFriendResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `AddOrUpdateFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addOrUpdateFriendResponseDescriptor = $convert.base64Decode('ChlBZGRPclVwZGF0ZUZyaWVuZFJlc3BvbnNlEhkKBWVycm9yGAEgASgJSABSBWVycm9yiAEBQggKBl9lcnJvcg==');
@$core.Deprecated('Use getFriendListRequestDescriptor instead')
const GetFriendListRequest$json = const {
  '1': 'GetFriendListRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
  ],
};

/// Descriptor for `GetFriendListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendListRequestDescriptor = $convert.base64Decode('ChRHZXRGcmllbmRMaXN0UmVxdWVzdBIdCgp5b3VyX2VtYWlsGAEgASgJUgl5b3VyRW1haWw=');
@$core.Deprecated('Use getFriendListResponseDescriptor instead')
const GetFriendListResponse$json = const {
  '1': 'GetFriendListResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'friend_list', '3': 2, '4': 3, '5': 11, '6': '.chat_with_friends_service.Friend', '10': 'friendList'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `GetFriendListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendListResponseDescriptor = $convert.base64Decode('ChVHZXRGcmllbmRMaXN0UmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESQgoLZnJpZW5kX2xpc3QYAiADKAsyIS5jaGF0X3dpdGhfZnJpZW5kc19zZXJ2aWNlLkZyaWVuZFIKZnJpZW5kTGlzdEIICgZfZXJyb3I=');
@$core.Deprecated('Use deleteFriendRequestDescriptor instead')
const DeleteFriendRequest$json = const {
  '1': 'DeleteFriendRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
    const {'1': 'friend_email', '3': 2, '4': 1, '5': 9, '10': 'friendEmail'},
  ],
};

/// Descriptor for `DeleteFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFriendRequestDescriptor = $convert.base64Decode('ChNEZWxldGVGcmllbmRSZXF1ZXN0Eh0KCnlvdXJfZW1haWwYASABKAlSCXlvdXJFbWFpbBIhCgxmcmllbmRfZW1haWwYAiABKAlSC2ZyaWVuZEVtYWls');
@$core.Deprecated('Use deleteFriendResponseDescriptor instead')
const DeleteFriendResponse$json = const {
  '1': 'DeleteFriendResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeleteFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFriendResponseDescriptor = $convert.base64Decode('ChREZWxldGVGcmllbmRSZXNwb25zZRIZCgVlcnJvchgBIAEoCUgAUgVlcnJvcogBAUIICgZfZXJyb3I=');
