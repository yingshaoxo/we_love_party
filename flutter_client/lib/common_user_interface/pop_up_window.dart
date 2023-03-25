import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void show_toast({required String message, bool long_stay = false}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: long_stay ? Toast.LENGTH_SHORT : Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

Future<void> show_message({required String msg}) async {
  if (Get.context != null) {
    await Alert(
      context: Get.context!,
      type: AlertType.info,
      style: AlertStyle(
          titleStyle: TextStyle(),
          descStyle: TextStyle(fontSize: 16),
          isOverlayTapDismiss: false),
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
          titleStyle: TextStyle(),
          descStyle: TextStyle(fontSize: 16),
          isOverlayTapDismiss: false),
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
