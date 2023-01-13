import 'package:flutter/material.dart';
import 'package:flutter_client/pages/welcome/profile_edit_page.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:flutter_client/pages/room/room_list.dart';
import 'package:flutter_client/pages/room/single_voice_room.dart';
import 'package:flutter_client/pages/welcome/email_page.dart';
import 'package:flutter_client/pages/welcome/verify_page.dart';
import 'package:flutter_client/pages/welcome/welcome_page.dart';
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
      initialRoute: RoutesMap.welcome,
      getPages: [
        GetPage(name: RoutesMap.welcome, page: () => const WelcomePage()),
        GetPage(name: RoutesMap.register, page: () => const EmailPage()),
        GetPage(
            name: RoutesMap.registerVerifying, page: () => const VerifyPage()),
        GetPage(
            name: RoutesMap.profile_edit_page,
            page: () => const ProfileEditPage()),
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
