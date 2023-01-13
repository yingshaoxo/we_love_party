import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/store/variables.dart';
import 'package:flutter_client/common_user_interface/loading.dart';
import 'package:flutter_client/utils/style.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../widgets/my_single_child_scroll_view.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final form_key = GlobalKey<FormState>();
  final code_inputbox_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: MySingleChildScrollView(
        child: Center(
          child: Container(
            width: 330,
            padding: const EdgeInsets.only(
              top: 180,
              bottom: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: buildTitle(),
                ),
                const SizedBox(
                  height: 60,
                ),
                buildForm(),
                const Spacer(),
                Center(child: buildBottom()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      'Please enter the code \nwe sent to you #',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
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
                key: const Key("verify_input"),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
                controller: code_inputbox_controller,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Code',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
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
            if (code_inputbox_controller.text.trim().isEmpty) {
              Fluttertoast.showToast(
                  msg: "Please enter a valid code!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            } else {
              try {
                String email_address = variableController.user_email ?? "";

                loading_start();
                String? jwt = await jwtGrpcController.registering_confirm(
                    email: email_address.trim(),
                    code: code_inputbox_controller.text.trim());
                loading_end();

                if (jwt != null) {
                  await variableController.save_jwt(jwt);
                  print("jwt: " + jwt);
                  Get.offNamed(RoutesMap.profile_edit_page);
                } else {
                  Fluttertoast.showToast(
                      msg: "Invalid code!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 16.0);
                  Get.offNamed(RoutesMap.register);
                }
              } catch (e) {
                print("error: " + e.toString());
                Fluttertoast.showToast(
                    msg: e.toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0);
              }
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