import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/controllers.dart';
import '../../tools/color_tools.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pb.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Color the_background = "rgba(255, 255, 255, 1.0)".color;

  bool initialization_is_done = false;

  @override
  void initState() {
    super.initState();

    () async {
      if (variable_controller.user_email == null) {
        await show_exit_confirm_pop_window(
            msg:
                "I think we got some problems here, you might want to clear the data of this app and try it again.\nIf it doesn't work, I suggest you contact the author: yingshaoxo@gmail.com");
      }
      GetUserResponse getUserResponse = await account_storage_grpc_controllr
          .get_a_user(variable_controller.user_email);

      if (!getUserResponse.userExists) {
        await show_exit_confirm_pop_window(
            msg:
                "I think that we got some problems here.\n\nThere might have no Internet.");
      }

      variable_controller.userModel.email = getUserResponse.email;
      variable_controller.userModel.username = getUserResponse.username;
      variable_controller.userModel.sex = getUserResponse.sex;
      variable_controller.userModel.age = getUserResponse.age;
      variable_controller.userModel.headImage = getUserResponse.headImage;

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    Widget the_body = Container(
      width: 0.9.sw,
      color: the_background,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.contacts),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () async {},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () async {
                      // Get.toNamed(RoutesMap.face_scan_page);
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Text("No conversations in here yet"),
            ),
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: null,
      body: initialization_is_done == false
          ? Container()
          : Container(
              color: the_background,
              child: Center(
                child: the_body,
              ),
            ),
    );
  }
}
