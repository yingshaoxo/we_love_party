import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/chat_with_friends_service.pb.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/controllers.dart';
import '../../store/config.dart';
import '../../tools/color_tools.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tools/utils/style.dart';
import 'add_or_edit_contact_page.dart';
import 'one_to_one_chat_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final Color the_background = "rgba(255, 255, 255, 1.0)".color;

  List<Friend> friend_list = [];

  bool initialization_is_done = false;

  Future<bool> update_the_contact_list() async {
    GetFriendListResponse response =
        await chat_with_friends_grpc_controller.get_contact_list(
            GetFriendListRequest(yourEmail: variable_controller.user_email));

    if (response.error != null && response.error.isNotEmpty) {
      await show_error(msg: response.error);
      return false;
    } else {
      friend_list = response.friendList;
      setState(() {});
      return true;
    }
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

      var success = await update_the_contact_list();
      if (success == false) {
        return;
      }

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    Widget the_body = Container(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
      color: the_background,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(Icons.file_download),
                onTap: () async {
                  // Get.toNamed(RoutesMap.face_scan_page);
                },
              ),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () async {},
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () async {
                      Get.toNamed(RoutesMap.add_or_edit_contact_page,
                          arguments: AddOrEditContactPage_Arguments(
                              operation_type:
                                  AddOrEditContactPage_Operation_Types.add,
                              a_friend: null));
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
              child: Container(
            child: Center(
                child: friend_list.isEmpty
                    ? Text(
                        "No contacts in here yet\n\nTry to add someone from parties")
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.3))),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            height: 40,
                            thickness: 0.4,
                            color: Colors.grey,
                          ),
                          itemCount: friend_list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ContactCard(
                              friend: friend_list[index],
                              update_the_contact_list: update_the_contact_list,
                            );
                          },
                        ),
                      )),
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: null,
      body: initialization_is_done == false
          ? Container()
          : Container(
              color: the_background,
              child: Center(
                child: the_body,
              ),
            ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final Friend friend;
  final Future<bool> Function() update_the_contact_list;

  const ContactCard(
      {Key? key, required this.friend, required this.update_the_contact_list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // go to chat
        Get.toNamed(RoutesMap.one_to_one_chat_page,
            arguments: OneToOneChatPage_Arguments(a_friend: friend));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      friend.nickname,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "(${friend.name})",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  friend.email,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Row(
              children: [
                RoundButton(
                    color: Style.Blue,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onPressed: () async {
                      var response = await chat_with_friends_grpc_controller
                          .delete_a_contact(DeleteFriendRequest(
                              friendEmail: friend.email,
                              yourEmail: variable_controller.user_email));
                      if (response.error != null && response.error.isNotEmpty) {
                        await show_error(msg: response.error);
                        return;
                      }
                      await show_message(
                          msg: "Delete '${friend.email}' Successfully");

                      var success = await update_the_contact_list();
                      if (success == false) {
                        return;
                      }
                    },
                    child: Text("Delete")),
                SizedBox(
                  width: 4,
                ),
                RoundButton(
                    color: Style.Blue,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    onPressed: () async {
                      Get.toNamed(RoutesMap.add_or_edit_contact_page,
                          arguments: AddOrEditContactPage_Arguments(
                              operation_type:
                                  AddOrEditContactPage_Operation_Types.update,
                              a_friend: friend));
                    },
                    child: Text("Edit")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
