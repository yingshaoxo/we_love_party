import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_client/common_user_interface/pop_up_window.dart';
import 'package:flutter_client/generated_grpc/free_map_service.pbgrpc.dart';
import 'package:flutter_client/store/controllers.dart';
import 'location_list.dart';

class PlaceSearchPage extends StatefulWidget {
  const PlaceSearchPage({Key? key}) : super(key: key);

  @override
  _PlaceSearchPageState createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends State<PlaceSearchPage> {
  final searchInputBoxController = TextEditingController();

  List<LocationOfFreeMap> a_list_of_free_map_locations = [];

  @override
  void dispose() {
    searchInputBoxController.dispose();

    super.dispose();
  }

  Future<void> doASearch() async {
    String keywords = searchInputBoxController.text.trim();

    if (keywords.isEmpty) {
      return;
    }

    SearchPlacesResponse searchPlacesResponse =
        await free_map_grpc_controller.search_locations(SearchPlacesRequest()
          ..keyWords = keywords
          ..pageNumber = 0
          ..pageSize = 30
          ..xLongitude = 0
          ..yLatitude = 90);

    if (searchPlacesResponse.error != null &&
        searchPlacesResponse.error.isEmpty) {
      a_list_of_free_map_locations = searchPlacesResponse.locationOfFreeMap;
      setState(() {});
    } else {
      show_error(msg: searchPlacesResponse.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: TextField(
            controller: searchInputBoxController,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            keyboardType: TextInputType.text,
            autocorrect: false,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search here',
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.withAlpha(200), width: 0.5),
              ),
            ),
            onChanged: (_) async {
              await doASearch();
            },
            onEditingComplete: () async {
              await doASearch();
            },
            /*
            expands: true,
            maxLines: null,
            minLines: null,
            */
          ),
        ),
        Expanded(
            child: LocationListView(
          location_list: a_list_of_free_map_locations,
        ))
      ],
    );
  }
}
