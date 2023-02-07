import 'package:flutter_client/store/face_scan_controller.dart';
import 'package:flutter_client/store/grpc_controllers.dart';
import 'package:flutter_client/store/variables.dart';
import 'package:get/get.dart';

final variable_controller = Get.put(VariableControllr(), permanent: true);

final account_storage_grpc_controllr =
    Get.put(AccountStorageGrpcControllr(), permanent: true);

final auth_grpc_controller = Get.put(AuthGrpcControllr(), permanent: true);

final face_scan_controller = Get.put(FaceScanControllr(), permanent: true);

final room_control_grpc_controllr =
    Get.put(RoomControlGrpcControllr(), permanent: true);

final free_map_grpc_controller =
    Get.put(FreeMapGrpcControllr(), permanent: true);
