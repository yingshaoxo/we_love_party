import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_web_client/store/controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated_grpc/management_service.pb.dart';
import 'config.dart';

class LocalStorageKeys {
  static const user_email = "user_email";
  static const jwt = "jwt";
}

class VariableControllr extends GetxController {
  SharedPreferences? preferences;

  String? jwt;

  Future<void> initilize_function() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    preferences = await _prefs;

    jwt = preferences?.getString(LocalStorageKeys.jwt);

    management_page_controller.initilize_function();

    if (in_dev_mode) {
      jwt =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InlpbmdzaGFveG9AZ21haWwuY29tIiwicmFuZG9tX3N0cmluZyI6IjU1ODQ0OCJ9.kcVthYPI_IL6aD7Mx9KdDCFsAEXvgsxTtAM_dYs5Qko";
    }
  }

  Future<bool> check_if_jwt_is_valid(String the_jwt) async {
    var old_jwt = jwt;

    jwt = the_jwt;

    var response = await management_grpc_controller
        .get_users(GetUsersRequest(pageNumber: 0, pageSize: 3));

    if (response.error != null && response.error.isNotEmpty) {
      jwt = old_jwt;
      return false;
    } else {
      jwt = old_jwt;
      return true;
    }
  }

  Future<void> save_jwt(String? jwt) async {
    if (jwt != null && jwt != "") {
      this.jwt = jwt;
      await preferences?.setString(LocalStorageKeys.jwt, jwt);
    }
  }
}
