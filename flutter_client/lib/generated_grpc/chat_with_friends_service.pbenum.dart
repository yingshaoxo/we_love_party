///
//  Generated code. Do not modify.
//  source: chat_with_friends_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ChatMessageType extends $pb.ProtobufEnum {
  static const ChatMessageType text = ChatMessageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'text');
  static const ChatMessageType picture = ChatMessageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'picture');
  static const ChatMessageType audio = ChatMessageType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'audio');
  static const ChatMessageType video = ChatMessageType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'video');
  static const ChatMessageType file = ChatMessageType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'file');

  static const $core.List<ChatMessageType> values = <ChatMessageType> [
    text,
    picture,
    audio,
    video,
    file,
  ];

  static final $core.Map<$core.int, ChatMessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatMessageType? valueOf($core.int value) => _byValue[value];

  const ChatMessageType._($core.int v, $core.String n) : super(v, n);
}

