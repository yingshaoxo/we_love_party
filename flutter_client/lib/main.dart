import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_client/pages/2.create_an_account/face_scan_page.dart';
import 'package:flutter_client/pages/2.create_an_account/profile_edit_page.dart';
import 'package:flutter_client/pages/2.create_an_account/profile_view_page.dart';
import 'package:flutter_client/pages/4.party/room_list.dart';
import 'package:flutter_client/pages/3.tabs/tabs.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_client/pages/4.party/single_voice_room.dart';
import 'package:flutter_client/pages/1.verify_email/email_register_page.dart';
import 'package:flutter_client/pages/1.verify_email/register_confirm_page.dart';
import 'package:flutter_client/pages/1.verify_email/welcome_page.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  () async {
    await ScreenUtil.ensureScreenSize();
    await variable_controller.initilize_function();

    // forbidden screen rotation
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(GetMaterialApp(
      builder: (context, child) {
        ScreenUtil.init(context);
        return EasyLoading.init()(context, child);
      },
      initialRoute: RoutesMap.welcome,
      getPages: [
        GetPage(name: RoutesMap.welcome, page: () => const WelcomePage()),
        GetPage(
            name: RoutesMap.register, page: () => const EmailRegisterPage()),
        GetPage(
            name: RoutesMap.register_confirming,
            page: () => const RegisterConfirmPage()),
        GetPage(
            name: RoutesMap.profile_edit_page,
            page: () => const ProfileEditPage()),
        GetPage(
            name: RoutesMap.profile_view_page,
            page: () => const ProfileViewPage()),
        GetPage(
            name: RoutesMap.face_scan_page, page: () => const FaceScanPage()),
        GetPage(name: RoutesMap.my_tabs, page: () => const MyTabs()),
        GetPage(name: RoutesMap.room_list, page: () => const RoomListPage()),
        GetPage(
            name: RoutesMap.single_room_page,
            page: () => const SingleVoiceRoom()),
      ],
    ));
  }();
}
