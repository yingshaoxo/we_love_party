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

  $async.Future<$4.AddOrUpdateFriendResponse> addOrUpdateFriend(
      $grpc.ServiceCall call, $4.AddOrUpdateFriendRequest request);
  $async.Future<$4.GetFriendListResponse> getFriendList(
      $grpc.ServiceCall call, $4.GetFriendListRequest request);
  $async.Future<$4.DeleteFriendResponse> deleteFriend(
      $grpc.ServiceCall call, $4.DeleteFriendRequest request);
}
