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
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'unknown')
    ..hasRequiredFields = false
  ;

  Friend._() : super();
  factory Friend({
    $core.String? email,
    $core.String? name,
    $core.String? nickname,
    $core.bool? gotBlocked,
    $core.bool? superLike,
    $core.bool? unknown,
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
    if (unknown != null) {
      _result.unknown = unknown;
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

  @$pb.TagNumber(6)
  $core.bool get unknown => $_getBF(5);
  @$pb.TagNumber(6)
  set unknown($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnknown() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnknown() => clearField(6);
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

class SendMessageToFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendMessageToFriendRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOM<ChatMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatMessage', protoName: 'chatMessage', subBuilder: ChatMessage.create)
    ..hasRequiredFields = false
  ;

  SendMessageToFriendRequest._() : super();
  factory SendMessageToFriendRequest({
    ChatMessage? chatMessage,
  }) {
    final _result = create();
    if (chatMessage != null) {
      _result.chatMessage = chatMessage;
    }
    return _result;
  }
  factory SendMessageToFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageToFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageToFriendRequest clone() => SendMessageToFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageToFriendRequest copyWith(void Function(SendMessageToFriendRequest) updates) => super.copyWith((message) => updates(message as SendMessageToFriendRequest)) as SendMessageToFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMessageToFriendRequest create() => SendMessageToFriendRequest._();
  SendMessageToFriendRequest createEmptyInstance() => create();
  static $pb.PbList<SendMessageToFriendRequest> createRepeated() => $pb.PbList<SendMessageToFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static SendMessageToFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageToFriendRequest>(create);
  static SendMessageToFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ChatMessage get chatMessage => $_getN(0);
  @$pb.TagNumber(1)
  set chatMessage(ChatMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessage() => clearField(1);
  @$pb.TagNumber(1)
  ChatMessage ensureChatMessage() => $_ensure(0);
}

class ChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChatMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'myId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromEmail')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toEmail')
    ..e<ChatMessageType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageType', $pb.PbFieldType.OE, defaultOrMaker: ChatMessageType.text, valueOf: ChatMessageType.valueOf, enumValues: ChatMessageType.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateInSecondsInUnixTimestamps', $pb.PbFieldType.O3)
    ..pPS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'peopleWhoSeen')
    ..hasRequiredFields = false
  ;

  ChatMessage._() : super();
  factory ChatMessage({
    $core.String? myId,
    $core.String? fromEmail,
    $core.String? toEmail,
    ChatMessageType? messageType,
    $core.String? content,
    $core.int? dateInSecondsInUnixTimestamps,
    $core.Iterable<$core.String>? peopleWhoSeen,
  }) {
    final _result = create();
    if (myId != null) {
      _result.myId = myId;
    }
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
    if (peopleWhoSeen != null) {
      _result.peopleWhoSeen.addAll(peopleWhoSeen);
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
  $core.String get myId => $_getSZ(0);
  @$pb.TagNumber(1)
  set myId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set toEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearToEmail() => clearField(3);

  @$pb.TagNumber(4)
  ChatMessageType get messageType => $_getN(3);
  @$pb.TagNumber(4)
  set messageType(ChatMessageType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get dateInSecondsInUnixTimestamps => $_getIZ(5);
  @$pb.TagNumber(6)
  set dateInSecondsInUnixTimestamps($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDateInSecondsInUnixTimestamps() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateInSecondsInUnixTimestamps() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get peopleWhoSeen => $_getList(6);
}

class SendMessageToFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendMessageToFriendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  SendMessageToFriendResponse._() : super();
  factory SendMessageToFriendResponse({
    $core.String? error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory SendMessageToFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendMessageToFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendMessageToFriendResponse clone() => SendMessageToFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendMessageToFriendResponse copyWith(void Function(SendMessageToFriendResponse) updates) => super.copyWith((message) => updates(message as SendMessageToFriendResponse)) as SendMessageToFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMessageToFriendResponse create() => SendMessageToFriendResponse._();
  SendMessageToFriendResponse createEmptyInstance() => create();
  static $pb.PbList<SendMessageToFriendResponse> createRepeated() => $pb.PbList<SendMessageToFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static SendMessageToFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendMessageToFriendResponse>(create);
  static SendMessageToFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

class GetConversationListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetConversationListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..hasRequiredFields = false
  ;

  GetConversationListRequest._() : super();
  factory GetConversationListRequest({
    $core.String? yourEmail,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    return _result;
  }
  factory GetConversationListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConversationListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConversationListRequest clone() => GetConversationListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConversationListRequest copyWith(void Function(GetConversationListRequest) updates) => super.copyWith((message) => updates(message as GetConversationListRequest)) as GetConversationListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetConversationListRequest create() => GetConversationListRequest._();
  GetConversationListRequest createEmptyInstance() => create();
  static $pb.PbList<GetConversationListRequest> createRepeated() => $pb.PbList<GetConversationListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetConversationListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConversationListRequest>(create);
  static GetConversationListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);
}

class Conversation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Conversation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'myId')
    ..aOM<Friend>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friend', subBuilder: Friend.create)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastActiveDateInSecondsInUnixTimestamps', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastSaying')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gotNewMessage')
    ..hasRequiredFields = false
  ;

  Conversation._() : super();
  factory Conversation({
    $core.String? myId,
    Friend? friend,
    $core.int? lastActiveDateInSecondsInUnixTimestamps,
    $core.String? lastSaying,
    $core.bool? gotNewMessage,
  }) {
    final _result = create();
    if (myId != null) {
      _result.myId = myId;
    }
    if (friend != null) {
      _result.friend = friend;
    }
    if (lastActiveDateInSecondsInUnixTimestamps != null) {
      _result.lastActiveDateInSecondsInUnixTimestamps = lastActiveDateInSecondsInUnixTimestamps;
    }
    if (lastSaying != null) {
      _result.lastSaying = lastSaying;
    }
    if (gotNewMessage != null) {
      _result.gotNewMessage = gotNewMessage;
    }
    return _result;
  }
  factory Conversation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Conversation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Conversation clone() => Conversation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Conversation copyWith(void Function(Conversation) updates) => super.copyWith((message) => updates(message as Conversation)) as Conversation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Conversation create() => Conversation._();
  Conversation createEmptyInstance() => create();
  static $pb.PbList<Conversation> createRepeated() => $pb.PbList<Conversation>();
  @$core.pragma('dart2js:noInline')
  static Conversation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Conversation>(create);
  static Conversation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get myId => $_getSZ(0);
  @$pb.TagNumber(1)
  set myId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMyId() => clearField(1);

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

  @$pb.TagNumber(3)
  $core.int get lastActiveDateInSecondsInUnixTimestamps => $_getIZ(2);
  @$pb.TagNumber(3)
  set lastActiveDateInSecondsInUnixTimestamps($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastActiveDateInSecondsInUnixTimestamps() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastActiveDateInSecondsInUnixTimestamps() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastSaying => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastSaying($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastSaying() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastSaying() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get gotNewMessage => $_getBF(4);
  @$pb.TagNumber(5)
  set gotNewMessage($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGotNewMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearGotNewMessage() => clearField(5);
}

class GetConversationListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetConversationListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..pc<Conversation>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversationList', $pb.PbFieldType.PM, subBuilder: Conversation.create)
    ..hasRequiredFields = false
  ;

  GetConversationListResponse._() : super();
  factory GetConversationListResponse({
    $core.String? error,
    $core.Iterable<Conversation>? conversationList,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (conversationList != null) {
      _result.conversationList.addAll(conversationList);
    }
    return _result;
  }
  factory GetConversationListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetConversationListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetConversationListResponse clone() => GetConversationListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetConversationListResponse copyWith(void Function(GetConversationListResponse) updates) => super.copyWith((message) => updates(message as GetConversationListResponse)) as GetConversationListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetConversationListResponse create() => GetConversationListResponse._();
  GetConversationListResponse createEmptyInstance() => create();
  static $pb.PbList<GetConversationListResponse> createRepeated() => $pb.PbList<GetConversationListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetConversationListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetConversationListResponse>(create);
  static GetConversationListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Conversation> get conversationList => $_getList(1);
}

class GetChatMessageListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetChatMessageListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetEmail')
    ..hasRequiredFields = false
  ;

  GetChatMessageListRequest._() : super();
  factory GetChatMessageListRequest({
    $core.String? yourEmail,
    $core.String? targetEmail,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    if (targetEmail != null) {
      _result.targetEmail = targetEmail;
    }
    return _result;
  }
  factory GetChatMessageListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatMessageListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatMessageListRequest clone() => GetChatMessageListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatMessageListRequest copyWith(void Function(GetChatMessageListRequest) updates) => super.copyWith((message) => updates(message as GetChatMessageListRequest)) as GetChatMessageListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetChatMessageListRequest create() => GetChatMessageListRequest._();
  GetChatMessageListRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatMessageListRequest> createRepeated() => $pb.PbList<GetChatMessageListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatMessageListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatMessageListRequest>(create);
  static GetChatMessageListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetEmail => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetEmail($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetEmail() => clearField(2);
}

class GetChatMessageListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetChatMessageListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..pc<ChatMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chatMessageList', $pb.PbFieldType.PM, subBuilder: ChatMessage.create)
    ..hasRequiredFields = false
  ;

  GetChatMessageListResponse._() : super();
  factory GetChatMessageListResponse({
    $core.String? error,
    $core.Iterable<ChatMessage>? chatMessageList,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (chatMessageList != null) {
      _result.chatMessageList.addAll(chatMessageList);
    }
    return _result;
  }
  factory GetChatMessageListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatMessageListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatMessageListResponse clone() => GetChatMessageListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatMessageListResponse copyWith(void Function(GetChatMessageListResponse) updates) => super.copyWith((message) => updates(message as GetChatMessageListResponse)) as GetChatMessageListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetChatMessageListResponse create() => GetChatMessageListResponse._();
  GetChatMessageListResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatMessageListResponse> createRepeated() => $pb.PbList<GetChatMessageListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatMessageListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatMessageListResponse>(create);
  static GetChatMessageListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ChatMessage> get chatMessageList => $_getList(1);
}

class DeleteMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteMessageRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOM<ChatMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message', subBuilder: ChatMessage.create)
    ..hasRequiredFields = false
  ;

  DeleteMessageRequest._() : super();
  factory DeleteMessageRequest({
    ChatMessage? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory DeleteMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMessageRequest clone() => DeleteMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMessageRequest copyWith(void Function(DeleteMessageRequest) updates) => super.copyWith((message) => updates(message as DeleteMessageRequest)) as DeleteMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest create() => DeleteMessageRequest._();
  DeleteMessageRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageRequest> createRepeated() => $pb.PbList<DeleteMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMessageRequest>(create);
  static DeleteMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ChatMessage get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(ChatMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  ChatMessage ensureMessage() => $_ensure(0);
}

class DeleteMessageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteMessageResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  DeleteMessageResponse._() : super();
  factory DeleteMessageResponse({
    $core.String? error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory DeleteMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteMessageResponse clone() => DeleteMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteMessageResponse copyWith(void Function(DeleteMessageResponse) updates) => super.copyWith((message) => updates(message as DeleteMessageResponse)) as DeleteMessageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteMessageResponse create() => DeleteMessageResponse._();
  DeleteMessageResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteMessageResponse> createRepeated() => $pb.PbList<DeleteMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteMessageResponse>(create);
  static DeleteMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

class DeleteConverstationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteConverstationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourEmail')
    ..aOM<Conversation>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conversation', subBuilder: Conversation.create)
    ..hasRequiredFields = false
  ;

  DeleteConverstationRequest._() : super();
  factory DeleteConverstationRequest({
    $core.String? yourEmail,
    Conversation? conversation,
  }) {
    final _result = create();
    if (yourEmail != null) {
      _result.yourEmail = yourEmail;
    }
    if (conversation != null) {
      _result.conversation = conversation;
    }
    return _result;
  }
  factory DeleteConverstationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteConverstationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteConverstationRequest clone() => DeleteConverstationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteConverstationRequest copyWith(void Function(DeleteConverstationRequest) updates) => super.copyWith((message) => updates(message as DeleteConverstationRequest)) as DeleteConverstationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteConverstationRequest create() => DeleteConverstationRequest._();
  DeleteConverstationRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteConverstationRequest> createRepeated() => $pb.PbList<DeleteConverstationRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteConverstationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteConverstationRequest>(create);
  static DeleteConverstationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get yourEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set yourEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYourEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearYourEmail() => clearField(1);

  @$pb.TagNumber(2)
  Conversation get conversation => $_getN(1);
  @$pb.TagNumber(2)
  set conversation(Conversation v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConversation() => $_has(1);
  @$pb.TagNumber(2)
  void clearConversation() => clearField(2);
  @$pb.TagNumber(2)
  Conversation ensureConversation() => $_ensure(1);
}

class DeleteConverstationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteConverstationResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'chat_with_friends_service'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  DeleteConverstationResponse._() : super();
  factory DeleteConverstationResponse({
    $core.String? error,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory DeleteConverstationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteConverstationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteConverstationResponse clone() => DeleteConverstationResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteConverstationResponse copyWith(void Function(DeleteConverstationResponse) updates) => super.copyWith((message) => updates(message as DeleteConverstationResponse)) as DeleteConverstationResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteConverstationResponse create() => DeleteConverstationResponse._();
  DeleteConverstationResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteConverstationResponse> createRepeated() => $pb.PbList<DeleteConverstationResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteConverstationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteConverstationResponse>(create);
  static DeleteConverstationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
}

