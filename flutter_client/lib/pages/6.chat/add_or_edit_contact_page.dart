import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import '../../generated_grpc/chat_with_friends_service.pb.dart';
import '../../tools/color_tools.dart';
import '../../tools/string_tools.dart';

enum AddOrEditContactPage_Operation_Types { add, update }

class AddOrEditContactPage_Arguments {
  AddOrEditContactPage_Operation_Types operation_type =
      AddOrEditContactPage_Operation_Types.add;
  Friend? a_friend;

  AddOrEditContactPage_Arguments(
      {required this.operation_type, required this.a_friend});
}

class AddOrEditContactPage extends StatefulWidget {
  const AddOrEditContactPage({Key? key}) : super(key: key);

  @override
  _AddOrEditContactPageState createState() => _AddOrEditContactPageState();
}

class _AddOrEditContactPageState extends State<AddOrEditContactPage> {
  final _email_input_box_controller = TextEditingController();
  final _email_input_box_key = GlobalKey<FormState>();
  bool email_is_valid = false;

  final _nickname_input_box_controller = TextEditingController();
  final _nickname_input_box_key = GlobalKey<FormState>();
  bool nickname_is_valid = false;

  Friend a_friend = Friend();

  bool initialization_is_done = false;

  AddOrEditContactPage_Arguments addOrEditContactPage_Arguments = Get.arguments;

  @override
  void initState() {
    super.initState();

    () async {
      if (variable_controller.user_email == null) {
        await show_exit_confirm_pop_window(
            msg:
                "I think we got some problems here, you might want to clear the data of this app and try it again.\nIf it doesn't work, I suggest you contact the author: yingshaoxo@gmail.com");
      }

      if (addOrEditContactPage_Arguments.operation_type ==
          AddOrEditContactPage_Operation_Types.update) {
        if (addOrEditContactPage_Arguments.a_friend != null) {
          a_friend = addOrEditContactPage_Arguments.a_friend!;
          _email_input_box_controller.text = a_friend.email;
          _nickname_input_box_controller.text = a_friend.nickname;
        }
      }

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  Widget build_form() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            textAlign: TextAlign.left,
            onChanged: (value) {
              _email_input_box_key.currentState?.validate();
            },
            validator: (value) {
              if (value != null) {
                value = value.trim();
              }

              if (value == null || value.isEmpty) {
                email_is_valid = false;
                return 'Please enter some text';
              } else {
                if (validate_email(value)) {
                  email_is_valid = true;
                } else {
                  email_is_valid = false;
                  if (value.length > 3) {
                    return "Invalid email";
                  } else {
                    return "Please input chars >= 3";
                  }
                }
              }
              return null;
            },
            controller: _email_input_box_controller,
            autocorrect: true,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              border: OutlineInputBorder(),
              // focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none,
              // errorBorder: InputBorder.none,
              // disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textAlign: TextAlign.left,
            onChanged: (value) {
              _nickname_input_box_key.currentState?.validate();
            },
            validator: (value) {
              if (value != null) {
                value = value.trim();
              }

              if (value == null || value.isEmpty) {
                nickname_is_valid = false;
                return 'Please enter some text';
              } else {
                nickname_is_valid = true;
                return null;
              }
            },
            controller: _nickname_input_box_controller,
            autocorrect: false,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Nickname',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
              border: OutlineInputBorder(),
              // focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none,
              // errorBorder: InputBorder.none,
              // disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Got blocked:"),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.blue;
                      }),
                      value: a_friend.gotBlocked,
                      onChanged: (bool? value) {
                        if (value == null) {
                          return;
                        }
                        a_friend.gotBlocked = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Super like:"),
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        return Colors.blue;
                      }),
                      value: a_friend.superLike,
                      onChanged: (bool? value) {
                        if (value == null) {
                          return;
                        }
                        a_friend.superLike = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: initialization_is_done == false
          ? Container()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: "rgba(255, 255, 255, 1.0)".color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.arrow_back),
                        onTap: () async {
                          Get.back();
                        },
                      ),
                      Row(
                        children: [
                          // SizedBox(
                          //   width: 15,
                          // ),
                          GestureDetector(
                            child: Icon(Icons.save),
                            onTap: () async {
                              String email = _email_input_box_controller.text;
                              String nickname =
                                  _nickname_input_box_controller.text;

                              if (email.isNotEmpty && nickname.isNotEmpty) {
                                if (validate_email(email)) {
                                  a_friend.email = email;
                                  a_friend.nickname = nickname;
                                  var response =
                                      await chat_with_friends_grpc_controller
                                          .add_or_update_a_contact(
                                              AddOrUpdateFriendRequest(
                                                  yourEmail: variable_controller
                                                      .user_email,
                                                  friend: a_friend));
                                  if (response.error != null &&
                                      response.error.isNotEmpty) {
                                    await show_error(
                                        msg:
                                            "An error happend: ${response.error}");
                                    return;
                                  } else {
                                    await show_message(
                                        msg: "Saving successfully.");
                                    Get.back();
                                    return;
                                  }
                                }
                              }

                              await show_message(
                                  msg:
                                      "An error happend.\nPlease check your input.");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Expanded(child: build_form()),
                ],
              ),
            ),
    );
  }
}
