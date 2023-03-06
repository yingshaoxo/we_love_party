import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_client/generated_grpc/management_service.pbgrpc.dart';
import 'package:flutter_web_client/store/controllers.dart';
import 'package:get/get.dart';

import '../store/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController jwt_code_editing_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    () async {
      jwt_code_editing_controller.text = variable_controller.jwt ?? "";
    }();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
        width: 640,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("JWT Token: "),
                Expanded(
                    child: TextField(
                  controller: jwt_code_editing_controller,
                ))
              ],
            ),
            SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () async {
                var input_value = jwt_code_editing_controller.text;
                if (await variable_controller
                        .check_if_jwt_is_valid(input_value) ==
                    true) {
                  variable_controller.jwt = input_value;
                  await variable_controller.save_jwt(input_value);
                  await EasyLoading.showSuccess("Login Successfully!");
                  Get.offNamed(RoutesMap.location_management);
                } else {
                  await EasyLoading.showSuccess("Login Failed!");
                }
              },
              child: Text(
                "Login",
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber.shade100),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 25, vertical: 15))),
            )
          ],
        ),
      )),
    );
  }
}
