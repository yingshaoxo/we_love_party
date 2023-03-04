import 'dart:core';

import 'package:flutter_web_client/generated_grpc/management_service.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
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

class ManagementGrpcControllr extends GetxController {
  // ClientChannel channel = ClientChannel(
  //   GrpcConfig.management_service,
  //   port: GrpcConfig.port_number,
  //   options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  // );
  GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(
      Uri.parse(GrpcConfig.management_service_web_url));

  ManagementServiceClient get_chat_with_friends_service_client() {
    channel = GrpcWebClientChannel.xhr(
        Uri.parse(GrpcConfig.management_service_web_url));
    // GrpcConfig.management_service,
    // port: GrpcConfig.port_number,
    // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

    return ManagementServiceClient(channel);
  }

  Future<GetUsersResponse> get_users(GetUsersRequest getUsersRequest) async {
    GetUsersResponse default_response = GetUsersResponse();
    default_response.error = "";

    try {
      final client = get_chat_with_friends_service_client();
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
}
