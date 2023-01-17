import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/config.dart';
import '../../store/controllers.dart';
import '../../common_user_interface/my_single_child_scroll_view.dart';

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
      bool valid = await grpc_JWT_controller.check_if_current_JWT_is_valid();
      if (valid) {
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
            Get.offNamed(RoutesMap.register);
            return;
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
