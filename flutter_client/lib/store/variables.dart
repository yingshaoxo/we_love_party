import 'dart:core';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_client/tools/utils/utils.dart';

import 'config.dart';

class LocalStorageKeys {
  static const user_email = "user_email";
  static const jwt = "jwt";
  static const username = "username";
}

class VariableControllr extends GetxController {
  SharedPreferences? preferences;

  String device_UUID = "";
  final cron = Cron();

  String? jwt;
  String? user_email;
  String? username;

  UserModel userModel = UserModel();

  String? access_token;

  Future<void> initilize_function() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    preferences = await _prefs;

    jwt = preferences?.getString(LocalStorageKeys.jwt);
    user_email = preferences?.getString(LocalStorageKeys.user_email);
    username = preferences?.getString(LocalStorageKeys.username);

    if (in_dev_mode) {
      jwt =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpbmdzaGFveG9AZ21haWwuY29tIiwicmFuZG9tX3N0cmluZyI6IjU1ODQ0OCJ9.kcVthYPI_IL6aD7Mx9KdDCFsAEXvgsxTtAM_dYs5Qko";
      user_email = "yingshaoxo@gmail.com";
    }
  }

  Future<void> save_jwt(String? jwt) async {
    if (jwt != null && jwt != "") {
      this.jwt = jwt;
      await preferences?.setString(LocalStorageKeys.jwt, jwt);
    }
  }

  Future<void> save_user_email(String? user_email) async {
    if (user_email != null && user_email != "") {
      this.user_email = user_email;
      await preferences?.setString(LocalStorageKeys.user_email, user_email);
    }
  }

  Future<void> save_username(String? username) async {
    if (username != null && username != "") {
      this.username = username;
      await preferences?.setString(LocalStorageKeys.username, username);
    }
  }
}
