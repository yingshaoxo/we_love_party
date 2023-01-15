import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> show_message({required String msg}) async {
  if (Get.context != null) {
    await Alert(
      context: Get.context!,
      type: AlertType.info,
      style: AlertStyle(
          titleStyle: TextStyle(), descStyle: TextStyle(fontSize: 16)),
      title: "Note",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Get.back(),
        )
      ],
    ).show();
  }
}

Future<void> show_error({required String msg}) async {
  if (Get.context != null) {
    await Alert(
      context: Get.context!,
      type: AlertType.error,
      style: AlertStyle(
          titleStyle: TextStyle(), descStyle: TextStyle(fontSize: 16)),
      title: "Error",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Get.back(),
        )
      ],
    ).show();
  }
}
