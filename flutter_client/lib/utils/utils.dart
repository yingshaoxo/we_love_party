import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

Future<String> get_unique_device_id() async {
  var deviceInfo = DeviceInfoPlugin();
  String? theId = "123e4567-e89b-12d3-a456-426614174000";
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    theId = iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    theId = await PlatformDeviceId.getDeviceId ?? ""; // unique ID on Android
  }
  return theId!;
}

Int64 get_current_time_in_milliseconds() {
  return Int64(DateTime.now().millisecondsSinceEpoch);
}

int get_a_random_number(min, max) {
  return min + Random().nextInt(max - min);
}

bool email_validator(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

Future<void> copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
