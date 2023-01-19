import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/common_user_interface/loading.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pb.dart';
import 'package:flutter_client/store/variables.dart';
import 'package:flutter_client/tools/image_tools.dart';
import 'package:flutter_client/tools/string_tools.dart';
import 'package:flutter_client/common_user_interface/my_single_child_scroll_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/tools/utils/utils.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter_client/store/controllers.dart';

import '../../tools/disk_tools.dart';

class ProfileViewPage extends StatefulWidget {
  const ProfileViewPage({Key? key}) : super(key: key);

  @override
  _ProfileViewPageState createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  bool initialization_is_done = false;
  Image? head_image;

  Widget build_title() {
    return const Text(
      'Your Info',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget build_body() {
    return Container(
      child: Column(children: [
        Container(
          width: 0.7.sw,
          // width: 200,
          child: head_image ?? Container(),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 100,
          child: Column(
            children: [
              Text(
                variable_controller.userModel.username,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Spacer(),
              Text(
                variable_controller.userModel.sex == 1 ? 'male' : 'female',
              ),
              Spacer(),
              Text(
                variable_controller.userModel.age.toString(),
              ),
              Spacer(),
              Text(
                variable_controller.userModel.email,
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget build_bottom() {
    return Column(
      children: [
        RoundButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              // Icon(
              //   Icons.arrow_right_alt,
              //   color: Colors.white,
              // ),
            ],
          ),
          color: Style.AccentBlue,
          disabledColor: Style.AccentBlue.withOpacity(0.3),
          // onPressed: onSignUpButtonClick,
          onPressed: () async {
            Get.back();
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    () async {
      if (variable_controller.user_email == null) {
        await show_exit_confirm_pop_window(
            msg:
                "I think we got some problems here, you might want to clear the data of this app and try it again.\nIf it doesn't work, I suggest you contact the author: yingshaoxo@gmail.com");
      }
      GetUserResponse getUserResponse = await grpc_account_storage_controllr
          .get_a_user(variable_controller.user_email);

      if (!getUserResponse.userExists) {
        await show_message(
            msg:
                "I think that we got some problems here, there might no Internet.\nAnd you may not exists.");
        Get.back();
      }

      variable_controller.userModel.email = getUserResponse.email;
      variable_controller.userModel.username = getUserResponse.username;
      variable_controller.userModel.sex = getUserResponse.sex;
      variable_controller.userModel.age = getUserResponse.age;
      variable_controller.userModel.headImage = getUserResponse.headImage;

      head_image = Image.memory(
        get_Uint8List_from_base64_string(
            variable_controller.userModel.headImage),
      );

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: initialization_is_done == false
          ? Container()
          : MySingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    build_title(),
                    Spacer(),
                    build_body(),
                    Spacer(),
                    build_bottom(),
                    Spacer(),
                  ],
                ),
              ),
            ),
    );
  }
}
