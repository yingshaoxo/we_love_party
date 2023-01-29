import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//"Unknown error, see you in the next version!"
Future<void> show_exit_confirm_pop_window({
  String msg = "Can't connect to the service.",
}) async {
  if (Get.context != null) {
    await Alert(
      context: Get.context!,
      type: AlertType.error,
      style: AlertStyle(
          titleStyle: TextStyle(),
          descStyle: TextStyle(fontSize: 16),
          isOverlayTapDismiss: false),
      title: "Error",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "That's OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Get.back(),
        )
      ],
    ).show();
  }

  exit(0);
}
