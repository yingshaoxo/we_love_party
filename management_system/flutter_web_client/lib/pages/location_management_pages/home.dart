import 'package:flutter/material.dart';
import 'package:flutter_web_client/generated_grpc/management_service.pb.dart';
import 'package:flutter_web_client/store/controllers.dart';
import 'package:get/get.dart';

import 'add_location_page.dart';

class LocationManagementHomePage extends StatefulWidget {
  const LocationManagementHomePage({super.key});

  @override
  State<LocationManagementHomePage> createState() =>
      _LocationManagementHomePageState();
}

class _LocationManagementHomePageState
    extends State<LocationManagementHomePage> {
  GetUsersResponse getUsersResponse = GetUsersResponse();
  AddPlaceRequest addPlaceRequest =
      AddPlaceRequest(locationOfFreeMap: LocationOfFreeMap());

  TextEditingController message_input_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    () async {
      await management_page_controller.update_home_page_locations();
    }();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // request.locationOfFreeMap.writeToJson();
    // request.locationOfFreeMap.mergeFromJson("");

    return Obx(() {
      management_page_controller.searchPlacesResponse.value;
      management_page_controller.searchPlacesRequest.value;
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: getUsersResponse.user
            //               .map((user) => Text(user.username))
            //               .toList(),
            //         ),
            //       ),
            //     ),
            //     TextButton(
            //         onPressed: () async {
            //           var response = await management_grpc_controller.get_users(
            //               GetUsersRequest(pageSize: 10, pageNumber: 0));
            //           print(response.error);
            //           print(response.user[0].email);

            //           getUsersResponse = response;
            //           setState(() {});
            //         },
            //         child: Text("Click to Fetch")),
            //     SizedBox(
            //       height: 50,
            //       child: Image.asset(
            //         'assets/images/me.jpg',
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              height: 50,
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text("Search Location: "),
                  Expanded(
                      child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      () async {
                        management_page_controller
                            .searchPlacesRequest.value.keyWords = value;
                        await management_page_controller
                            .update_home_page_locations();
                        management_page_controller.searchPlacesRequest
                            .refresh();
                      }();
                    },
                  )),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    height: 400,
                    color: Colors.green.shade50,
                    child: Row(
                      children: management_page_controller
                          .searchPlacesResponse.value.locationOfFreeMap
                          .map((e) {
                        return Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                color: Colors.blue.shade50,
                                width: 200,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(e.name),
                                    Text(
                                        "(${e.yLatitude.toString()}, ${e.xLongitude.toString()})"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("scores: ${e.scores}"),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                management_page_controller.addPlaceRequest.value
                                    .locationOfFreeMap = e;
                                management_page_controller.addPlaceRequest
                                    .refresh();
                              },
                            ),
                            Container(
                              width: 1,
                              color: Colors.amber,
                            )
                          ],
                        );
                      }).toList(),
                    )),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 200),
                color: Colors.yellow.shade50,
                child: AddLocationPage(),
              ),
            )
          ],
        ),
      );
    });
  }
}
