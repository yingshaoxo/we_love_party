import 'dart:io';

import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/room_control_service.pb.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../store/controllers.dart';
import '../../tools/utils/style.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<RoomInfo> rooms = [];

  Alert? the_alert;

  Future<void> updateRooms() async {
    rooms = (await room_control_grpc_controllr.getRoomList())
        .where((room) => room.hasRoomName())
        .toList();

    // Iterable<RoomInfo> temp_rooms =
    //     List<int>.generate(10, (i) => i + 1).map((e) => RoomInfo(
    //           roomName: "hello world: ${e}",
    //           numberOfParticipants: 1,
    //         ));
    // rooms.addAll(temp_rooms);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    () async {
      await updateRooms();

      // await show_message(
      //     msg:
      //         (await DeviceInfoPlugin().androidInfo).version.sdkInt.toString());

      Map<Permission, PermissionStatus> statuses = await [
        // Permission.camera,
        Permission.microphone,
        Permission.bluetooth,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ].request();
      // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (statuses.values
          .every((status) => status != PermissionStatus.granted)) {
        await Alert(
          context: context,
          title: 'Permission denied',
          desc: 'Please grant the required permissions to use this app.',
          buttons: [
            DialogButton(
              child: const Text('OK'),
              onPressed: () => exit(0),
            ),
          ],
        ).show();
      }
    }();
  }

  void _onRefresh() async {
    try {
      await updateRooms();
    } finally {
      _refreshController.refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.only(
          top: 120,
          left: 50,
          right: 50,
          bottom: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: buildContents(),
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  color: Style.AccentBlue,
                  onPressed: () async {
                    await showCreateRoomDialog(context: context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Create a room',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return InkWell(
      onTap: () async {
        await updateRooms();
      },
      child: const Text(
        '🎉 Rooms!',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }

  Widget buildContents() {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );

    var listView = ListView.separated(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: false,
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            rooms[index].roomName,
            style: const TextStyle(fontSize: 18),
          ),
          style: ListTileStyle.list,
          tileColor: const Color.fromARGB(80, 223, 230, 240),
          onTap: () async {
            AllowJoinResponse allowJoinResponse =
                await room_control_grpc_controllr.getAccessToARoom(
              roomName: rooms[index].roomName,
            );
            if (allowJoinResponse.error == null ||
                allowJoinResponse.error.isEmpty) {
              variable_controller.access_token = allowJoinResponse.accessToken;
              Get.toNamed(RoutesMap.single_room_page);
              return;
            } else {
              await show_message(msg: 'Failed to join room');
              await show_message(msg: allowJoinResponse.error);
              // Fluttertoast.showToast(
              //   msg: 'Failed to join room',
              //   toastLength: Toast.LENGTH_SHORT,
              //   gravity: ToastGravity.BOTTOM,
              //   timeInSecForIosWeb: 1,
              //   backgroundColor: Colors.red,
              //   textColor: Colors.white,
              //   fontSize: 16.0,
              // );
              return;
            }
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );

    var theme = Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color.fromARGB(
                255, 244, 237, 226), // but now it should be declared like this
          ),
        ),
        child: rooms.isEmpty
            ? const Center(
                child: Text(
                  'Hi, you are the last one here!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            : Card(
                color: const Color.fromARGB(255, 200, 214, 228),
                borderOnForeground: true,
                shape: border,
                child: Card(
                  // margin: EdgeInsets.zero,
                  borderOnForeground: true,
                  shape: border,
                  child: listView,
                ),
              ));

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      physics: const BouncingScrollPhysics(),
      header: const MaterialClassicHeader(
        height: 100,
        distance: 0,
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: theme,
    );
  }

  Future<void> showCreateRoomDialog({required BuildContext context}) async {
    TextEditingController roomNameInputController = TextEditingController();

    the_alert = Alert(
        context: context,
        title: "Create a room",
        style: AlertStyle(
            isOverlayTapDismiss: false, overlayColor: Colors.black45),
        content: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: roomNameInputController,
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.house),
                  icon: null,
                  labelText: '',
                ),
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () async {
              String roomName = roomNameInputController.text;

              if (roomName.isEmpty) {
                Fluttertoast.showToast(
                  msg: 'Please enter a valid room name',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                return;
              }

              CreateRoomResponse createRoomResponse =
                  await room_control_grpc_controllr.createRoom(
                      roomName: roomName);
              if (createRoomResponse.error == null ||
                  createRoomResponse.error.isEmpty) {
                AllowJoinResponse allowJoinResponse =
                    await room_control_grpc_controllr.getAccessToARoom(
                        roomName: roomName);
                if (allowJoinResponse.error == null ||
                    allowJoinResponse.error.isEmpty) {
                  variable_controller.access_token =
                      allowJoinResponse.accessToken;

                  // Navigator.pop(context);
                  await the_alert?.dismiss();

                  updateRooms();

                  Get.toNamed(RoutesMap.single_room_page);

                  // Fluttertoast.showToast(
                  //     msg: "You just created a room: $roomName",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);

                  return;
                }
              } else {
                Fluttertoast.showToast(
                    msg: "Fail to create a room: $roomName",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Fluttertoast.showToast(
                    msg: createRoomResponse.error.toString(),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }

              Navigator.pop(context);
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]);

    await the_alert?.show();
  }
}
