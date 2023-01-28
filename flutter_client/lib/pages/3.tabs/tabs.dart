import 'package:flutter/material.dart';
import 'package:flutter_client/pages/4.party/room_list.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  int current_tab_index = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: tab_widget_list[current_tab_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_tab_index,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 25,
        items: tab_list,
        onTap: (value) {
          setState(() {
            current_tab_index = value;
          });
        },
      ),
    );
  }
}
