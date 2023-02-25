import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pb.dart';
import 'package:flutter_client/tools/string_tools.dart';
import 'package:flutter_client/common_user_interface/my_single_child_scroll_view.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter_client/store/controllers.dart';

import '../../tools/internet_tools.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool initialization_is_done = false;

  final form_key = GlobalKey<FormState>();
  final username_inputbox_controller = TextEditingController();

  bool username_is_valid = false;

  Widget build_take_picture_box() {
    double top_and_left_distance_between_background_and_icon = 18;
    double the_camera_icon_size = 74;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(RoutesMap.face_scan_page);
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      top: -top_and_left_distance_between_background_and_icon,
                      left: -top_and_left_distance_between_background_and_icon,
                      child: Container(
                        height: the_camera_icon_size,
                        width: the_camera_icon_size,
                        color: Colors.amber,
                      )),
                  Positioned(
                    top: top_and_left_distance_between_background_and_icon,
                    left: top_and_left_distance_between_background_and_icon,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: the_camera_icon_size,
                      ),
                      onPressed: (() {}),
                    ),
                  ),
                  Container(
                    height: the_camera_icon_size +
                        top_and_left_distance_between_background_and_icon,
                    width: the_camera_icon_size +
                        top_and_left_distance_between_background_and_icon,
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Please take a picture.",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      'Enter your username #',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Form(
              key: form_key,
              child: TextFormField(
                key: const Key("username_input"),
                onChanged: (value) {
                  form_key.currentState?.validate();
                },
                validator: (value) {
                  if (value != null) {
                    value = value.trim();
                  }

                  if (value == null || value.isEmpty) {
                    username_is_valid = false;
                    return 'Please enter some text';
                  } else {
                    if (validate_username(value)) {
                      username_is_valid = true;
                    } else {
                      username_is_valid = false;
                      if (value.length >= 3) {
                        return "Invalid username";
                      } else {
                        return "Please input chars >= 3";
                      }
                    }
                  }
                  return null;
                },
                controller: username_inputbox_controller,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom() {
    return Column(
      children: [
        RoundButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ],
          ),
          color: Style.AccentBlue,
          minimumWidth: 230,
          disabledColor: Style.AccentBlue.withOpacity(0.3),
          // onPressed: onSignUpButtonClick,
          onPressed: () async {
            if (await has_internet() == false) {
              return;
            }

            if (username_is_valid ||
                (variable_controller.username != null &&
                    variable_controller.username?.trim() != "")) {
              await variable_controller
                  .save_username(username_inputbox_controller.text.trim());
            } else {
              await show_error(msg: "Please give me a correct username");
              return;
            }

            if (variable_controller.user_email == null) {
              Get.offNamed(RoutesMap.register);
              return;
            }

            Get.offNamed(RoutesMap.face_scan_page);
            return;
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

      GetUserResponse getUserResponse = await account_storage_grpc_controllr
          .get_a_user(variable_controller.user_email);

      if (getUserResponse.userExists != null &&
          getUserResponse.userExists == true) {
        if (getUserResponse.userExists) {
          Get.offNamed(RoutesMap.my_tabs);
          return;
        }

        if (variable_controller.username != null) {
          username_inputbox_controller.text = variable_controller.username!;
        }
      }

      if (getUserResponse.error != null && getUserResponse.error.isNotEmpty) {
        await show_message(msg: getUserResponse.error);
        await show_exit_confirm_pop_window(
            msg: "I think we got some problem with the service. Bye.");
        return;
      }

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
              child: Padding(
              padding: const EdgeInsets.only(
                top: 180,
                bottom: 60,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildTitle(),
                    const SizedBox(
                      height: 50,
                    ),
                    buildForm(),
                    // Spacer(),
                    // build_take_picture_box(),
                    Spacer(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildBottom(),
                  ],
                ),
              ),
            )),
    );
  }
}
