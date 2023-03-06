import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_client/store/controllers.dart';
import 'package:get/get.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  TextEditingController location_name_editing_controller =
      TextEditingController(
          text: management_page_controller
              .addPlaceRequest.value.locationOfFreeMap.name);

  TextEditingController latitude_editing_controller = TextEditingController(
      text: management_page_controller
          .addPlaceRequest.value.locationOfFreeMap.yLatitude
          .toString());

  TextEditingController longitude_editing_controller = TextEditingController(
      text: management_page_controller
          .addPlaceRequest.value.locationOfFreeMap.xLongitude
          .toString());

  TextEditingController scores_editing_controller = TextEditingController(
      text: management_page_controller
          .addPlaceRequest.value.locationOfFreeMap.scores
          .toString());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      management_page_controller.addPlaceRequest.value;
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("location name: "),
                Expanded(
                  child: TextField(
                    controller: location_name_editing_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: 'location name',
                    ),
                    onChanged: (value) {
                      management_page_controller
                          .addPlaceRequest.value.locationOfFreeMap.name = value;
                      management_page_controller.addPlaceRequest.refresh();
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Text("y_latitude: "),
                  Expanded(
                    child: TextField(
                      controller: latitude_editing_controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'y_latitude',
                      ),
                      onChanged: (value) {
                        var double_value = double.tryParse(value);
                        if (double_value != null) {
                          management_page_controller.addPlaceRequest.value
                              .locationOfFreeMap.yLatitude = double_value;
                          management_page_controller.addPlaceRequest.refresh();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text("x_longitude: "),
                  Expanded(
                    child: TextField(
                      controller: longitude_editing_controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'x_longitude',
                      ),
                      onChanged: (value) {
                        var double_value = double.tryParse(value);
                        if (double_value != null) {
                          management_page_controller.addPlaceRequest.value
                              .locationOfFreeMap.xLongitude = double_value;
                          management_page_controller.addPlaceRequest.refresh();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 1, child: Text("scores: ")),
                  Flexible(
                    flex: 4,
                    child: TextField(
                      controller: scores_editing_controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'scores',
                      ),
                      onChanged: (value) {
                        var double_value = double.tryParse(value);
                        if (double_value != null) {
                          management_page_controller.addPlaceRequest.value
                              .locationOfFreeMap.scores = double_value;
                          management_page_controller.addPlaceRequest.refresh();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Open all day: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.openAllDay,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.openAllDay = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has charger: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasCharger,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasCharger = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has wifi: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasWifi,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasWifi = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has water: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasWater,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasWater = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has hot water: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasHotWater,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasHotWater = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has desk: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasDesk,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasDesk = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has chair: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasChair,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasChair = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has toilet: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasToilet,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasToilet = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has showering: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasShowering,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasShowering = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has package receiving station: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller.addPlaceRequest.value
                      .locationOfFreeMap.hasPackageReceivingStation,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasPackageReceivingStation = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has KFC: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasKfc,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasKfc = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has McDonald: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasMcdonald,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasMcdonald = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Has store: "),
                Checkbox(
                  checkColor: Colors.white,
                  value: management_page_controller
                      .addPlaceRequest.value.locationOfFreeMap.hasStore,
                  onChanged: (bool? value) {
                    if (value != null) {
                      management_page_controller.addPlaceRequest.value
                          .locationOfFreeMap.hasStore = value;
                      management_page_controller.addPlaceRequest.refresh();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text("Add New Position"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple.shade50)),
              onPressed: () async {
                var response = await management_grpc_controller.add_place(
                    management_page_controller.addPlaceRequest.value);
                if (response.error != null && response.error.isNotEmpty) {
                  await EasyLoading.showError(response.error,
                      dismissOnTap: true);
                } else {
                  await EasyLoading.showSuccess("position added",
                      dismissOnTap: true);
                  await management_page_controller.save_addPlaceRequest(
                      management_page_controller.addPlaceRequest.value
                          .writeToJson());
                }
              },
            ),
            Text(management_page_controller
                .addPlaceRequest.value.locationOfFreeMap
                .writeToJson()),
          ],
        ),
      );
    });
  }
}
