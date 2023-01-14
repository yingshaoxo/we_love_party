import 'package:flutter_client/store/face_scan_controller.dart';
import 'package:flutter_client/store/grpc_controller.dart';
import 'package:flutter_client/store/variables.dart';
import 'package:get/get.dart';

final variableController = Get.put(VariableControllr(), permanent: true);

final jwtGrpcController = Get.put(JWTGrpcControllr(), permanent: true);

final face_scan_controller = Get.put(FaceScanControllr(), permanent: true);

// final roomControlGrpcControllr =
//     Get.put(RoomControlGrpcControllr(), permanent: true);
