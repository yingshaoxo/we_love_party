import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> show_exit_confirm_pop_window() async {
  if (Get.context != null) {
    await Alert(
      context: Get.context!,
      type: AlertType.error,
      style: AlertStyle(
          titleStyle: TextStyle(), descStyle: TextStyle(fontSize: 16)),
      title: "Error",
      desc: "Can't connect to the service.",
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
