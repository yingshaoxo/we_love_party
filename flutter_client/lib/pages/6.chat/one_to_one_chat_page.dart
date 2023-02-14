import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/controllers.dart';
import '../../generated_grpc/chat_with_friends_service.pb.dart';
import '../../tools/color_tools.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneToOneChatPage_Arguments {
  Friend? a_friend;

  OneToOneChatPage_Arguments({required this.a_friend});
}

class OneToOneChatPage extends StatefulWidget {
  const OneToOneChatPage({Key? key}) : super(key: key);

  @override
  _OneToOneChatPageState createState() => _OneToOneChatPageState();
}

class _OneToOneChatPageState extends State<OneToOneChatPage> {
  final Color the_background = "rgba(255, 255, 255, 1.0)".color;

  OneToOneChatPage_Arguments oneToOneChatPage_Arguments = Get.arguments;

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
      color: the_background,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      oneToOneChatPage_Arguments.a_friend?.nickname ??
                          "Beautiful",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "(${oneToOneChatPage_Arguments.a_friend?.email ?? ""})",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child: Text("..."),
                      onTap: () async {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(child: Container(child: ChatBox()))
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

class ChatBox extends StatefulWidget {
  const ChatBox({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final crontab = Cron();

  TextEditingController message_input_controller = TextEditingController();

  OneToOneChatPage_Arguments oneToOneChatPage_Arguments = Get.arguments;

  List<ChatMessage> chat_message_list = [];

  ScrollController message_list_controller = ScrollController();

  bool initialization_is_done = false;

  Future<void> update_message_list(
      {required bool display_error, required bool set_state}) async {
    var response = await chat_with_friends_grpc_controller
        .get_chat_message_list(GetChatMessageListRequest(
            yourEmail: variable_controller.user_email,
            targetEmail: oneToOneChatPage_Arguments.a_friend?.email));

    if (response.error != null && response.error.isNotEmpty) {
      if (display_error) {
        await show_error(msg: response.error);
      }
    } else {
      chat_message_list = response.chatMessageList;

      if (set_state) {
        setState(() {});
        await list_view_scoll_to_bottom(first_time: false);
      }
    }
  }

  Future<void> list_view_scoll_to_bottom({required bool first_time}) async {
    if (first_time) {
      if (!message_list_controller.hasClients) {
        while (!message_list_controller.hasClients) {
          await Future.delayed(Duration(milliseconds: 100));
        }
      }
    }

    if (message_list_controller.hasClients) {
      message_list_controller
          .jumpTo(message_list_controller.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    super.initState();

    () async {
      if (oneToOneChatPage_Arguments.a_friend?.email == null) {
        return;
      }

      await update_message_list(display_error: true, set_state: false);

      crontab.schedule(Schedule.parse('*/10 * * * * *'), () async {
        if (variable_controller.user_email == null) {
          return false;
        }

        await update_message_list(display_error: false, set_state: true);
        await list_view_scoll_to_bottom(first_time: false);

        return true;
      });

      setState(() {
        initialization_is_done = true;
      });

      await list_view_scoll_to_bottom(first_time: true);
    }();
  }

  @override
  void dispose() {
    crontab.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: ChatMessageList(
          oneToOneChatPage_Arguments: oneToOneChatPage_Arguments,
          initialization_is_done: initialization_is_done,
          chat_message_list: chat_message_list,
          message_list_controller: message_list_controller,
        )),
        Container(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 0.85.sw,
                child: TextField(
                  controller: message_input_controller,
                  minLines: 1,
                  maxLines: 5,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    fillColor: '#FAFAFA'.color,
                    filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'Message',
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                child: Icon(Icons.send),
                onTap: () async {
                  String content = message_input_controller.text.trim();
                  if (content.isEmpty) {
                    return;
                  }

                  if (oneToOneChatPage_Arguments.a_friend?.email == null) {
                    return;
                  }

                  SendMessageToFriendResponse sendMessageToFriendResponse =
                      await chat_with_friends_grpc_controller
                          .send_message_to_friend(SendMessageToFriendRequest(
                              chatMessage: ChatMessage(
                                  fromEmail: variable_controller.user_email,
                                  toEmail: oneToOneChatPage_Arguments
                                      .a_friend?.email,
                                  messageType: ChatMessageType.text,
                                  content: content,
                                  dateInSecondsInUnixTimestamps: 0,
                                  peopleWhoSeen: [])));
                  if (sendMessageToFriendResponse.error != null &&
                      sendMessageToFriendResponse.error.isNotEmpty) {
                    await show_error(msg: sendMessageToFriendResponse.error);
                    return;
                  } else {
                    // await show_message(msg: "Message sent successfully");
                    FocusScope.of(context).unfocus();
                    message_input_controller.clear();
                    await update_message_list(
                        display_error: true, set_state: true);
                  }
                },
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessageList extends StatelessWidget {
  final OneToOneChatPage_Arguments oneToOneChatPage_Arguments;
  final bool initialization_is_done;
  final List<ChatMessage> chat_message_list;
  final ScrollController message_list_controller;

  const ChatMessageList({
    Key? key,
    required this.oneToOneChatPage_Arguments,
    required this.initialization_is_done,
    required this.chat_message_list,
    required this.message_list_controller,
  }) : super(key: key);

  bool message_was_sent_from_me({required String from_email}) {
    return from_email == variable_controller.user_email;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: initialization_is_done == false
          ? Container(
              child: Center(child: Text("No conversations in here yet")))
          : Container(
              color: Colors.white,
              child: ListView(
                  shrinkWrap: true,
                  controller: message_list_controller,
                  children: chat_message_list
                      .map((e) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              crossAxisAlignment: message_was_sent_from_me(
                                      from_email: e.fromEmail)
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: message_was_sent_from_me(
                                          from_email: e.fromEmail)
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: null,
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      padding: EdgeInsets.only(
                                          top: 15,
                                          bottom: 15,
                                          left: 20,
                                          right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            message_was_sent_from_me(
                                                    from_email: e.fromEmail)
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            message_was_sent_from_me(
                                                    from_email: e.fromEmail)
                                                ? variable_controller
                                                    .userModel.username
                                                : oneToOneChatPage_Arguments
                                                        .a_friend?.nickname ??
                                                    "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   e.fromEmail,
                                          //   style: TextStyle(
                                          //       fontSize: 10,
                                          //       color: Colors.grey),
                                          // ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            e.content,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            ),
                          ))
                      .toList()),
            ),
    );
  }
}
