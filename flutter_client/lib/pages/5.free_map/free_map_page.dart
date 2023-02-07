import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_client/common_user_interface/exit.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/free_map_service.pbgrpc.dart';
import 'package:flutter_client/store/config.dart';

import 'package:flutter_client/store/controllers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import '../../tools/color_tools.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

import 'package:get/get.dart';

class MapIndicatorType {
  static const target = "target";
  static const me = "me";
  static const normal = "normal";

  String value = MapIndicatorType.normal;
}

class FreeMapPage extends StatefulWidget {
  const FreeMapPage({Key? key}) : super(key: key);

  @override
  _FreeMapPageState createState() => _FreeMapPageState();
}

class _FreeMapPageState extends State<FreeMapPage> {
  bool initialization_is_done = false;

  Future<bool> get_gps_permissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
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

      if ((await get_gps_permissions()) == false) {
        await show_message(
            msg:
                "Please give me the Location/GPS permission. So that I can start to work.");
        initialization_is_done = false;
        return;
      }

      setState(() {
        initialization_is_done = true;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: initialization_is_done == false
            ? Container()
            : Column(
                children: [
                  Flexible(
                    child: TheMap(),
                  )
                  // Center(
                  //   child: SmoothCompass(
                  //     //higher the value of rotation speed slower the rotation
                  //     rotationSpeed: 200,
                  //     height: 300,
                  //     width: 300,
                  //     compassBuilder: (context,
                  //         AsyncSnapshot<CompassModel>? compassData,
                  //         Widget child) {
                  //       print(compassData);
                  //       return child;
                  //     },
                  //   ),
                  // )
                ],
              ));
  }
}

class TheMap extends StatefulWidget {
  const TheMap({
    Key? key,
  }) : super(key: key);

  @override
  State<TheMap> createState() => _TheMapState();
}

class _TheMapState extends State<TheMap> {
  Position? current_position;
  bool stream_on = true;
  StreamSubscription<Position>? the_stream;

  List<LatLng> tapped_points = [];

  void _handleTap(TapPosition tapPosition, LatLng latlng) {
    // tapped_points.add(latlng);

    // setState(() {});
  }

  Future<void> refresh_current_location() async {
    current_position = await Geolocator.getCurrentPosition();
    if (current_position?.latitude != null &&
        current_position?.longitude != null) {
      variable_controller.current_location = LocationOfFreeMap(
          yLatitude: current_position?.latitude ?? 0,
          xLongitude: current_position?.longitude ?? 0);
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // the_stream = Geolocator.getPositionStream().listen((Position position) {
    //   current_position = position;
    //   setState(() {});
    // });

    // () async {}();
  }

  @override
  void dispose() {
    () async {
      if (the_stream != null) {
        try {
          the_stream?.cancel();
        } catch (e) {
          print(e);
        }
      }

      super.dispose();
    }();
  }

  @override
  Widget build(BuildContext context) {
    final markers = tapped_points.map((latlng) {
      return get_location_indicator(
          locationOfFreeMap: LocationOfFreeMap(
              yLatitude: latlng.latitude,
              xLongitude: latlng.longitude,
              name: "ABCD"),
          mapIndicatorType: MapIndicatorType()
            ..value = MapIndicatorType.normal);
    }).toList();

    markers.add(get_location_indicator(
        locationOfFreeMap: LocationOfFreeMap(
            yLatitude: current_position?.altitude,
            xLongitude: current_position?.longitude,
            name: "Me"),
        mapIndicatorType: MapIndicatorType()..value = MapIndicatorType.me));

    if (variable_controller.target_location != null) {
      var the_target = get_location_indicator(
          locationOfFreeMap: variable_controller.target_location!,
          mapIndicatorType: MapIndicatorType()
            ..value = MapIndicatorType.target);
      markers.add(the_target);
    }

    return Container(
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text(stream_on == false ? "paused" : "on"),
                // TextButton(
                //     child: Text("Start/Puase the location update"),
                //     onPressed: () {
                //       if (the_stream != null) {
                //         if (stream_on == true) {
                //           the_stream?.pause();
                //           stream_on = false;
                //         } else {
                //           the_stream?.resume();
                //           stream_on = true;
                //         }
                //       }
                //       setState(() {});
                //     }),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: TextField(
                    readOnly: true,
                    controller: null,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    autocorrect: false,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0.5),
                      ),
                    ),
                    onChanged: (_) async {
                      // await doASearch();
                    },
                    onEditingComplete: () async {
                      // await doASearch();
                    },
                    onTap: () async {
                      Get.toNamed(RoutesMap.place_search_list_page);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "y_altitude: ${current_position?.altitude}    |    x_longitude:${current_position?.longitude}"),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: FlutterMap(
                    mapController: variable_controller.map_controller,
                    options: MapOptions(
                        center: LatLng(current_position?.latitude ?? 0.0,
                            current_position?.longitude ?? 0.0),
                        zoom: 13,
                        onTap: _handleTap),
                    children: [
                      TileLayer(
                        // urlTemplate:
                        //     'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        urlTemplate: 'https://abc.com/{z}/{x}/{y}.png',
                        userAgentPackageName: 'xyz.yingshaoxo.weloveparty',
                      ),
                      MarkerLayer(markers: markers),
                    ],
                  ),
                )
                // RotationTransition(
                //   turns:
                //       AlwaysStoppedAnimation(current_position?.heading ?? 0 / 360),
                //   child: Icon(Icons.arrow_forward),
                // ),
              ],
            ),
            Positioned(
                right: 25.0,
                bottom: 40.0,
                child: GestureDetector(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.white,
                    child: IconButton(
                        onPressed: () async {}, icon: Icon(Icons.gps_fixed)),
                  ),
                  onTap: () async {
                    refresh_current_location();
                  },
                )),
          ],
        ),
      ),
    );
  }

  Marker get_location_indicator({
    required LocationOfFreeMap locationOfFreeMap,
    required MapIndicatorType mapIndicatorType,
  }) {
    return Marker(
      width: 80,
      height: 80,
      point: LatLng(locationOfFreeMap.yLatitude, locationOfFreeMap.xLongitude),
      builder: (ctx) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.place,
              color: mapIndicatorType.value == MapIndicatorType.normal
                  ? "#7CB342".color
                  : mapIndicatorType.value == MapIndicatorType.me
                      ? "#64B5F6".color
                      : "#F44336".color,
              size: mapIndicatorType.value == MapIndicatorType.normal ? 24 : 28,
            ),
            Text(locationOfFreeMap.name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  // shadows: [
                  //   Shadow(
                  //       // bottomLeft
                  //       offset: Offset(-1, -1),
                  //       color: Colors.white),
                  //   Shadow(
                  //       // bottomRight
                  //       offset: Offset(1, -1),
                  //       color: Colors.white),
                  //   Shadow(
                  //       // topRight
                  //       offset: Offset(1, 1),
                  //       color: Colors.white),
                  //   Shadow(
                  //       // topLeft
                  //       offset: Offset(-1, 1),
                  //       color: Colors.white),
                  // ],
                ))
          ],
        ),
      ),
    );
  }
}
