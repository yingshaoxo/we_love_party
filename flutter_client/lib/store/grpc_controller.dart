import 'dart:core';
import 'dart:io';

import 'package:flutter_client/generated_grpc/account_auth_service.pbgrpc.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pbgrpc.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../common_user_interface/exit.dart';

CallOptions get_JWT_CallOptions_for_GRPC() {
  return CallOptions(
    metadata: <String, String>{
      'jwt': variable_controller.jwt ?? "",
    },
  );
}

class JWTGrpcControllr extends GetxController {
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

  Future<String?> get_email_address_from_JWT_if_it_is_valid(
      {required String jwt}) async {
    try {
      final client = get_account_authentication_service_client();

      final isJwtOkRequest = IsJwtOkRequest();
      isJwtOkRequest.jwt = jwt;

      final response = await client.isJwtOk(isJwtOkRequest,
          options: get_JWT_CallOptions_for_GRPC());

      if (response.email != null && response.email.isNotEmpty) {
        await channel.shutdown();
        return response.email;
      } else {
        print('jwt is not ok');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> check_if_current_JWT_is_valid() async {
    try {
      String? jwt = variable_controller.jwt;
      if (jwt == null || jwt == "") {
        return false;
      }

      String? email = await get_email_address_from_JWT_if_it_is_valid(jwt: jwt);

      if (email != null && email.isNotEmpty) {
        return true;
      } else {
        print('jwt is not ok');
        return false;
      }
    } catch (e) {
      print(e);
      show_exit_confirm_pop_window();
      return false;
    }
  }
}

class AccountStorageControllr extends GetxController {
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

  Future<GetUserResponse> get_a_user(String email) async {
    var default_response = GetUserResponse(userExists: false);

    try {
      final client = get_account_storage_service_client();

      final getUserRequest = GetUserRequest();
      getUserRequest.email = email;

      final response = await client.getUser(getUserRequest,
          options: get_JWT_CallOptions_for_GRPC());

      await channel.shutdown();

      return response;
    } catch (e) {
      print(e);
      return default_response;
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

      CreateUserResponse response = await client.createUser(createUserRequest,
          options: get_JWT_CallOptions_for_GRPC());
      if (response.error != null && response.error != "") {
        return default_response;
      }

      UpdateUserResponse update_response = await client.updateUser(
          updateUserRequest,
          options: get_JWT_CallOptions_for_GRPC());

      if (update_response.error != null && update_response.error != "") {
        return default_response;
      }

      await channel.shutdown();
      return update_response;
    } catch (e) {
      print(e);
      return default_response;
    }
  }
}

// class RoomControlGrpcControllr extends GetxController {
//   ClientChannel channel = ClientChannel(
//     GrpcConfig.hostIPAddress,
//     port: GrpcConfig.roomcontrolservicePortNumber,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );

//   CallOptions getJWTCallOptionsForGRPC() {
//     return CallOptions(
//       metadata: <String, String>{'jwt': variableController.jwt ?? ""},
//       // metadata: <String, String>{'jwt': ""},
//     );
//   }

//   void recreateChannel() {
//     channel = ClientChannel(
//       GrpcConfig.hostIPAddress,
//       port: GrpcConfig.roomcontrolservicePortNumber,
//       options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//     );
//   }

//   Future<List<room_control_service.RoomInfo>> getRoomList() async {
//     recreateChannel();

//     try {
//       final stub = room_control_service.RoomControlServiceClient(channel);
//       final response = await stub.listRooms(
//           room_control_service.ListRoomsRequest(),
//           options: getJWTCallOptionsForGRPC());
//       print('room list received: ${response.rooms}');
//       return response.rooms;
//     } catch (e) {
//       print(e);
//       return [];
//     } finally {
//       await channel.shutdown();
//     }
//   }

//   Future<bool> createRoom({required String roomName}) async {
//     recreateChannel();

//     try {
//       final stub = room_control_service.RoomControlServiceClient(channel);
//       final response = await stub.createRoom(
//           room_control_service.CreateRoomRequest(roomName: roomName),
//           options: getJWTCallOptionsForGRPC());
//       if (response.success) {
//         print('room created: $roomName');
//         return true;
//       }
//       return false;
//     } catch (e) {
//       print(e);
//       return false;
//     } finally {
//       await channel.shutdown();
//     }
//   }

//   Future<String?> getAccessToARoom({required String roomName}) async {
//     recreateChannel();

//     try {
//       final stub = room_control_service.RoomControlServiceClient(channel);
//       final response = await stub.allowJoin(
//           room_control_service.AllowJoinRequest(roomName: roomName),
//           options: getJWTCallOptionsForGRPC());
//       if (response.accessToken != "") {
//         return response.accessToken;
//       }
//       return null;
//     } catch (e) {
//       print(e);
//       return null;
//     } finally {
//       await channel.shutdown();
//     }
//   }
// }
