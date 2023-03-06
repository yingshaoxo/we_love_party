///
//  Generated code. Do not modify.
//  source: account_auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account_auth_service.pb.dart' as $1;
export 'account_auth_service.pb.dart';

class AccountAuthenticationServiceClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$1.HelloRequest, $1.HelloReply>(
      '/account_auth_service.AccountAuthenticationService/SayHello',
      ($1.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.HelloReply.fromBuffer(value));
  static final _$userRegisterRequest = $grpc.ClientMethod<$1.RegisterRequest,
          $1.RegisterReply>(
      '/account_auth_service.AccountAuthenticationService/UserRegisterRequest',
      ($1.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.RegisterReply.fromBuffer(value));
  static final _$userRegisterConfirm = $grpc.ClientMethod<
          $1.RegisterConfirmRequest, $1.RegisterConfirmReply>(
      '/account_auth_service.AccountAuthenticationService/UserRegisterConfirm',
      ($1.RegisterConfirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.RegisterConfirmReply.fromBuffer(value));
  static final _$isJwtOk =
      $grpc.ClientMethod<$1.IsJwtOkRequest, $1.IsJwtOkReply>(
          '/account_auth_service.AccountAuthenticationService/IsJwtOk',
          ($1.IsJwtOkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.IsJwtOkReply.fromBuffer(value));
  static final _$isAdmin =
      $grpc.ClientMethod<$1.IsAdminRequest, $1.IsAdminResponse>(
          '/account_auth_service.AccountAuthenticationService/IsAdmin',
          ($1.IsAdminRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.IsAdminResponse.fromBuffer(value));
  static final _$isOnline =
      $grpc.ClientMethod<$1.IsOnlineRequest, $1.IsOnlineResponse>(
          '/account_auth_service.AccountAuthenticationService/IsOnline',
          ($1.IsOnlineRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.IsOnlineResponse.fromBuffer(value));

  AccountAuthenticationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.HelloReply> sayHello($1.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$1.RegisterReply> userRegisterRequest(
      $1.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userRegisterRequest, request, options: options);
  }

  $grpc.ResponseFuture<$1.RegisterConfirmReply> userRegisterConfirm(
      $1.RegisterConfirmRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userRegisterConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$1.IsJwtOkReply> isJwtOk($1.IsJwtOkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isJwtOk, request, options: options);
  }

  $grpc.ResponseFuture<$1.IsAdminResponse> isAdmin($1.IsAdminRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isAdmin, request, options: options);
  }

  $grpc.ResponseFuture<$1.IsOnlineResponse> isOnline($1.IsOnlineRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isOnline, request, options: options);
  }
}

abstract class AccountAuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'account_auth_service.AccountAuthenticationService';

  AccountAuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.HelloRequest, $1.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.HelloRequest.fromBuffer(value),
        ($1.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RegisterRequest, $1.RegisterReply>(
        'UserRegisterRequest',
        userRegisterRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RegisterRequest.fromBuffer(value),
        ($1.RegisterReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.RegisterConfirmRequest, $1.RegisterConfirmReply>(
            'UserRegisterConfirm',
            userRegisterConfirm_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.RegisterConfirmRequest.fromBuffer(value),
            ($1.RegisterConfirmReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IsJwtOkRequest, $1.IsJwtOkReply>(
        'IsJwtOk',
        isJwtOk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.IsJwtOkRequest.fromBuffer(value),
        ($1.IsJwtOkReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IsAdminRequest, $1.IsAdminResponse>(
        'IsAdmin',
        isAdmin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.IsAdminRequest.fromBuffer(value),
        ($1.IsAdminResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.IsOnlineRequest, $1.IsOnlineResponse>(
        'IsOnline',
        isOnline_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.IsOnlineRequest.fromBuffer(value),
        ($1.IsOnlineResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$1.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$1.RegisterReply> userRegisterRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RegisterRequest> request) async {
    return userRegisterRequest(call, await request);
  }

  $async.Future<$1.RegisterConfirmReply> userRegisterConfirm_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RegisterConfirmRequest> request) async {
    return userRegisterConfirm(call, await request);
  }

  $async.Future<$1.IsJwtOkReply> isJwtOk_Pre(
      $grpc.ServiceCall call, $async.Future<$1.IsJwtOkRequest> request) async {
    return isJwtOk(call, await request);
  }

  $async.Future<$1.IsAdminResponse> isAdmin_Pre(
      $grpc.ServiceCall call, $async.Future<$1.IsAdminRequest> request) async {
    return isAdmin(call, await request);
  }

  $async.Future<$1.IsOnlineResponse> isOnline_Pre(
      $grpc.ServiceCall call, $async.Future<$1.IsOnlineRequest> request) async {
    return isOnline(call, await request);
  }

  $async.Future<$1.HelloReply> sayHello(
      $grpc.ServiceCall call, $1.HelloRequest request);
  $async.Future<$1.RegisterReply> userRegisterRequest(
      $grpc.ServiceCall call, $1.RegisterRequest request);
  $async.Future<$1.RegisterConfirmReply> userRegisterConfirm(
      $grpc.ServiceCall call, $1.RegisterConfirmRequest request);
  $async.Future<$1.IsJwtOkReply> isJwtOk(
      $grpc.ServiceCall call, $1.IsJwtOkRequest request);
  $async.Future<$1.IsAdminResponse> isAdmin(
      $grpc.ServiceCall call, $1.IsAdminRequest request);
  $async.Future<$1.IsOnlineResponse> isOnline(
      $grpc.ServiceCall call, $1.IsOnlineRequest request);
}
