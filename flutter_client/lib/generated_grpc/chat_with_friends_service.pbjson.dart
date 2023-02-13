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
    const {'1': 'unknown', '3': 6, '4': 1, '5': 8, '10': 'unknown'},
  ],
};

/// Descriptor for `Friend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendDescriptor = $convert.base64Decode('CgZGcmllbmQSFAoFZW1haWwYASABKAlSBWVtYWlsEhIKBG5hbWUYAiABKAlSBG5hbWUSGgoIbmlja25hbWUYAyABKAlSCG5pY2tuYW1lEh8KC2dvdF9ibG9ja2VkGAQgASgIUgpnb3RCbG9ja2VkEh0KCnN1cGVyX2xpa2UYBSABKAhSCXN1cGVyTGlrZRIYCgd1bmtub3duGAYgASgIUgd1bmtub3du');
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
@$core.Deprecated('Use sendMessageToFriendRequestDescriptor instead')
const SendMessageToFriendRequest$json = const {
  '1': 'SendMessageToFriendRequest',
  '2': const [
    const {'1': 'chatMessage', '3': 1, '4': 1, '5': 11, '6': '.chat_with_friends_service.ChatMessage', '10': 'chatMessage'},
  ],
};

/// Descriptor for `SendMessageToFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageToFriendRequestDescriptor = $convert.base64Decode('ChpTZW5kTWVzc2FnZVRvRnJpZW5kUmVxdWVzdBJICgtjaGF0TWVzc2FnZRgBIAEoCzImLmNoYXRfd2l0aF9mcmllbmRzX3NlcnZpY2UuQ2hhdE1lc3NhZ2VSC2NoYXRNZXNzYWdl');
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'my_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'myId', '17': true},
    const {'1': 'from_email', '3': 2, '4': 1, '5': 9, '10': 'fromEmail'},
    const {'1': 'to_email', '3': 3, '4': 1, '5': 9, '10': 'toEmail'},
    const {'1': 'message_type', '3': 4, '4': 1, '5': 14, '6': '.chat_with_friends_service.ChatMessageType', '10': 'messageType'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'date_in_seconds_in_unix_timestamps', '3': 6, '4': 1, '5': 5, '10': 'dateInSecondsInUnixTimestamps'},
    const {'1': 'people_who_seen', '3': 7, '4': 3, '5': 9, '10': 'peopleWhoSeen'},
  ],
  '8': const [
    const {'1': '_my_id'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIYCgVteV9pZBgBIAEoCUgAUgRteUlkiAEBEh0KCmZyb21fZW1haWwYAiABKAlSCWZyb21FbWFpbBIZCgh0b19lbWFpbBgDIAEoCVIHdG9FbWFpbBJNCgxtZXNzYWdlX3R5cGUYBCABKA4yKi5jaGF0X3dpdGhfZnJpZW5kc19zZXJ2aWNlLkNoYXRNZXNzYWdlVHlwZVILbWVzc2FnZVR5cGUSGAoHY29udGVudBgFIAEoCVIHY29udGVudBJJCiJkYXRlX2luX3NlY29uZHNfaW5fdW5peF90aW1lc3RhbXBzGAYgASgFUh1kYXRlSW5TZWNvbmRzSW5Vbml4VGltZXN0YW1wcxImCg9wZW9wbGVfd2hvX3NlZW4YByADKAlSDXBlb3BsZVdob1NlZW5CCAoGX215X2lk');
@$core.Deprecated('Use sendMessageToFriendResponseDescriptor instead')
const SendMessageToFriendResponse$json = const {
  '1': 'SendMessageToFriendResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `SendMessageToFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageToFriendResponseDescriptor = $convert.base64Decode('ChtTZW5kTWVzc2FnZVRvRnJpZW5kUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
@$core.Deprecated('Use getConversationListRequestDescriptor instead')
const GetConversationListRequest$json = const {
  '1': 'GetConversationListRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
  ],
};

/// Descriptor for `GetConversationListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConversationListRequestDescriptor = $convert.base64Decode('ChpHZXRDb252ZXJzYXRpb25MaXN0UmVxdWVzdBIdCgp5b3VyX2VtYWlsGAEgASgJUgl5b3VyRW1haWw=');
@$core.Deprecated('Use conversationDescriptor instead')
const Conversation$json = const {
  '1': 'Conversation',
  '2': const [
    const {'1': 'my_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'myId', '17': true},
    const {'1': 'friend', '3': 2, '4': 1, '5': 11, '6': '.chat_with_friends_service.Friend', '10': 'friend'},
    const {'1': 'last_active_date_in_seconds_in_unix_timestamps', '3': 3, '4': 1, '5': 5, '10': 'lastActiveDateInSecondsInUnixTimestamps'},
    const {'1': 'last_saying', '3': 4, '4': 1, '5': 9, '10': 'lastSaying'},
    const {'1': 'got_new_message', '3': 5, '4': 1, '5': 8, '10': 'gotNewMessage'},
  ],
  '8': const [
    const {'1': '_my_id'},
  ],
};

/// Descriptor for `Conversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationDescriptor = $convert.base64Decode('CgxDb252ZXJzYXRpb24SGAoFbXlfaWQYASABKAlIAFIEbXlJZIgBARI5CgZmcmllbmQYAiABKAsyIS5jaGF0X3dpdGhfZnJpZW5kc19zZXJ2aWNlLkZyaWVuZFIGZnJpZW5kEl8KLmxhc3RfYWN0aXZlX2RhdGVfaW5fc2Vjb25kc19pbl91bml4X3RpbWVzdGFtcHMYAyABKAVSJ2xhc3RBY3RpdmVEYXRlSW5TZWNvbmRzSW5Vbml4VGltZXN0YW1wcxIfCgtsYXN0X3NheWluZxgEIAEoCVIKbGFzdFNheWluZxImCg9nb3RfbmV3X21lc3NhZ2UYBSABKAhSDWdvdE5ld01lc3NhZ2VCCAoGX215X2lk');
@$core.Deprecated('Use getConversationListResponseDescriptor instead')
const GetConversationListResponse$json = const {
  '1': 'GetConversationListResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'conversation_list', '3': 2, '4': 3, '5': 11, '6': '.chat_with_friends_service.Conversation', '10': 'conversationList'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `GetConversationListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getConversationListResponseDescriptor = $convert.base64Decode('ChtHZXRDb252ZXJzYXRpb25MaXN0UmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQESVAoRY29udmVyc2F0aW9uX2xpc3QYAiADKAsyJy5jaGF0X3dpdGhfZnJpZW5kc19zZXJ2aWNlLkNvbnZlcnNhdGlvblIQY29udmVyc2F0aW9uTGlzdEIICgZfZXJyb3I=');
@$core.Deprecated('Use getChatMessageListRequestDescriptor instead')
const GetChatMessageListRequest$json = const {
  '1': 'GetChatMessageListRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
    const {'1': 'target_email', '3': 2, '4': 1, '5': 9, '10': 'targetEmail'},
  ],
};

/// Descriptor for `GetChatMessageListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatMessageListRequestDescriptor = $convert.base64Decode('ChlHZXRDaGF0TWVzc2FnZUxpc3RSZXF1ZXN0Eh0KCnlvdXJfZW1haWwYASABKAlSCXlvdXJFbWFpbBIhCgx0YXJnZXRfZW1haWwYAiABKAlSC3RhcmdldEVtYWls');
@$core.Deprecated('Use getChatMessageListResponseDescriptor instead')
const GetChatMessageListResponse$json = const {
  '1': 'GetChatMessageListResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
    const {'1': 'chat_message_list', '3': 2, '4': 3, '5': 11, '6': '.chat_with_friends_service.ChatMessage', '10': 'chatMessageList'},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `GetChatMessageListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatMessageListResponseDescriptor = $convert.base64Decode('ChpHZXRDaGF0TWVzc2FnZUxpc3RSZXNwb25zZRIZCgVlcnJvchgBIAEoCUgAUgVlcnJvcogBARJSChFjaGF0X21lc3NhZ2VfbGlzdBgCIAMoCzImLmNoYXRfd2l0aF9mcmllbmRzX3NlcnZpY2UuQ2hhdE1lc3NhZ2VSD2NoYXRNZXNzYWdlTGlzdEIICgZfZXJyb3I=');
@$core.Deprecated('Use deleteMessageRequestDescriptor instead')
const DeleteMessageRequest$json = const {
  '1': 'DeleteMessageRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.chat_with_friends_service.ChatMessage', '10': 'message'},
  ],
};

/// Descriptor for `DeleteMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageRequestDescriptor = $convert.base64Decode('ChREZWxldGVNZXNzYWdlUmVxdWVzdBJACgdtZXNzYWdlGAEgASgLMiYuY2hhdF93aXRoX2ZyaWVuZHNfc2VydmljZS5DaGF0TWVzc2FnZVIHbWVzc2FnZQ==');
@$core.Deprecated('Use deleteMessageResponseDescriptor instead')
const DeleteMessageResponse$json = const {
  '1': 'DeleteMessageResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeleteMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessageResponseDescriptor = $convert.base64Decode('ChVEZWxldGVNZXNzYWdlUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
@$core.Deprecated('Use deleteConverstationRequestDescriptor instead')
const DeleteConverstationRequest$json = const {
  '1': 'DeleteConverstationRequest',
  '2': const [
    const {'1': 'your_email', '3': 1, '4': 1, '5': 9, '10': 'yourEmail'},
    const {'1': 'conversation', '3': 2, '4': 1, '5': 11, '6': '.chat_with_friends_service.Conversation', '10': 'conversation'},
  ],
};

/// Descriptor for `DeleteConverstationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteConverstationRequestDescriptor = $convert.base64Decode('ChpEZWxldGVDb252ZXJzdGF0aW9uUmVxdWVzdBIdCgp5b3VyX2VtYWlsGAEgASgJUgl5b3VyRW1haWwSSwoMY29udmVyc2F0aW9uGAIgASgLMicuY2hhdF93aXRoX2ZyaWVuZHNfc2VydmljZS5Db252ZXJzYXRpb25SDGNvbnZlcnNhdGlvbg==');
@$core.Deprecated('Use deleteConverstationResponseDescriptor instead')
const DeleteConverstationResponse$json = const {
  '1': 'DeleteConverstationResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `DeleteConverstationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteConverstationResponseDescriptor = $convert.base64Decode('ChtEZWxldGVDb252ZXJzdGF0aW9uUmVzcG9uc2USGQoFZXJyb3IYASABKAlIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');
