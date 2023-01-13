import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading_start() async {
  EasyLoading.show(status: "working on...", dismissOnTap: false);
}

Future<void> loading_end() async {
  EasyLoading.dismiss();
}
