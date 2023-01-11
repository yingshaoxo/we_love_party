///
//  Generated code. Do not modify.
//  source: account_storage_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account_storage_service.pb.dart' as $1;
export 'account_storage_service.pb.dart';

class AccountStorageServiceClient extends $grpc.Client {
  static final _$createUser =
      $grpc.ClientMethod<$1.CreateUserRequest, $1.CreateUserResponse>(
          '/account_storage_service.AccountStorageService/CreateUser',
          ($1.CreateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CreateUserResponse.fromBuffer(value));
  static final _$deleteUser =
      $grpc.ClientMethod<$1.DeleteUserRequest, $1.DeleteUserResponse>(
          '/account_storage_service.AccountStorageService/DeleteUser',
          ($1.DeleteUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.DeleteUserResponse.fromBuffer(value));
  static final _$updateUser =
      $grpc.ClientMethod<$1.UpdateUserRequest, $1.UpdateUserResponse>(
          '/account_storage_service.AccountStorageService/UpdateUser',
          ($1.UpdateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.UpdateUserResponse.fromBuffer(value));

  AccountStorageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CreateUserResponse> createUser(
      $1.CreateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.DeleteUserResponse> deleteUser(
      $1.DeleteUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.UpdateUserResponse> updateUser(
      $1.UpdateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }
}

abstract class AccountStorageServiceBase extends $grpc.Service {
  $core.String get $name => 'account_storage_service.AccountStorageService';

  AccountStorageServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateUserRequest, $1.CreateUserResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateUserRequest.fromBuffer(value),
        ($1.CreateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteUserRequest, $1.DeleteUserResponse>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteUserRequest.fromBuffer(value),
        ($1.DeleteUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateUserRequest, $1.UpdateUserResponse>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdateUserRequest.fromBuffer(value),
        ($1.UpdateUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CreateUserResponse> createUser_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateUserRequest> request) async {
    return createUser(call, await request);
  }

  $async.Future<$1.DeleteUserResponse> deleteUser_Pre($grpc.ServiceCall call,
      $async.Future<$1.DeleteUserRequest> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$1.UpdateUserResponse> updateUser_Pre($grpc.ServiceCall call,
      $async.Future<$1.UpdateUserRequest> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.CreateUserResponse> createUser(
      $grpc.ServiceCall call, $1.CreateUserRequest request);
  $async.Future<$1.DeleteUserResponse> deleteUser(
      $grpc.ServiceCall call, $1.DeleteUserRequest request);
  $async.Future<$1.UpdateUserResponse> updateUser(
      $grpc.ServiceCall call, $1.UpdateUserRequest request);
}
