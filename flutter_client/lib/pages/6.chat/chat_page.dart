import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/generated_grpc/chat_with_friends_service.pb.dart';
import 'package:flutter_client/store/config.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/controllers.dart';
import '../../common_user_interface/pop_up_window.dart';
import '../../tools/color_tools.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pb.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'one_to_one_chat_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Color the_background = "rgba(255, 255, 255, 1.0)".color;

  bool initialization_is_done = false;

  @override
  void initState() {
    super.initState();

    () async {
      if (variable_controller.user_email == null) {
        await show_exit_confirm_pop_window(
            msg:
                "I think we got some problems here, you might want to clear the data of this app and try it again.\nIf it doesn't work, I suggest you contact the author: yingshaoxo@gmail.com");
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
                child: Icon(Icons.contacts),
                onTap: () {
                  Get.toNamed(RoutesMap.contacts_page);
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
                      // add people from qr code
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(child: TheConversationList())
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

class TheConversationList extends StatefulWidget {
  const TheConversationList({
    Key? key,
  }) : super(key: key);

  @override
  State<TheConversationList> createState() => _TheConversationListState();
}

class _TheConversationListState extends State<TheConversationList> {
  final crontab = Cron();

  List<Conversation> conversation_list = [];

  bool initialization_is_done = false;

  Future<void> update_conversation_list({required bool display_error}) async {
    var response = await chat_with_friends_grpc_controller
        .get_converstation_list(GetConversationListRequest(
            yourEmail: variable_controller.user_email,
            pageNumber: 0,
            pageSize: 100));

    if (response.error != null && response.error.isNotEmpty) {
      if (display_error) {
        await show_error(msg: response.error);
      }
    } else {
      conversation_list = response.conversationList;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    () async {
      await update_conversation_list(display_error: true);

      crontab.schedule(Schedule.parse('*/15 * * * * *'), () async {
        if (variable_controller.user_email == null) {
          return false;
        }

        await update_conversation_list(display_error: false);

        return true;
      });

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  void dispose() {
    crontab.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: initialization_is_done == false || conversation_list.isEmpty
          ? Center(
              child: Text("No conversations in here yet"),
            )
          : Container(
              child: ListView(
                  children: conversation_list
                      .map((e) => Container(
                            child: InkWell(
                              onTap: () async {
                                Get.toNamed(RoutesMap.one_to_one_chat_page,
                                    arguments: OneToOneChatPage_Arguments(
                                        a_friend: e.friend));
                              },
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              e.friend.nickname,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("(${e.friend.email})"),
                                          ],
                                        ),
                                        e.gotNewMessage
                                            ? Text(
                                                "•",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )
                                            : Container()
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text(e.lastSaying),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey.shade200,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ]),
                            ),
                          ))
                      .toList()),
            ),
    );
  }
}
