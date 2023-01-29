import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client/pages/4.party/room_list.dart';
import 'package:flutter_client/pages/network_error_page.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/tools/internet_tools.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../generated_grpc/account_auth_service.pb.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  List<Widget> tab_widget_list = [
    RoomListPage(),
    Container(
      child: Center(child: Text("Free Map")),
    ),
    Container(
      child: Center(child: Text("Friends")),
    ),
    Container(
      child: Center(child: Text("Me")),
    ),
  ];
  List<BottomNavigationBarItem> tab_list = const [
    BottomNavigationBarItem(
      label: 'Party',
      icon: Icon(
        Icons.voice_chat,
        size: 29,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Free Map',
      icon: Icon(
        Icons.map,
        size: 29,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Friends',
      icon: Icon(
        Icons.three_p,
        //Icons.diversity_1,
        size: 29,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Me',
      icon: Icon(
        Icons.person,
        size: 29,
      ),
    ),
  ];

  final crontab = Cron();

  @override
  void initState() {
    super.initState();

    () async {
      crontab.schedule(Schedule.parse('*/10 * * * * *'), () async {
        if (variable_controller.user_email == null) {
          return false;
        }

        await has_internet_check_in_the_background();

        return true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: null,
          body: tab_widget_list[variable_controller.current_tab_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: variable_controller.current_tab_index,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black45,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            iconSize: 25,
            items: tab_list,
            onTap: (value) {
              setState(() {
                variable_controller.current_tab_index = value;
              });
            },
          ),
        ),
        Obx(() {
          return Offstage(
            offstage:
                variable_controller.online.value, //variable_controller.online,
            child: NetworkErrorPage(),
          );
        })
      ],
    );
  }
}
