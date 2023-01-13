import 'dart:collection';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraControllr extends GetxController {
  final camera_image_queue = Queue<CameraImage>();

  void ask_for_registering({required String email}) async {}
}
