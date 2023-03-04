import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

import '../generated_grpc/management_service.pb.dart';
import 'config.dart';

class LocalStorageKeys {
  static const user_email = "user_email";
  static const jwt = "jwt";
}

class VariableControllr extends GetxController {
  final LocalStorage storage =
      LocalStorage('flutter_management_user_interface');

  String? jwt;
  String? user_email;

  UserModel userModel = UserModel();
  Image head_image = Image.asset(
    'assets/images/me.jpg',
    fit: BoxFit.fill,
  );

  // party rooms
  String? access_token;

  // tabs
  int current_tab_index = 0;
  Rx<bool> online = RxBool(true);

  Future<void> initilize_function() async {
    jwt = storage.getItem(LocalStorageKeys.jwt);
    user_email = storage.getItem(LocalStorageKeys.user_email);

    if (in_dev_mode) {
      jwt =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpbmdzaGFveG9AZ21haWwuY29tIiwicmFuZG9tX3N0cmluZyI6IjU1ODQ0OCJ9.kcVthYPI_IL6aD7Mx9KdDCFsAEXvgsxTtAM_dYs5Qko";
      user_email = "yingshaoxo@gmail.com";
    }
  }

  Future<void> save_jwt(String? jwt) async {
    if (jwt != null && jwt != "") {
      this.jwt = jwt;
      await storage.setItem(LocalStorageKeys.jwt, jwt);
    }
  }

  Future<void> save_user_email(String? user_email) async {
    if (user_email != null && user_email != "") {
      this.user_email = user_email;
      await storage.setItem(LocalStorageKeys.user_email, user_email);
    }
  }
}
