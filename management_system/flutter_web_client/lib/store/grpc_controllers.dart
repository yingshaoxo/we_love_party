import 'dart:core';

import 'package:flutter_web_client/generated_grpc/management_service.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc_web.dart';
import 'config.dart';
import 'controllers.dart';

CallOptions get_JWT_CallOptions_for_GRPC() {
  return CallOptions(
    metadata: <String, String>{
      'jwt': variable_controller.jwt ?? "",
    },
  );
}

class ManagementGRPCControllr extends GetxController {
  GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(
      Uri.parse(GrpcConfig.management_service_web_url));

  ManagementServiceClient get_client() {
    channel = GrpcWebClientChannel.xhr(
        Uri.parse(GrpcConfig.management_service_web_url));

    return ManagementServiceClient(channel);
  }

  Future<GetUsersResponse> get_users(GetUsersRequest getUsersRequest) async {
    GetUsersResponse default_response = GetUsersResponse();
    default_response.error = "";

    try {
      final client = get_client();
      final response = await client.getUsers(getUsersRequest,
          options: get_JWT_CallOptions_for_GRPC());
      print(response.error);
      return response;
    } catch (e) {
      print(e);
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }

  Future<AddPlaceResponse> add_place(AddPlaceRequest addPlaceRequest) async {
    AddPlaceResponse default_response = AddPlaceResponse();
    default_response.error = "";

    try {
      final client = get_client();
      final response = await client.addPlace(addPlaceRequest,
          options: get_JWT_CallOptions_for_GRPC());
      print(response.error);
      return response;
    } catch (e) {
      print(e);
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }

  Future<DeletePlaceResponse> delete_place(
      DeletePlaceRequest deletePlaceRequest) async {
    DeletePlaceResponse default_response = DeletePlaceResponse();
    default_response.error = "";

    try {
      final client = get_client();
      final response = await client.deletePlace(deletePlaceRequest,
          options: get_JWT_CallOptions_for_GRPC());
      print(response.error);
      return response;
    } catch (e) {
      print(e);
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }
}
