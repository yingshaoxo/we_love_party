///
//  Generated code. Do not modify.
//  source: chat_with_friends_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat_with_friends_service.pb.dart' as $4;
export 'chat_with_friends_service.pb.dart';

class ChatWithFriendsServiceClient extends $grpc.Client {
  static final _$addOrUpdateFriend = $grpc.ClientMethod<
          $4.AddOrUpdateFriendRequest, $4.AddOrUpdateFriendResponse>(
      '/chat_with_friends_service.ChatWithFriendsService/AddOrUpdateFriend',
      ($4.AddOrUpdateFriendRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.AddOrUpdateFriendResponse.fromBuffer(value));
  static final _$getFriendList =
      $grpc.ClientMethod<$4.GetFriendListRequest, $4.GetFriendListResponse>(
          '/chat_with_friends_service.ChatWithFriendsService/GetFriendList',
          ($4.GetFriendListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.GetFriendListResponse.fromBuffer(value));
  static final _$deleteFriend =
      $grpc.ClientMethod<$4.DeleteFriendRequest, $4.DeleteFriendResponse>(
          '/chat_with_friends_service.ChatWithFriendsService/DeleteFriend',
          ($4.DeleteFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.DeleteFriendResponse.fromBuffer(value));
  static final _$sendMessageToFriend = $grpc.ClientMethod<
          $4.SendMessageToFriendRequest, $4.SendMessageToFriendResponse>(
      '/chat_with_friends_service.ChatWithFriendsService/SendMessageToFriend',
      ($4.SendMessageToFriendRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.SendMessageToFriendResponse.fromBuffer(value));
  static final _$getConverstationList = $grpc.ClientMethod<
          $4.GetConversationListRequest, $4.GetConversationListResponse>(
      '/chat_with_friends_service.ChatWithFriendsService/GetConverstationList',
      ($4.GetConversationListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.GetConversationListResponse.fromBuffer(value));
  static final _$getChatMessageList = $grpc.ClientMethod<
          $4.GetChatMessageListRequest, $4.GetChatMessageListResponse>(
      '/chat_with_friends_service.ChatWithFriendsService/GetChatMessageList',
      ($4.GetChatMessageListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.GetChatMessageListResponse.fromBuffer(value));
  static final _$deleteMessage =
      $grpc.ClientMethod<$4.DeleteMessageRequest, $4.DeleteMessageResponse>(
          '/chat_with_friends_service.ChatWithFriendsService/DeleteMessage',
          ($4.DeleteMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $4.DeleteMessageResponse.fromBuffer(value));
  static final _$deleteConverstation = $grpc.ClientMethod<
          $4.DeleteConverstationRequest, $4.DeleteConverstationResponse>(
      '/chat_with_friends_service.ChatWithFriendsService/DeleteConverstation',
      ($4.DeleteConverstationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $4.DeleteConverstationResponse.fromBuffer(value));

  ChatWithFriendsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.AddOrUpdateFriendResponse> addOrUpdateFriend(
      $4.AddOrUpdateFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addOrUpdateFriend, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetFriendListResponse> getFriendList(
      $4.GetFriendListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFriendList, request, options: options);
  }

  $grpc.ResponseFuture<$4.DeleteFriendResponse> deleteFriend(
      $4.DeleteFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFriend, request, options: options);
  }

  $grpc.ResponseFuture<$4.SendMessageToFriendResponse> sendMessageToFriend(
      $4.SendMessageToFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessageToFriend, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetConversationListResponse> getConverstationList(
      $4.GetConversationListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getConverstationList, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetChatMessageListResponse> getChatMessageList(
      $4.GetChatMessageListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatMessageList, request, options: options);
  }

  $grpc.ResponseFuture<$4.DeleteMessageResponse> deleteMessage(
      $4.DeleteMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMessage, request, options: options);
  }

  $grpc.ResponseFuture<$4.DeleteConverstationResponse> deleteConverstation(
      $4.DeleteConverstationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteConverstation, request, options: options);
  }
}

abstract class ChatWithFriendsServiceBase extends $grpc.Service {
  $core.String get $name => 'chat_with_friends_service.ChatWithFriendsService';

  ChatWithFriendsServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.AddOrUpdateFriendRequest,
            $4.AddOrUpdateFriendResponse>(
        'AddOrUpdateFriend',
        addOrUpdateFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.AddOrUpdateFriendRequest.fromBuffer(value),
        ($4.AddOrUpdateFriendResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.GetFriendListRequest, $4.GetFriendListResponse>(
            'GetFriendList',
            getFriendList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.GetFriendListRequest.fromBuffer(value),
            ($4.GetFriendListResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.DeleteFriendRequest, $4.DeleteFriendResponse>(
            'DeleteFriend',
            deleteFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.DeleteFriendRequest.fromBuffer(value),
            ($4.DeleteFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SendMessageToFriendRequest,
            $4.SendMessageToFriendResponse>(
        'SendMessageToFriend',
        sendMessageToFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.SendMessageToFriendRequest.fromBuffer(value),
        ($4.SendMessageToFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetConversationListRequest,
            $4.GetConversationListResponse>(
        'GetConverstationList',
        getConverstationList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetConversationListRequest.fromBuffer(value),
        ($4.GetConversationListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetChatMessageListRequest,
            $4.GetChatMessageListResponse>(
        'GetChatMessageList',
        getChatMessageList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetChatMessageListRequest.fromBuffer(value),
        ($4.GetChatMessageListResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$4.DeleteMessageRequest, $4.DeleteMessageResponse>(
            'DeleteMessage',
            deleteMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $4.DeleteMessageRequest.fromBuffer(value),
            ($4.DeleteMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.DeleteConverstationRequest,
            $4.DeleteConverstationResponse>(
        'DeleteConverstation',
        deleteConverstation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.DeleteConverstationRequest.fromBuffer(value),
        ($4.DeleteConverstationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.AddOrUpdateFriendResponse> addOrUpdateFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.AddOrUpdateFriendRequest> request) async {
    return addOrUpdateFriend(call, await request);
  }

  $async.Future<$4.GetFriendListResponse> getFriendList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.GetFriendListRequest> request) async {
    return getFriendList(call, await request);
  }

  $async.Future<$4.DeleteFriendResponse> deleteFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.DeleteFriendRequest> request) async {
    return deleteFriend(call, await request);
  }

  $async.Future<$4.SendMessageToFriendResponse> sendMessageToFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.SendMessageToFriendRequest> request) async {
    return sendMessageToFriend(call, await request);
  }

  $async.Future<$4.GetConversationListResponse> getConverstationList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.GetConversationListRequest> request) async {
    return getConverstationList(call, await request);
  }

  $async.Future<$4.GetChatMessageListResponse> getChatMessageList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.GetChatMessageListRequest> request) async {
    return getChatMessageList(call, await request);
  }

  $async.Future<$4.DeleteMessageResponse> deleteMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.DeleteMessageRequest> request) async {
    return deleteMessage(call, await request);
  }

  $async.Future<$4.DeleteConverstationResponse> deleteConverstation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$4.DeleteConverstationRequest> request) async {
    return deleteConverstation(call, await request);
  }

  $async.Future<$4.AddOrUpdateFriendResponse> addOrUpdateFriend(
      $grpc.ServiceCall call, $4.AddOrUpdateFriendRequest request);
  $async.Future<$4.GetFriendListResponse> getFriendList(
      $grpc.ServiceCall call, $4.GetFriendListRequest request);
  $async.Future<$4.DeleteFriendResponse> deleteFriend(
      $grpc.ServiceCall call, $4.DeleteFriendRequest request);
  $async.Future<$4.SendMessageToFriendResponse> sendMessageToFriend(
      $grpc.ServiceCall call, $4.SendMessageToFriendRequest request);
  $async.Future<$4.GetConversationListResponse> getConverstationList(
      $grpc.ServiceCall call, $4.GetConversationListRequest request);
  $async.Future<$4.GetChatMessageListResponse> getChatMessageList(
      $grpc.ServiceCall call, $4.GetChatMessageListRequest request);
  $async.Future<$4.DeleteMessageResponse> deleteMessage(
      $grpc.ServiceCall call, $4.DeleteMessageRequest request);
  $async.Future<$4.DeleteConverstationResponse> deleteConverstation(
      $grpc.ServiceCall call, $4.DeleteConverstationRequest request);
}
