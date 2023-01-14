import 'package:flutter/material.dart';
import 'package:flutter_client/pages/2.create_an_account/face_scan_page.dart';
import 'package:flutter_client/pages/2.create_an_account/profile_edit_page.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_client/pages/room/room_list.dart';
import 'package:flutter_client/pages/room/single_voice_room.dart';
import 'package:flutter_client/pages/1.verify_email/email_page.dart';
import 'package:flutter_client/pages/1.verify_email/verify_page.dart';
import 'package:flutter_client/pages/1.verify_email/welcome_page.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  () async {
    await ScreenUtil.ensureScreenSize();
    await variableController.initilize_function();

    runApp(GetMaterialApp(
      builder: (context, child) {
        ScreenUtil.init(context);
        return EasyLoading.init()(context, child);
      },
      initialRoute: RoutesMap.face_scan_page,
      getPages: [
        GetPage(name: RoutesMap.welcome, page: () => const WelcomePage()),
        GetPage(name: RoutesMap.register, page: () => const EmailPage()),
        GetPage(
            name: RoutesMap.registerVerifying, page: () => const VerifyPage()),
        GetPage(
            name: RoutesMap.profile_edit_page,
            page: () => const ProfileEditPage()),
        GetPage(
            name: RoutesMap.face_scan_page, page: () => const FaceScanPage()),
        GetPage(
            name: RoutesMap.roomList,
            page: () => Container(
                  child: Center(
                    child: Text(
                      "hi",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
        GetPage(
            name: RoutesMap.singleRoomPage,
            page: () => const SingleVoiceRoom()),
      ],
    ));
  }();
}
