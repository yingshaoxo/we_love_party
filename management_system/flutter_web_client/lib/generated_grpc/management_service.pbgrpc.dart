///
//  Generated code. Do not modify.
//  source: management_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'management_service.pb.dart' as $0;
export 'management_service.pb.dart';

class ManagementServiceClient extends $grpc.Client {
  static final _$getUsers =
      $grpc.ClientMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
          '/management_service.ManagementService/GetUsers',
          ($0.GetUsersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUsersResponse.fromBuffer(value));
  static final _$searchPlaces =
      $grpc.ClientMethod<$0.SearchPlacesRequest, $0.SearchPlacesResponse>(
          '/management_service.ManagementService/SearchPlaces',
          ($0.SearchPlacesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SearchPlacesResponse.fromBuffer(value));
  static final _$addPlace =
      $grpc.ClientMethod<$0.AddPlaceRequest, $0.AddPlaceResponse>(
          '/management_service.ManagementService/AddPlace',
          ($0.AddPlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddPlaceResponse.fromBuffer(value));
  static final _$updatePlace =
      $grpc.ClientMethod<$0.UpdatePlaceRequest, $0.UpdatePlaceResponse>(
          '/management_service.ManagementService/UpdatePlace',
          ($0.UpdatePlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePlaceResponse.fromBuffer(value));
  static final _$deletePlace =
      $grpc.ClientMethod<$0.DeletePlaceRequest, $0.DeletePlaceResponse>(
          '/management_service.ManagementService/DeletePlace',
          ($0.DeletePlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeletePlaceResponse.fromBuffer(value));

  ManagementServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUsersResponse> getUsers($0.GetUsersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchPlacesResponse> searchPlaces(
      $0.SearchPlacesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchPlaces, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddPlaceResponse> addPlace($0.AddPlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPlace, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePlaceResponse> updatePlace(
      $0.UpdatePlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePlace, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePlaceResponse> deletePlace(
      $0.DeletePlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePlace, request, options: options);
  }
}

abstract class ManagementServiceBase extends $grpc.Service {
  $core.String get $name => 'management_service.ManagementService';

  ManagementServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUsersRequest, $0.GetUsersResponse>(
        'GetUsers',
        getUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUsersRequest.fromBuffer(value),
        ($0.GetUsersResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SearchPlacesRequest, $0.SearchPlacesResponse>(
            'SearchPlaces',
            searchPlaces_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SearchPlacesRequest.fromBuffer(value),
            ($0.SearchPlacesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddPlaceRequest, $0.AddPlaceResponse>(
        'AddPlace',
        addPlace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddPlaceRequest.fromBuffer(value),
        ($0.AddPlaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdatePlaceRequest, $0.UpdatePlaceResponse>(
            'UpdatePlace',
            updatePlace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdatePlaceRequest.fromBuffer(value),
            ($0.UpdatePlaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeletePlaceRequest, $0.DeletePlaceResponse>(
            'DeletePlace',
            deletePlace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeletePlaceRequest.fromBuffer(value),
            ($0.DeletePlaceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUsersResponse> getUsers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetUsersRequest> request) async {
    return getUsers(call, await request);
  }

  $async.Future<$0.SearchPlacesResponse> searchPlaces_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SearchPlacesRequest> request) async {
    return searchPlaces(call, await request);
  }

  $async.Future<$0.AddPlaceResponse> addPlace_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddPlaceRequest> request) async {
    return addPlace(call, await request);
  }

  $async.Future<$0.UpdatePlaceResponse> updatePlace_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdatePlaceRequest> request) async {
    return updatePlace(call, await request);
  }

  $async.Future<$0.DeletePlaceResponse> deletePlace_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeletePlaceRequest> request) async {
    return deletePlace(call, await request);
  }

  $async.Future<$0.GetUsersResponse> getUsers(
      $grpc.ServiceCall call, $0.GetUsersRequest request);
  $async.Future<$0.SearchPlacesResponse> searchPlaces(
      $grpc.ServiceCall call, $0.SearchPlacesRequest request);
  $async.Future<$0.AddPlaceResponse> addPlace(
      $grpc.ServiceCall call, $0.AddPlaceRequest request);
  $async.Future<$0.UpdatePlaceResponse> updatePlace(
      $grpc.ServiceCall call, $0.UpdatePlaceRequest request);
  $async.Future<$0.DeletePlaceResponse> deletePlace(
      $grpc.ServiceCall call, $0.DeletePlaceRequest request);
}
