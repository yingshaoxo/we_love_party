///
//  Generated code. Do not modify.
//  source: account_auth_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account_auth_service.pb.dart' as $0;
export 'account_auth_service.pb.dart';

class AccountAuthenticationServiceClient extends $grpc.Client {
  static final _$sayHello = $grpc.ClientMethod<$0.HelloRequest, $0.HelloReply>(
      '/account_auth_service.AccountAuthenticationService/SayHello',
      ($0.HelloRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HelloReply.fromBuffer(value));
  static final _$userRegisterRequest = $grpc.ClientMethod<$0.RegisterRequest,
          $0.RegisterReply>(
      '/account_auth_service.AccountAuthenticationService/UserRegisterRequest',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterReply.fromBuffer(value));
  static final _$userRegisterConfirm = $grpc.ClientMethod<
          $0.RegisterConfirmRequest, $0.RegisterConfirmReply>(
      '/account_auth_service.AccountAuthenticationService/UserRegisterConfirm',
      ($0.RegisterConfirmRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RegisterConfirmReply.fromBuffer(value));
  static final _$isJwtOk =
      $grpc.ClientMethod<$0.IsJwtOkRequest, $0.IsJwtOkReply>(
          '/account_auth_service.AccountAuthenticationService/IsJwtOk',
          ($0.IsJwtOkRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.IsJwtOkReply.fromBuffer(value));

  AccountAuthenticationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HelloReply> sayHello($0.HelloRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sayHello, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterReply> userRegisterRequest(
      $0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userRegisterRequest, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterConfirmReply> userRegisterConfirm(
      $0.RegisterConfirmRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userRegisterConfirm, request, options: options);
  }

  $grpc.ResponseFuture<$0.IsJwtOkReply> isJwtOk($0.IsJwtOkRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isJwtOk, request, options: options);
  }
}

abstract class AccountAuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'account_auth_service.AccountAuthenticationService';

  AccountAuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HelloRequest, $0.HelloReply>(
        'SayHello',
        sayHello_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HelloRequest.fromBuffer(value),
        ($0.HelloReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterReply>(
        'UserRegisterRequest',
        userRegisterRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RegisterConfirmRequest, $0.RegisterConfirmReply>(
            'UserRegisterConfirm',
            userRegisterConfirm_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RegisterConfirmRequest.fromBuffer(value),
            ($0.RegisterConfirmReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IsJwtOkRequest, $0.IsJwtOkReply>(
        'IsJwtOk',
        isJwtOk_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IsJwtOkRequest.fromBuffer(value),
        ($0.IsJwtOkReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.HelloReply> sayHello_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HelloRequest> request) async {
    return sayHello(call, await request);
  }

  $async.Future<$0.RegisterReply> userRegisterRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return userRegisterRequest(call, await request);
  }

  $async.Future<$0.RegisterConfirmReply> userRegisterConfirm_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RegisterConfirmRequest> request) async {
    return userRegisterConfirm(call, await request);
  }

  $async.Future<$0.IsJwtOkReply> isJwtOk_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IsJwtOkRequest> request) async {
    return isJwtOk(call, await request);
  }

  $async.Future<$0.HelloReply> sayHello(
      $grpc.ServiceCall call, $0.HelloRequest request);
  $async.Future<$0.RegisterReply> userRegisterRequest(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.RegisterConfirmReply> userRegisterConfirm(
      $grpc.ServiceCall call, $0.RegisterConfirmRequest request);
  $async.Future<$0.IsJwtOkReply> isJwtOk(
      $grpc.ServiceCall call, $0.IsJwtOkRequest request);
}