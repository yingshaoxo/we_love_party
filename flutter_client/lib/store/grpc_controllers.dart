import 'dart:core';

import 'package:flutter_client/generated_grpc/account_auth_service.pbgrpc.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pbgrpc.dart';
import 'package:flutter_client/generated_grpc/room_control_service.pbgrpc.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../generated_grpc/free_map_service.pbgrpc.dart';

CallOptions get_JWT_CallOptions_for_GRPC() {
  return CallOptions(
    metadata: <String, String>{
      'jwt': variable_controller.jwt ?? "",
    },
  );
}

class AuthGrpcControllr extends GetxController {
  ClientChannel channel = ClientChannel(
    GrpcConfig.account_auth_service,
    port: GrpcConfig.port_number,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  AccountAuthenticationServiceClient
      get_account_authentication_service_client() {
    channel = ClientChannel(
      GrpcConfig.account_auth_service,
      port: GrpcConfig.port_number,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return AccountAuthenticationServiceClient(channel);
  }

  Future<bool> ask_for_registering({required String email}) async {
    try {
      final client = get_account_authentication_service_client();
      final response = await client.userRegisterRequest(
          RegisterRequest()..email = email,
          options: get_JWT_CallOptions_for_GRPC());

      String error = response.error;
      if (error.isNotEmpty) {
        print('pre_register failed: $error');
        return false;
      }

      await channel.shutdown();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> registering_confirm(
      {required String email, required String code}) async {
    try {
      final client = get_account_authentication_service_client();

      final response = await client.userRegisterConfirm(
          RegisterConfirmRequest()
            ..email = email
            ..randomString = code,
          options: get_JWT_CallOptions_for_GRPC());

      String error = response.error;
      if (error.isNotEmpty) {
        print('register_confirm failed: $error');
        return null;
      }

      await channel.shutdown();

      return response.jwt;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<IsJwtOkReply> check_if_jwt_is_ok({required String? jwt}) async {
    IsJwtOkReply default_response = IsJwtOkReply();

    if (jwt == null || jwt == "") {
      default_response.error = "jwt is empty or null";
      return default_response;
    }

    try {
      final client = get_account_authentication_service_client();

      final isJwtOkRequest = IsJwtOkRequest();
      isJwtOkRequest.jwt = jwt;

      final response = await client.isJwtOk(isJwtOkRequest,
          options: get_JWT_CallOptions_for_GRPC());

      return response;
    } catch (e) {
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }
}

class AccountStorageGrpcControllr extends GetxController {
  // Account Controller
  ClientChannel channel = ClientChannel(
    GrpcConfig.account_storage_service,
    port: GrpcConfig.port_number,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  AccountStorageServiceClient get_account_storage_service_client() {
    channel = ClientChannel(
      GrpcConfig.account_storage_service,
      port: GrpcConfig.port_number,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return AccountStorageServiceClient(channel);
  }

  Future<GetUserResponse> get_a_user(String? email) async {
    var default_response = GetUserResponse(userExists: false);

    if (email == null) {
      return default_response;
    }

    try {
      final client = get_account_storage_service_client();

      final getUserRequest = GetUserRequest();
      getUserRequest.email = email;

      final response = await client.getUser(getUserRequest,
          options: get_JWT_CallOptions_for_GRPC());

      return response;
    } catch (e) {
      print(e);
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }

  Future<UpdateUserResponse> update_a_user(
      UpdateUserRequest updateUserRequest) async {
    var default_response =
        UpdateUserResponse(result: "", error: "unknown error");

    try {
      final client = get_account_storage_service_client();

      CreateUserRequest createUserRequest = CreateUserRequest();
      createUserRequest.email = updateUserRequest.email;

      var create_response = await client.createUser(createUserRequest,
          options: get_JWT_CallOptions_for_GRPC());

      UpdateUserResponse update_response = await client.updateUser(
          updateUserRequest,
          options: get_JWT_CallOptions_for_GRPC());

      await channel.shutdown();
      return update_response;
    } catch (e) {
      print(e);
      return default_response;
    }
  }
}

class RoomControlGrpcControllr extends GetxController {
  ClientChannel channel = ClientChannel(
    GrpcConfig.room_control_service,
    port: GrpcConfig.port_number,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  RoomControlServiceClient get_room_control_service_client() {
    channel = ClientChannel(
      GrpcConfig.room_control_service,
      port: GrpcConfig.port_number,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return RoomControlServiceClient(channel);
  }

  Future<List<RoomInfo>> getRoomList() async {
    List<RoomInfo> default_response = [];

    try {
      final client = get_room_control_service_client();
      final response = await client.listRooms(ListRoomsRequest(),
          options: get_JWT_CallOptions_for_GRPC());
      print('room list received: ${response.rooms}');

      return response.rooms;
    } catch (e) {
      print(e);
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }

  Future<CreateRoomResponse> createRoom({required String roomName}) async {
    CreateRoomResponse default_response =
        CreateRoomResponse(error: "Unknown Error", success: false);

    try {
      final client = get_room_control_service_client();
      final response = await client.createRoom(
          CreateRoomRequest(roomName: roomName),
          options: get_JWT_CallOptions_for_GRPC());

      if (response.success) {
        print('room created: $roomName');
      }
      return response;
    } catch (e) {
      print(e);
      default_response.error = e.toString();
      return default_response;
    } finally {
      await channel.shutdown();
    }
  }

  Future<AllowJoinResponse> getAccessToARoom({required String roomName}) async {
    AllowJoinResponse default_response = AllowJoinResponse();

    try {
      final client = get_room_control_service_client();
      final response = await client.allowJoin(
          AllowJoinRequest(
              roomName: roomName, identity: variable_controller.user_email),
          options: get_JWT_CallOptions_for_GRPC());

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

class FreeMapGrpcControllr extends GetxController {
  ClientChannel channel = ClientChannel(
    GrpcConfig.free_map_service,
    port: GrpcConfig.port_number,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  FreeMapServiceClient get_free_map_service_client() {
    channel = ClientChannel(
      GrpcConfig.free_map_service,
      port: GrpcConfig.port_number,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    return FreeMapServiceClient(channel);
  }

  Future<SearchPlacesResponse> search_locations(
      SearchPlacesRequest searchPlacesRequest) async {
    SearchPlacesResponse default_response = SearchPlacesResponse();
    default_response.error = "";

    try {
      final client = get_free_map_service_client();
      final response = await client.searchPlaces(searchPlacesRequest,
          options: get_JWT_CallOptions_for_GRPC());
      print('room list received: ${response.locationOfFreeMap}');
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
