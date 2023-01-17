import 'package:flutter_client/store/face_scan_controller.dart';
import 'package:flutter_client/store/grpc_controllers.dart';
import 'package:flutter_client/store/variables.dart';
import 'package:get/get.dart';

final variable_controller = Get.put(VariableControllr(), permanent: true);

final grpc_account_storage_controllr =
    Get.put(AccountStorageControllr(), permanent: true);

final grpc_JWT_controller = Get.put(JWTGrpcControllr(), permanent: true);

final face_scan_controller = Get.put(FaceScanControllr(), permanent: true);

// final roomControlGrpcControllr =
//     Get.put(RoomControlGrpcControllr(), permanent: true);
