import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter_client/data_models/room.dart';
import 'package:flutter_client/data_models/user.dart';
import 'package:flutter_client/pages/4.party/widgets/my_room_profile.dart';
import 'package:flutter_client/store/config.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/tools/utils/style.dart';
import 'package:flutter_client/tools/utils/utils.dart';
import 'package:flutter_client/widgets/round_button.dart';
import 'package:flutter_client/widgets/round_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

import 'package:livekit_client/livekit_client.dart' as livekit;

Map<String, String> identityPictureMap = {};
String getARandomCatPicturePath(String identity) {
  if (identity.isEmpty) {
    return "";
  }

  if (identityPictureMap.containsKey(identity)) {
    return identityPictureMap[identity]!;
  } else {
    String path = 'assets/images/cat${get_a_random_number(1, 9)}.jpg';
    identityPictureMap[identity] = path;
    return path;
  }
}

class SingleVoiceRoom extends StatefulWidget {
  const SingleVoiceRoom({Key? key}) : super(key: key);

  @override
  State<SingleVoiceRoom> createState() => _SingleVoiceRoomState();
}

class _SingleVoiceRoomState extends State<SingleVoiceRoom>
    with TickerProviderStateMixin {
  AnimationController? loading_animation_controller;

  User? myProfile;
  Room? room;

  livekit.Room theLivekitRoom = livekit.Room();

  List<livekit.Participant> participants = [];
  livekit.EventsListener<livekit.RoomEvent>? roomListener;

  @override
  void initState() {
    super.initState();

    () async {
      myProfile = User.fromJson({
        'name': variable_controller.user_email,
        'username': variable_controller.user_email,
        'profileImage': 'assets/images/cat2.jpg',
        'followers': '1k',
        'following': '1',
        'lastAccessTime': '0m',
        'isNewUser': false,
      });
      await connectLiveKit();
    }();
  }

  @override
  void dispose() {
    () async {
      loading_animation_controller?.dispose();

      theLivekitRoom.removeListener(_onRoomDidUpdate);
      // await theLivekitRoom.disconnect();
      await roomListener?.dispose();
      await theLivekitRoom.dispose();
    }();

    super.dispose();
  }

  Future<void> connectLiveKit() async {
    var options = const livekit.ConnectOptions(
        autoSubscribe: true, protocolVersion: livekit.ProtocolVersion.v8);

    var roomOptions = const livekit.RoomOptions(
      defaultVideoPublishOptions: livekit.VideoPublishOptions(
        simulcast: true,
      ),
      defaultAudioCaptureOptions: livekit.AudioCaptureOptions(
        echoCancellation: true,
        noiseSuppression: true,
        autoGainControl: false,
      ),
    );

    await theLivekitRoom.connect(
        LivekitConfig.url, variable_controller.access_token ?? '',
        connectOptions: options,
        fastConnectOptions: livekit.FastConnectOptions(
            microphone: livekit.TrackOption(enabled: true),
            camera: livekit.TrackOption(enabled: true)),
        roomOptions: roomOptions);

    theLivekitRoom.addListener(_onRoomDidUpdate);
    roomListener = theLivekitRoom.createListener();

    print('Joined room: ${theLivekitRoom.name ?? ""}');
  }

  void _onRoomDidUpdate() {
    _sortParticipants();
  }

  void _sortParticipants() {
    if (theLivekitRoom == null) return;

    // update participants
    List<livekit.Participant> tempParticipants = [];

    if (theLivekitRoom?.participants.isNotEmpty == true) {
      tempParticipants.addAll(theLivekitRoom!.participants.values);
      print('participants: ${tempParticipants.length}');

      // sort speakers for the grid
      tempParticipants.sort((a, b) {
        // loudest speaker first
        if (a.isSpeaking && b.isSpeaking) {
          if (a.audioLevel > b.audioLevel) {
            return -1;
          } else {
            return 1;
          }
        }

        // last spoken at
        final aSpokeAt = a.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
        final bSpokeAt = b.lastSpokeAt?.millisecondsSinceEpoch ?? 0;

        if (aSpokeAt != bSpokeAt) {
          return aSpokeAt > bSpokeAt ? -1 : 1;
        }

        // video on
        if (a.hasVideo != b.hasVideo) {
          return a.hasVideo ? -1 : 1;
        }

        // joinedAt
        return a.joinedAt.millisecondsSinceEpoch -
            b.joinedAt.millisecondsSinceEpoch;
      });
    }

    if (theLivekitRoom != null) {
      final tempLocalParticipant = theLivekitRoom.localParticipant;
      if (tempLocalParticipant != null) {
        if (tempParticipants.length > 1) {
          tempParticipants.insert(1, tempLocalParticipant);
        } else {
          tempParticipants.add(tempLocalParticipant);
        }
      }
    }

    // update room
    Room? tempRoom = Room.fromJson({
      'title': theLivekitRoom.name ?? '',
      "users": participants
          .map((participant) => User.fromJson({
                'username': participant.identity,
                'name': participant.identity
                    .substring(0, [8, participant.identity.length].reduce(min)),
                'profileImage': getARandomCatPicturePath(participant.identity),
                'microphoneOn': participant.isMicrophoneEnabled(),
                'isSpeaking': participant.isSpeaking,
              }))
          .toList(),
      'speakerCount': participants.length,
    });

    setState(() {
      participants = tempParticipants;
      room = tempRoom;
    });
  }

  bool doesLocalParticipantMicrophoneEnabled() {
    final localParticipant = theLivekitRoom.localParticipant;
    if (localParticipant == null) return false;
    return localParticipant.isMicrophoneEnabled();
  }

  @override
  Widget build(BuildContext context) {
    var realUsers = room?.users.sublist(0, room?.speakerCount ?? 0) ?? [];

    if (loading_animation_controller == null) {
      loading_animation_controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1200));
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 141, 171, 207),
        title: Row(
          children: [
            InkWell(
              onTap: () async {
                if (await confirm(
                  context,
                  content: const Text('Do you want to leave this room?'),
                  textOK: const Text('Yes'),
                  textCancel: const Text('No'),
                )) {
                  Navigator.pop(context);
                }
              },
              child: Row(
                children: [
                  // IconButton(
                  //   iconSize: 30,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   onPressed: () async {},
                  // ),
                  // const Text(
                  //   'All rooms',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 15,
                  //   ),
                  // ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                //head picture
                // grpcController.getCurrentUserUUIDlist();
              },
              child: RoundImage(
                path: getARandomCatPicturePath(myProfile?.username ?? ""),
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: room == null || realUsers.isEmpty
          ? Center(
              child: SpinKitThreeBounce(
              color: Colors.green[100],
              size: 60.0,
              controller: loading_animation_controller,
            ))
          : Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        bottom: 80,
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          buildTitle(room?.title ?? ""),
                          const SizedBox(
                            height: 15,
                          ),
                          buildSpeakers(realUsers),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: buildBottom(context),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget buildSpeakers(List<User> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150,
        crossAxisSpacing: 20,
      ),
      itemCount: users.length,
      itemBuilder: (gc, index) {
        return MyRoomProfile(
          user: users[index],
          isModerator: false,
          isMute: !users[index].microphoneOn,
          isSpeaking: users[index].isSpeaking,
          size: 80,
          showEmailAddress: () async {
            await copyToClipboard(users[index].username);
            Fluttertoast.showToast(
                msg: users[index].username,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0);
          },
        );
      },
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          RoundButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Style.LightGrey,
            child: const Text(
              '✌️ Leave quietly',
              style: TextStyle(
                color: Style.AccentRed,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          RoundButton(
            onPressed: () async {
              await launch(
                  "https://www.youtube.com/channel/UCbT9GDmkqf555ATReJor6ag");
            },
            color: Style.LightGrey,
            isCircle: true,
            child: const Icon(
              Icons.add,
              size: 15,
              color: Colors.black,
            ),
          ),
          RoundButton(
            onPressed: () async {
              var localParticipant = theLivekitRoom.localParticipant;
              if (localParticipant != null) {
                if (localParticipant.isMuted) {
                  await theLivekitRoom.localParticipant
                      ?.setMicrophoneEnabled(true);
                } else {
                  await theLivekitRoom.localParticipant
                      ?.setMicrophoneEnabled(false);
                }
              }
            },
            color: Style.LightGrey,
            isCircle: true,
            child: Icon(
              doesLocalParticipantMicrophoneEnabled() == true
                  ? Icons.mic
                  : Icons.mic_off,
              size: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
