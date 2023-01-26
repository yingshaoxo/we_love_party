///
//  Generated code. Do not modify.
//  source: room_control_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room_control_service.pb.dart' as $2;
export 'room_control_service.pb.dart';

class RoomControlServiceClient extends $grpc.Client {
  static final _$createRoom =
      $grpc.ClientMethod<$2.CreateRoomRequest, $2.CreateRoomResponse>(
          '/room_control_service.RoomControlService/CreateRoom',
          ($2.CreateRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.CreateRoomResponse.fromBuffer(value));
  static final _$allowJoin =
      $grpc.ClientMethod<$2.AllowJoinRequest, $2.AllowJoinResponse>(
          '/room_control_service.RoomControlService/AllowJoin',
          ($2.AllowJoinRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.AllowJoinResponse.fromBuffer(value));
  static final _$listRooms =
      $grpc.ClientMethod<$2.ListRoomsRequest, $2.ListRoomsResponse>(
          '/room_control_service.RoomControlService/ListRooms',
          ($2.ListRoomsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ListRoomsResponse.fromBuffer(value));
  static final _$deleteRoom =
      $grpc.ClientMethod<$2.DeleteRoomRequest, $2.DeleteRoomResponse>(
          '/room_control_service.RoomControlService/DeleteRoom',
          ($2.DeleteRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.DeleteRoomResponse.fromBuffer(value));

  RoomControlServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.CreateRoomResponse> createRoom(
      $2.CreateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$2.AllowJoinResponse> allowJoin(
      $2.AllowJoinRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$allowJoin, request, options: options);
  }

  $grpc.ResponseFuture<$2.ListRoomsResponse> listRooms(
      $2.ListRoomsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRooms, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteRoomResponse> deleteRoom(
      $2.DeleteRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteRoom, request, options: options);
  }
}

abstract class RoomControlServiceBase extends $grpc.Service {
  $core.String get $name => 'room_control_service.RoomControlService';

  RoomControlServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CreateRoomRequest, $2.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateRoomRequest.fromBuffer(value),
        ($2.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.AllowJoinRequest, $2.AllowJoinResponse>(
        'AllowJoin',
        allowJoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.AllowJoinRequest.fromBuffer(value),
        ($2.AllowJoinResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListRoomsRequest, $2.ListRoomsResponse>(
        'ListRooms',
        listRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListRoomsRequest.fromBuffer(value),
        ($2.ListRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteRoomRequest, $2.DeleteRoomResponse>(
        'DeleteRoom',
        deleteRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteRoomRequest.fromBuffer(value),
        ($2.DeleteRoomResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall call,
      $async.Future<$2.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$2.AllowJoinResponse> allowJoin_Pre($grpc.ServiceCall call,
      $async.Future<$2.AllowJoinRequest> request) async {
    return allowJoin(call, await request);
  }

  $async.Future<$2.ListRoomsResponse> listRooms_Pre($grpc.ServiceCall call,
      $async.Future<$2.ListRoomsRequest> request) async {
    return listRooms(call, await request);
  }

  $async.Future<$2.DeleteRoomResponse> deleteRoom_Pre($grpc.ServiceCall call,
      $async.Future<$2.DeleteRoomRequest> request) async {
    return deleteRoom(call, await request);
  }

  $async.Future<$2.CreateRoomResponse> createRoom(
      $grpc.ServiceCall call, $2.CreateRoomRequest request);
  $async.Future<$2.AllowJoinResponse> allowJoin(
      $grpc.ServiceCall call, $2.AllowJoinRequest request);
  $async.Future<$2.ListRoomsResponse> listRooms(
      $grpc.ServiceCall call, $2.ListRoomsRequest request);
  $async.Future<$2.DeleteRoomResponse> deleteRoom(
      $grpc.ServiceCall call, $2.DeleteRoomRequest request);
}
