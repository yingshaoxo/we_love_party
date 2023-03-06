import 'package:flutter/material.dart';
import 'package:flutter_web_client/pages/test_page.dart';

import 'package:get/get.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'store/config.dart';
import 'store/controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp(MaterialApp(
  //   home: Scaffold(
  //     body: TestPage(),
  //   ),
  // ));

  () async {
    await variable_controller.initilize_function();

    // forbidden screen rotation
    // await SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(GetMaterialApp(
      builder: (context, child) {
        return EasyLoading.init()(context, child);
      },
      initialRoute: RoutesMap.test,
      getPages: [
        GetPage(name: RoutesMap.test, page: () => const TestPage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.greenAccent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.amberAccent),
          ),
        ),
      ),
    ));
  }();
}
