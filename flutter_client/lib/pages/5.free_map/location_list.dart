import 'package:flutter/material.dart';

import 'package:flutter_client/generated_grpc/free_map_service.pbgrpc.dart';
import 'package:flutter_client/store/controllers.dart';
import 'package:flutter_client/tools/color_tools.dart';

import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';

class LocationListView extends StatefulWidget {
  final List<LocationOfFreeMap> location_list;

  const LocationListView({Key? key, required this.location_list})
      : super(key: key);

  @override
  _LocationListViewState createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var the_location_list = widget.location_list.toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey, style: BorderStyle.solid, width: 0.3))),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 0.4,
          color: Colors.grey,
        ),
        itemCount: the_location_list.length,
        itemBuilder: (BuildContext context, int index) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50.0,
            ),
            child: InkWell(
                child: LocationInfoCard(
                    locationOfFreeMap: the_location_list[index])),
          );
        },
      ),
    );
  }
}

class LocationInfoCard extends StatefulWidget {
  final LocationOfFreeMap locationOfFreeMap;

  const LocationInfoCard({Key? key, required this.locationOfFreeMap})
      : super(key: key);

  @override
  State<LocationInfoCard> createState() => _LocationInfoCardState();
}

class _LocationInfoCardState extends State<LocationInfoCard> {
  @override
  Widget build(BuildContext context) {
    LocationOfFreeMap locationOfFreeMap = widget.locationOfFreeMap;

    Color color_for_the_on_state = "#FFA726".color; //Colors.orange;
    double icon_lable_gap = 2;

    return Container(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onLongPress: () async {
          // FlutterClipboard.copy(message.content)
          //     .then((value) => Fluttertoast.showToast(
          //           msg: "copied",
          //           gravity: ToastGravity.CENTER,
          //           timeInSecForIosWeb: 10,
          //         ));
        },
        onTap: () async {
          variable_controller.target_location = locationOfFreeMap;

          if (variable_controller.current_location != null &&
              variable_controller.target_location != null) {
            var point_a = LatLng(
                variable_controller.current_location!.yLatitude,
                variable_controller.current_location!.xLongitude);
            var point_b = LatLng(variable_controller.target_location!.yLatitude,
                variable_controller.target_location!.xLongitude);

            variable_controller.map_controller.fitBounds(
                LatLngBounds(point_a, point_b),
                options: FitBoundsOptions(padding: EdgeInsets.all(40)));
          }

          variable_controller.map_refresh_trigger.toggle();

          Get.back();
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 5.0, right: 5.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(locationOfFreeMap.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("Scores:    ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                          )),
                      Text("${locationOfFreeMap.scores}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.lightGreen,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text("Distance: ",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                          )),
                      Text(
                        // locationOfFreeMap.distance(),
                        // "need to add distance",
                        "1m",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.down,
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_convenience_store, //24 hours open
                              size: 18,
                              color: locationOfFreeMap.openAllDay
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "24 hours open",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.charging_station, //power
                              size: 18,
                              color: locationOfFreeMap.hasCharger
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "charger",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.wifi,
                              size: 18,
                              color: locationOfFreeMap.hasWifi
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "wifi",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.water,
                              size: 18,
                              color: locationOfFreeMap.hasWater
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "water",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.hot_tub,
                              size: 18,
                              color: locationOfFreeMap.hasHotWater
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "hot water",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.desk,
                              size: 18,
                              color: locationOfFreeMap.hasDesk
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "desk",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.chair,
                              size: 18,
                              color: locationOfFreeMap.hasChair
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "chair",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.airline_seat_legroom_extra, //toilet
                              size: 18,
                              color: locationOfFreeMap.hasToilet
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "toilet",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shower,
                              size: 18,
                              color: locationOfFreeMap.hasShowering
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "shower",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons
                                  .local_post_office, //has_package_receiving_station
                              size: 18,
                              color:
                                  locationOfFreeMap.hasPackageReceivingStation
                                      ? color_for_the_on_state
                                      : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "package station",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.restaurant,
                              size: 18,
                              color: (locationOfFreeMap.hasMcdonald ||
                                      locationOfFreeMap.hasKfc)
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "fast_food",
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.storefront,
                              size: 18,
                              color: locationOfFreeMap.hasStore
                                  ? color_for_the_on_state
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: icon_lable_gap,
                            ),
                            MyAutoSizeTextForLocationList(
                              text: "store",
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAutoSizeTextForLocationList extends StatelessWidget {
  final String text;
  final Color text_color;

  const MyAutoSizeTextForLocationList(
      {Key? key, required this.text, this.text_color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      child: AutoSizeText(
        text,
        style: TextStyle(color: text_color),
        minFontSize: 10,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
