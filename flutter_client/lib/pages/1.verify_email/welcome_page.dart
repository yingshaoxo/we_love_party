import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated_grpc/account_auth_service.pb.dart';
import '../../store/config.dart';
import '../../store/controllers.dart';
import '../../common_user_interface/my_single_child_scroll_view.dart';
import '../../tools/internet_tools.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool initialization_is_done = false;

  @override
  void initState() {
    super.initState();

    () async {
      try {
        await auth_grpc_controller
            .get_account_authentication_service_client()
            .isOnline(IsOnlineRequest());
      } catch (e) {
        await show_message(msg: e.toString());
        await show_exit_confirm_pop_window(
          msg:
              "I think something is wrong with the connection.\n\nMight because of the Internet Error.\n\nI'll exit for now.\n\nYou can open me later.",
        );
      }

      IsJwtOkReply isJwtOkReply = await auth_grpc_controller.check_if_jwt_is_ok(
          jwt: variable_controller.jwt);

      if (isJwtOkReply.email != null && isJwtOkReply.email.isNotEmpty) {
        Get.offNamed(RoutesMap.profile_edit_page);
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
                padding: EdgeInsets.only(
                  top: 120,
                  left: 50,
                  right: 50,
                  bottom: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTitle(),
                    SizedBox(
                      height: 80, //0.12.sh,
                    ),
                    buildContents(),
                    // SizedBox(
                    //   height: 0.17.sh,
                    // ),
                    Spacer(),
                    Center(child: buildBottom(context)),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildTitle() {
    return const Text(
      '🎉 Welcome!',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to WeLoveParty!",
          style: TextStyle(
            height: 1.8,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "We love party is an international platform where people could enjoy the freedom of connection. ",
          style: TextStyle(
            height: 1.8,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "We are open to sex, if you have other thinking, please leave, thanks 🙏.",
          style: TextStyle(
            height: 1.8,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '--- yingshaoxo & the WeLoveParty team',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundButton(
          color: Style.AccentBlue,
          onPressed: () async {
            if (await has_internet() == false) {
              return;
            }

            Get.offNamed(RoutesMap.register);
          },
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Get in with email',
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
        ),
      ],
    );
  }
}
