import 'package:flutter/services.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/common_user_interface/loading.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../common_user_interface/my_single_child_scroll_view.dart';
import '../../tools/internet_tools.dart';
import '../../store/config.dart';

class RegisterConfirmPage extends StatefulWidget {
  const RegisterConfirmPage({Key? key}) : super(key: key);

  @override
  _RegisterConfirmPageState createState() => _RegisterConfirmPageState();
}

class _RegisterConfirmPageState extends State<RegisterConfirmPage> {
  final form_key = GlobalKey<FormState>();
  final code_inputbox_controller = TextEditingController();
  int error_counting = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: MySingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 180,
              left: 30,
              right: 30,
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
                Expanded(child: buildForm()),
                // const Spacer(),
                // Center(child: buildBottom()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please send an email from your account to',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            Clipboard.setData(ClipboardData(
                text:
                    'god@${variable_controller.registerResponse?.theEmailTheUserNeedToSendVerifyCodeTo ?? our_email}'));
            show_toast(message: "copied");
          },
          child: Text(
            'god@${variable_controller.registerResponse?.theEmailTheUserNeedToSendVerifyCodeTo ?? our_email}',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'with this code:',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () async {
            Clipboard.setData(ClipboardData(
                text:
                    'verify: ${variable_controller.registerResponse!.theVerifyCodeTheUserNeedToSendBack}'));
            show_toast(message: "copied");
          },
          child: Text(
              'verify: ${variable_controller.registerResponse!.theVerifyCodeTheUserNeedToSendBack}',
              style: TextStyle(fontSize: 15, color: Colors.black87)),
        ),
      ],
    );
  }

  Widget buildForm() {
    return Center(
      child: Container(
        width: 0.9.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 1.0.sw,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[300])),
                child: Text(
                  "Send Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () async {
                  final Email email = Email(
                    body: 'Hi, yingshaoxo.',
                    subject:
                        'verify: ${variable_controller.registerResponse?.theVerifyCodeTheUserNeedToSendBack}',
                    recipients: [
                      'god@${variable_controller.registerResponse?.theEmailTheUserNeedToSendVerifyCodeTo ?? our_email}'
                    ],
                    cc: [],
                    bcc: [],
                    attachmentPaths: null,
                    isHTML: false,
                  );

                  try {
                    await FlutterEmailSender.send(email);
                  } catch (e) {
                    await show_message(
                        msg:
                            "Sorry, you don't have an email client, \nI can't send it for you for now. \n\nPlease do it yourself.");
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 1.0.sw,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[100])),
                child: Text(
                  "Already Sent",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () async {
                  if (await has_internet() == false) {
                    return;
                  }

                  if (variable_controller.registerResponse == null) {
                    Fluttertoast.showToast(
                        msg: "Something is wrong, sorry",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0);
                    return;
                  }

                  String email_address = variable_controller.user_email ?? "";

                  loading_start();
                  var response = await auth_grpc_controller.registering_confirm(
                      email: email_address.trim(),
                      code: variable_controller.registerResponse!
                          .theVerifyCodeTheUserNeedToSendBack);
                  loading_end();

                  if (response.error != null && response.error.isNotEmpty) {
                    await show_error(
                        msg:
                            "Wrong! You should make sure you have properly send the email (and wait for few seconds)\n\n${response.error}");
                    error_counting += 1;
                    if (error_counting >= 2) {
                      Get.offNamed(RoutesMap.register);
                    }
                    return;
                  } else {
                    await variable_controller.save_jwt(response.jwt);
                    print("jwt: " + response.jwt);
                    Get.offNamed(RoutesMap.profile_edit_page);
                    return;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildBottom() {
  //   return Column(
  //     children: [
  //       RoundButton(
  //         color: Style.AccentBlue,
  //         minimumWidth: 230,
  //         disabledColor: Style.AccentBlue.withOpacity(0.3),
  //         // onPressed: onSignUpButtonClick,
  //         onPressed: () async {
  //           // if (code_inputbox_controller.text.trim().isEmpty) {
  //           //   Fluttertoast.showToast(
  //           //       msg: "Please enter a valid code!",
  //           //       toastLength: Toast.LENGTH_SHORT,
  //           //       gravity: ToastGravity.CENTER,
  //           //       timeInSecForIosWeb: 1,
  //           //       backgroundColor: Colors.white,
  //           //       textColor: Colors.black,
  //           //       fontSize: 16.0);
  //           //     return;
  //           // }
  //           if (await has_internet() == false) {
  //             return;
  //           }

  //           if (variable_controller.registerResponse == null) {
  //             return;
  //           }

  //           try {
  //             String email_address = variable_controller.user_email ?? "";

  //             loading_start();
  //             String? jwt = await auth_grpc_controller.registering_confirm(
  //                 email: email_address.trim(),
  //                 code: variable_controller
  //                     .registerResponse!.theVerifyCodeTheUserNeedToSendBack);
  //             loading_end();

  //             if (jwt != null) {
  //               await variable_controller.save_jwt(jwt);
  //               print("jwt: " + jwt);
  //               Get.offNamed(RoutesMap.profile_edit_page);
  //               return;
  //             } else {
  //               Fluttertoast.showToast(
  //                   msg: "Invalid code!",
  //                   toastLength: Toast.LENGTH_SHORT,
  //                   gravity: ToastGravity.CENTER,
  //                   timeInSecForIosWeb: 1,
  //                   backgroundColor: Colors.white,
  //                   textColor: Colors.black,
  //                   fontSize: 16.0);
  //               Get.offNamed(RoutesMap.register);
  //               return;
  //             }
  //           } catch (e) {
  //             print("error: " + e.toString());
  //             Fluttertoast.showToast(
  //                 msg: e.toString(),
  //                 toastLength: Toast.LENGTH_LONG,
  //                 gravity: ToastGravity.CENTER,
  //                 timeInSecForIosWeb: 1,
  //                 backgroundColor: Colors.white,
  //                 textColor: Colors.black,
  //                 fontSize: 16.0);
  //           }
  //         },
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: const [
  //             Text(
  //               'Next',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //             ),
  //             Icon(
  //               Icons.arrow_right_alt,
  //               color: Colors.white,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
