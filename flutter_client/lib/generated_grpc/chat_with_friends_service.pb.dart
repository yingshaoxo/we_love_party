///
//  Generated code. Do not modify.
//  source: chat_with_friends_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chat_with_friends_service.pbenum.dart';

export 'chat_with_friends_service.pbenum.dart';

class ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromEmail')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toEmail')
    ..e<ChatMessageType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageType', $pb.PbFieldType.OE, defaultOrMaker: ChatMessageType.text, valueOf: ChatMessageType.valueOf, enumValues: ChatMessageType.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateInSecondsInUnixTimestamps', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ChatMessage._() : super();
  factory ChatMessage({
    $core.String? fromEmail,
    $core.String? toEmail,
    ChatMessageType? messageType,
    $core.String? content,
    $core.int? dateInSecondsInUnixTimestamps,
  }) {
    final _result = create();
    if (fromEmail != null) {
      _result.fromEmail = fromEmail;
    }
    if (toEmail != null) {
      _result.toEmail = toEmail;
    }
    if (messageType != null) {
      _result.messageType = messageType;
    }
    if (content != null) {
      _result.content = content;
    }
    if (dateInSecondsInUnixTimestamps != null) {
      _result.dateInSecondsInUnixTimestamps = dateInSecondsInUnixTimestamps;
    }
    return _result;
  }
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set toEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearToEmail() => clearField(2);

  @$pb.TagNumber(3)
  ChatMessageType get messageType => $_getN(2);
  @$pb.TagNumber(3)
  set messageType(ChatMessageType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessageType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get dateInSecondsInUnixTimestamps => $_getIZ(4);
  @$pb.TagNumber(5)
  set dateInSecondsInUnixTimestamps($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateInSecondsInUnixTimestamps() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateInSecondsInUnixTimestamps() => clearField(5);
}

class AddOrUpdateFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddOrUpdateFriendRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..aOM<Friend>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend', subBuilder: Friend.create)
    ..hasRequiredFields = false
  ;

  AddOrUpdateFriendRequest._() : super();
  factory AddOrUpdateFriendRequest({
    $core.String? yourEmail,
    Friend? friend,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    if (friend != null) {
      _result.friend = friend;
    }
    return _result;
  }
  factory AddOrUpdateFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddOrUpdateFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddOrUpdateFriendRequest clone() => AddOrUpdateFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddOrUpdateFriendRequest copyWith(void Function(AddOrUpdateFriendRequest) updates) => super.copyWith((message) => updates(message as AddOrUpdateFriendRequest)) as AddOrUpdateFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddOrUpdateFriendRequest create() => AddOrUpdateFriendRequest._();
  AddOrUpdateFriendRequest createEmptyInstance() => create();
  static $pb.PbList<AddOrUpdateFriendRequest> createRepeated() => $pb.PbList<AddOrUpdateFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static AddOrUpdateFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddOrUpdateFriendRequest>(create);
  static AddOrUpdateFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);

  @$pb.TagNumber(2)
  Friend get friend => $_getN(1);
  @$pb.TagNumber(2)
  set friend(Friend v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriend() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriend() => clearField(2);
  @$pb.TagNumber(2)
  Friend ensureFriend() => $_ensure(1);
}

class Friend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Friend', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nickname')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gotBlocked')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'superLike')
    ..hasRequiredFields = false
  ;

  Friend._() : super();
  factory Friend({
    $core.String? email,
    $core.String? name,
    $core.String? nickname,
    $core.bool? gotBlocked,
    $core.bool? superLike,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nickname != null) {
      _result.nickname = nickname;
    }
    if (gotBlocked != null) {
      _result.gotBlocked = gotBlocked;
    }
    if (superLike != null) {
      _result.superLike = superLike;
    }
    return _result;
  }
  factory Friend.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Friend.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Friend clone() => Friend()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Friend copyWith(void Function(Friend) updates) => super.copyWith((message) => updates(message as Friend)) as Friend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Friend create() => Friend._();
  Friend createEmptyInstance() => create();
  static $pb.PbList<Friend> createRepeated() => $pb.PbList<Friend>();
  @$core.pragma('dart2js:noInline')
  static Friend getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Friend>(create);
  static Friend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set nickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearNickname() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get gotBlocked => $_getBF(3);
  @$pb.TagNumber(4)
  set gotBlocked($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGotBlocked() => $_has(3);
  @$pb.TagNumber(4)
  void clearGotBlocked() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get superLike => $_getBF(4);
  @$pb.TagNumber(5)
  set superLike($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuperLike() => $_has(4);
  @$pb.TagNumber(5)
  void clearSuperLike() => clearField(5);
}

class AddOrUpdateFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddOrUpdateFriendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  AddOrUpdateFriendResponse._() : super();
  factory AddOrUpdateFriendResponse({
    $core.String? error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory AddOrUpdateFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddOrUpdateFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddOrUpdateFriendResponse clone() => AddOrUpdateFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddOrUpdateFriendResponse copyWith(void Function(AddOrUpdateFriendResponse) updates) => super.copyWith((message) => updates(message as AddOrUpdateFriendResponse)) as AddOrUpdateFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddOrUpdateFriendResponse create() => AddOrUpdateFriendResponse._();
  AddOrUpdateFriendResponse createEmptyInstance() => create();
  static $pb.PbList<AddOrUpdateFriendResponse> createRepeated() => $pb.PbList<AddOrUpdateFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static AddOrUpdateFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddOrUpdateFriendResponse>(create);
  static AddOrUpdateFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

class GetFriendListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFriendListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..hasRequiredFields = false
  ;

  GetFriendListRequest._() : super();
  factory GetFriendListRequest({
    $core.String? yourEmail,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    return _result;
  }
  factory GetFriendListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFriendListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFriendListRequest clone() => GetFriendListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFriendListRequest copyWith(void Function(GetFriendListRequest) updates) => super.copyWith((message) => updates(message as GetFriendListRequest)) as GetFriendListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFriendListRequest create() => GetFriendListRequest._();
  GetFriendListRequest createEmptyInstance() => create();
  static $pb.PbList<GetFriendListRequest> createRepeated() => $pb.PbList<GetFriendListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFriendListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFriendListRequest>(create);
  static GetFriendListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);
}

class GetFriendListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFriendListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..pc<Friend>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendList', $pb.PbFieldType.PM, subBuilder: Friend.create)
    ..hasRequiredFields = false
  ;

  GetFriendListResponse._() : super();
  factory GetFriendListResponse({
    $core.String? error,
    $core.Iterable<Friend>? friendList,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (friendList != null) {
      _result.friendList.addAll(friendList);
    }
    return _result;
  }
  factory GetFriendListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFriendListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFriendListResponse clone() => GetFriendListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFriendListResponse copyWith(void Function(GetFriendListResponse) updates) => super.copyWith((message) => updates(message as GetFriendListResponse)) as GetFriendListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFriendListResponse create() => GetFriendListResponse._();
  GetFriendListResponse createEmptyInstance() => create();
  static $pb.PbList<GetFriendListResponse> createRepeated() => $pb.PbList<GetFriendListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFriendListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFriendListResponse>(create);
  static GetFriendListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Friend> get friendList => $_getList(1);
}

class DeleteFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteFriendRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendEmail')
    ..hasRequiredFields = false
  ;

  DeleteFriendRequest._() : super();
  factory DeleteFriendRequest({
    $core.String? yourEmail,
    $core.String? friendEmail,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    if (friendEmail != null) {
      _result.friendEmail = friendEmail;
    }
    return _result;
  }
  factory DeleteFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFriendRequest clone() => DeleteFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFriendRequest copyWith(void Function(DeleteFriendRequest) updates) => super.copyWith((message) => updates(message as DeleteFriendRequest)) as DeleteFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteFriendRequest create() => DeleteFriendRequest._();
  DeleteFriendRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteFriendRequest> createRepeated() => $pb.PbList<DeleteFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFriendRequest>(create);
  static DeleteFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendEmail() => clearField(2);
}

class DeleteFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteFriendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  DeleteFriendResponse._() : super();
  factory DeleteFriendResponse({
    $core.String? error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory DeleteFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFriendResponse clone() => DeleteFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFriendResponse copyWith(void Function(DeleteFriendResponse) updates) => super.copyWith((message) => updates(message as DeleteFriendResponse)) as DeleteFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteFriendResponse create() => DeleteFriendResponse._();
  DeleteFriendResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteFriendResponse> createRepeated() => $pb.PbList<DeleteFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFriendResponse>(create);
  static DeleteFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

