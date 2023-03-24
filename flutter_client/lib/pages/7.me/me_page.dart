import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/generated_grpc/account_storage_service.pb.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_client/store/controllers.dart';

import '../../tools/color_tools.dart';
import '../../tools/disk_tools.dart';
import '../../common_user_interface/full_screen_image.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final Color the_background = "rgba(255, 255, 255, 1.0)".color;

  bool initialization_is_done = false;

  bool show_simple_page = true;

  void my_onVerticalDragEnd(DragEndDetails details) {
    double fake_dy = details.velocity.clampMagnitude(0, 1).pixelsPerSecond.dy;
    if (fake_dy != 0) {
      // scrolled
      // if (fake_dy > 0) {
      //   // down
      //   show_second_page = false;
      // } else {
      //   //up
      //   show_second_page = true;
      // }
      show_simple_page = !show_simple_page;
      setState(() {});
      //print(fake_dy);
    }
  }

  Widget build_body() {
    return Container(
      child: Column(children: [
        Container(
          width: 0.7.sw,
          // width: 200,
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 1.0.sw,
                height: 1.2.sw,
                child: FittedBox(
                  child: variable_controller.head_image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            onTap: () {
              Get.to(
                  FullScreenImagePage(image: variable_controller.head_image));
            },
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 100,
          child: Column(
            children: [
              Text(
                variable_controller.userModel.username,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Spacer(),
              Text(
                variable_controller.userModel.sex == 1 ? 'male' : 'female',
              ),
              Spacer(),
              Text(
                variable_controller.userModel.age.toString(),
              ),
              Spacer(),
              Text(
                variable_controller.userModel.email,
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      ]),
    );
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

      variable_controller.head_image = Image.memory(
        get_Uint8List_from_base64_string(
            variable_controller.userModel.headImage),
      );

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    Widget simple_info_page = Column(
      children: [
        SizedBox(
          height: 50,
        ),
        build_body(),
      ],
    );

    double function_box_height = 110;
    double head_picture_side_length = 0.25.sw;
    Color function_box_background_color = Color.fromARGB(255, 245, 241, 250);
    Widget complex_info_page = Container(
      width: 0.9.sw,
      color: the_background,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.qr_code),
              GestureDetector(
                child: Icon(Icons.settings),
                onTap: () async {
                  Get.toNamed(RoutesMap.face_scan_page);
                },
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: head_picture_side_length * 1.5,
                  width: head_picture_side_length,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FittedBox(
                      child: variable_controller.head_image,
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    variable_controller.userModel.username,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        variable_controller.userModel.sex == 1
                            ? 'male'
                            : 'female',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        variable_controller.userModel.age.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    variable_controller.userModel.email,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: function_box_height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: function_box_background_color,
                  ),
                  child: Center(
                    child: Text(
                      'Long Term Benefits\n\nFriends Finder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          // color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  height: function_box_height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: function_box_background_color,
                  ),
                  child: Center(
                    child: Text(
                      'Friends Saying',
                      style: TextStyle(
                          fontSize: 14,
                          // color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () async {
                    Get.toNamed(RoutesMap.random_life_page);
                  },
                  child: Container(
                    height: function_box_height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: function_box_background_color,
                    ),
                    child: Center(
                      child: Text(
                        'Random Life',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            // color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              // Flexible(
              //   child: Container(
              //     height: function_box_height,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(5)),
              //       color: function_box_background_color,
              //     ),
              //     child: Center(
              //       child: Text(
              //         'Friends Saying',
              //         style: TextStyle(
              //             fontSize: 14,
              //             // color: Colors.pink,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: null,
      body: initialization_is_done == false
          ? Container()
          : Container(
              color: the_background,
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  my_onVerticalDragEnd(details);
                },
                child: Center(
                  child: show_simple_page == true
                      ? simple_info_page
                      : complex_info_page,
                ),
              ),
            ),
    );
  }
}
