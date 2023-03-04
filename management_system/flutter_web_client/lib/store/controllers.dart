import 'package:get/get.dart';
import 'grpc_controllers.dart';
import 'variables.dart';

final variable_controller = Get.put(VariableControllr(), permanent: true);

final management_grpc_controller =
    Get.put(ManagementGrpcControllr(), permanent: true);
