import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_client/pages/2.create_an_account/face_scan_page.dart';
import 'package:flutter_client/pages/2.create_an_account/profile_edit_page.dart';
import 'package:flutter_client/pages/5.free_map/free_map_page.dart';
import 'package:flutter_client/pages/5.free_map/place_search_page.dart';
import 'package:flutter_client/pages/6.chat/add_or_edit_contact_page.dart';
import 'package:flutter_client/pages/6.chat/chat_page.dart';
import 'package:flutter_client/pages/6.chat/contacts_page.dart';
import 'package:flutter_client/pages/7.me/me_page.dart';
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
      initialRoute: RoutesMap.contacts_page,
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
            name: RoutesMap.face_scan_page, page: () => const FaceScanPage()),
        GetPage(name: RoutesMap.my_tabs, page: () => const MyTabs()),
        GetPage(name: RoutesMap.room_list, page: () => const RoomListPage()),
        GetPage(
            name: RoutesMap.single_room_page,
            page: () => const SingleVoiceRoom()),
        GetPage(name: RoutesMap.free_map_page, page: () => const FreeMapPage()),
        GetPage(
            name: RoutesMap.place_search_list_page,
            page: () => const PlaceSearchPage()),
        GetPage(
            name: RoutesMap.add_or_edit_contact_page,
            page: () => const AddOrEditContactPage()),
        GetPage(
            name: RoutesMap.contacts_page, page: () => const ContactsPage()),
        GetPage(name: RoutesMap.chat_page, page: () => const ChatPage()),
        GetPage(name: RoutesMap.me_page, page: () => const MePage()),
      ],
    ));
  }();
}
