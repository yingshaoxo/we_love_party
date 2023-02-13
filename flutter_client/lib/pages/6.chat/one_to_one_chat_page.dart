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
            padding: EdgeInsets.symmetric(horizontal: 25),
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
  TextEditingController message_input_controller = TextEditingController();

  OneToOneChatPage_Arguments oneToOneChatPage_Arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ChatMessageList()),
        Container(
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
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
                    await show_message(msg: "Message sent successfully");
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

class ChatMessageList extends StatefulWidget {
  const ChatMessageList({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  OneToOneChatPage_Arguments oneToOneChatPage_Arguments = Get.arguments;
  List<ChatMessage> chat_message_list = [];

  bool initialization_is_done = false;

  @override
  void initState() {
    super.initState();

    () async {
      if (oneToOneChatPage_Arguments.a_friend?.email == null) {
        return;
      }

      var response = await chat_with_friends_grpc_controller
          .get_chat_message_list(GetChatMessageListRequest(
              yourEmail: variable_controller.user_email,
              targetEmail: oneToOneChatPage_Arguments.a_friend?.email));

      if (response.error != null && response.error.isNotEmpty) {
        await show_error(msg: response.error);
      } else {
        chat_message_list = response.chatMessageList;
      }

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

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
              child: Center(
                child: Container(
                  child: ListView(
                      children: chat_message_list
                          .map((e) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: message_was_sent_from_me(
                                          from_email: e.fromEmail)
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          message_was_sent_from_me(
                                                  from_email: e.fromEmail)
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.black12,
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
                                                oneToOneChatPage_Arguments
                                                        .a_friend?.nickname ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
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
              ),
            ),
    );
  }
}
