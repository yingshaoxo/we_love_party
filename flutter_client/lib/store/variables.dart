import 'dart:core';
import 'package:cron/cron.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_client/utils/utils.dart';

class LocalStorageKeys {
  static const user_email = "user_email";
  static const jwt = "jwt";
}

class VariableControllr extends GetxController {
  SharedPreferences? preferences;

  String device_UUID = "";
  final cron = Cron();

  String? jwt;
  String? user_email;

  String? access_token;

  Future<void> initilize_function() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    preferences = await _prefs;

    jwt = preferences?.getString(LocalStorageKeys.jwt);
    user_email = preferences?.getString(LocalStorageKeys.user_email);

    device_UUID = await get_unique_device_id();
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
}
