import 'package:flutter_web_client/store/page_view_controllers/location_management_page_controller.dart';
import 'package:get/get.dart';
import 'grpc_controllers.dart';
import 'variables.dart';

final variable_controller = Get.put(VariableControllr(), permanent: true);

final management_grpc_controller =
    Get.put(ManagementGRPCControllr(), permanent: true);

final management_page_controller =
    Get.put(ManagementPageControllr(), permanent: true);
