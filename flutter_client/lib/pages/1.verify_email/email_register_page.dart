import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/loading.dart';
import 'package:flutter_client/common_user_interface/my_single_child_scroll_view.dart';
import 'package:flutter_client/tools/internet_tools.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/tools/utils/utils.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter_client/store/controllers.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({Key? key}) : super(key: key);

  @override
  _EmailRegisterPageState createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  final form_key = GlobalKey<FormState>();
  final email_inputbox_controller = TextEditingController();

  bool email_is_valid = false;

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
      'Enter your email #',
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
                key: const Key("email_input"),
                onChanged: (value) {
                  form_key.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    email_is_valid = false;
                  } else {
                    if (email_validator(value)) {
                      email_is_valid = true;
                    } else {
                      email_is_valid = false;
                    }
                  }
                  return null;
                },
                controller: email_inputbox_controller,
                autocorrect: false,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.sw), //0.145.sw
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'By entering your email, you\'re agreeing to our\nTerms or Services and Privacy Policy.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Our Privacy Policy is simple: \nwe store your data and use it pravitely, and you are able to download it to your local.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RoundButton(
          color: Style.AccentBlue,
          minimumWidth: 230,
          disabledColor: Style.AccentBlue.withOpacity(0.3),
          // onPressed: onSignUpButtonClick,
          onPressed: () async {
            if (!email_is_valid) {
              Fluttertoast.showToast(
                  msg: "Please enter a valid email!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 16.0);
            } else {
              if (await has_internet() == false) {
                return;
              }

              String the_email_address = email_inputbox_controller.text.trim();

              loading_start();
              var response = await auth_grpc_controller.ask_for_registering(
                  email: the_email_address);
              loading_end();

              if (response.error == null && response.error.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Something went wrong!" + "\n\n" + response.error,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0);
              } else {
                variable_controller.registerResponse = response;

                variable_controller.save_user_email(the_email_address);
                Get.offNamed(RoutesMap.register_confirming);
                return;
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
