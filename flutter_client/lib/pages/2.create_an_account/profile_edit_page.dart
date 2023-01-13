import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/loading.dart';
import 'package:flutter_client/tools/string_tools.dart';
import 'package:flutter_client/widgets/my_single_child_scroll_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/utils/utils.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/utils/style.dart';
import 'package:flutter_client/store/controllers.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final form_key = GlobalKey<FormState>();
  final username_inputbox_controller = TextEditingController();

  bool username_is_valid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: MySingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 180,
            bottom: 60,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTitle(),
              const SizedBox(
                height: 50,
              ),
              buildForm(),
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
                  if (value == null || value.isEmpty) {
                    username_is_valid = false;
                    return 'Please enter some text';
                  } else {
                    if (validate_username(value)) {
                      username_is_valid = true;
                    } else {
                      username_is_valid = false;
                      if (value.length > 3) {
                        return "Invalid username";
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
          color: Style.AccentBlue,
          minimumWidth: 230,
          disabledColor: Style.AccentBlue.withOpacity(0.3),
          // onPressed: onSignUpButtonClick,
          onPressed: () async {
            if (!username_is_valid) {
              Fluttertoast.showToast(
                  msg: "Please enter a valid username!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            } else {
              String username = username_inputbox_controller.text.trim();

              // loading_start();
              // bool result = await jwtGrpcController.ask_for_registering(
              //     email: username);
              // loading_end();

              // if (result) {
              //   variableController.save_user_email(username);
              //   Get.offNamed(RoutesMap.registerVerifying);
              // } else {
              //   Fluttertoast.showToast(
              //       msg: "Something went wrong!",
              //       toastLength: Toast.LENGTH_SHORT,
              //       gravity: ToastGravity.CENTER,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: Colors.white,
              //       textColor: Colors.black,
              //       fontSize: 16.0);
              // }
            }
          },
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
        ),
      ],
    );
  }
}
