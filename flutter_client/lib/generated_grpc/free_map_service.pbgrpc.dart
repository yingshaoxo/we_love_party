///
//  Generated code. Do not modify.
//  source: free_map_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'free_map_service.pb.dart' as $3;
export 'free_map_service.pb.dart';

class FreeMapServiceClient extends $grpc.Client {
  static final _$searchPlaces =
      $grpc.ClientMethod<$3.SearchPlacesRequest, $3.SearchPlacesResponse>(
          '/free_map_service.FreeMapService/SearchPlaces',
          ($3.SearchPlacesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.SearchPlacesResponse.fromBuffer(value));
  static final _$addPlace =
      $grpc.ClientMethod<$3.AddPlaceRequest, $3.AddPlaceResponse>(
          '/free_map_service.FreeMapService/AddPlace',
          ($3.AddPlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.AddPlaceResponse.fromBuffer(value));
  static final _$updatePlace =
      $grpc.ClientMethod<$3.UpdatePlaceRequest, $3.UpdatePlaceResponse>(
          '/free_map_service.FreeMapService/UpdatePlace',
          ($3.UpdatePlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.UpdatePlaceResponse.fromBuffer(value));
  static final _$deletePlace =
      $grpc.ClientMethod<$3.DeletePlaceRequest, $3.DeletePlaceResponse>(
          '/free_map_service.FreeMapService/DeletePlace',
          ($3.DeletePlaceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.DeletePlaceResponse.fromBuffer(value));

  FreeMapServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.SearchPlacesResponse> searchPlaces(
      $3.SearchPlacesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchPlaces, request, options: options);
  }

  $grpc.ResponseFuture<$3.AddPlaceResponse> addPlace($3.AddPlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPlace, request, options: options);
  }

  $grpc.ResponseFuture<$3.UpdatePlaceResponse> updatePlace(
      $3.UpdatePlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePlace, request, options: options);
  }

  $grpc.ResponseFuture<$3.DeletePlaceResponse> deletePlace(
      $3.DeletePlaceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePlace, request, options: options);
  }
}

abstract class FreeMapServiceBase extends $grpc.Service {
  $core.String get $name => 'free_map_service.FreeMapService';

  FreeMapServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$3.SearchPlacesRequest, $3.SearchPlacesResponse>(
            'SearchPlaces',
            searchPlaces_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.SearchPlacesRequest.fromBuffer(value),
            ($3.SearchPlacesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.AddPlaceRequest, $3.AddPlaceResponse>(
        'AddPlace',
        addPlace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.AddPlaceRequest.fromBuffer(value),
        ($3.AddPlaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.UpdatePlaceRequest, $3.UpdatePlaceResponse>(
            'UpdatePlace',
            updatePlace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.UpdatePlaceRequest.fromBuffer(value),
            ($3.UpdatePlaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$3.DeletePlaceRequest, $3.DeletePlaceResponse>(
            'DeletePlace',
            deletePlace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $3.DeletePlaceRequest.fromBuffer(value),
            ($3.DeletePlaceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.SearchPlacesResponse> searchPlaces_Pre(
      $grpc.ServiceCall call,
      $async.Future<$3.SearchPlacesRequest> request) async {
    return searchPlaces(call, await request);
  }

  $async.Future<$3.AddPlaceResponse> addPlace_Pre(
      $grpc.ServiceCall call, $async.Future<$3.AddPlaceRequest> request) async {
    return addPlace(call, await request);
  }

  $async.Future<$3.UpdatePlaceResponse> updatePlace_Pre($grpc.ServiceCall call,
      $async.Future<$3.UpdatePlaceRequest> request) async {
    return updatePlace(call, await request);
  }

  $async.Future<$3.DeletePlaceResponse> deletePlace_Pre($grpc.ServiceCall call,
      $async.Future<$3.DeletePlaceRequest> request) async {
    return deletePlace(call, await request);
  }

  $async.Future<$3.SearchPlacesResponse> searchPlaces(
      $grpc.ServiceCall call, $3.SearchPlacesRequest request);
  $async.Future<$3.AddPlaceResponse> addPlace(
      $grpc.ServiceCall call, $3.AddPlaceRequest request);
  $async.Future<$3.UpdatePlaceResponse> updatePlace(
      $grpc.ServiceCall call, $3.UpdatePlaceRequest request);
  $async.Future<$3.DeletePlaceResponse> deletePlace(
      $grpc.ServiceCall call, $3.DeletePlaceRequest request);
}
