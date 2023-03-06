import 'dart:core';
import 'package:flutter_web_client/generated_grpc/management_service.pbgrpc.dart';
import 'package:flutter_web_client/store/controllers.dart';
import 'package:get/get.dart';

class ManagementPageControllr extends GetxController {
  Rx<SearchPlacesRequest> searchPlacesRequest =
      Rx(SearchPlacesRequest(pageNumber: 0, pageSize: 30));
  Rx<SearchPlacesResponse> searchPlacesResponse = Rx(SearchPlacesResponse());

  Rx<AddPlaceRequest> addPlaceRequest =
      Rx(AddPlaceRequest(locationOfFreeMap: LocationOfFreeMap()));

  final key_name_of_addPlaceRequest = "addPlaceRequest";

  Future<void> initilize_function() async {
    try {
      var data = variable_controller.preferences
          ?.getString(key_name_of_addPlaceRequest);
      if (data != null) {
        addPlaceRequest.value.mergeFromJson(data);
      }
    } catch (e) {
      print(e);
      // storage.deleteItem(key_name_of_addPlaceRequest);
    }
  }

  Future<void> save_addPlaceRequest(String json_string) async {
    await variable_controller.preferences
        ?.setString(key_name_of_addPlaceRequest, json_string);
  }

  Future<void> update_home_page_locations() async {
    var response = await management_grpc_controller
        .search_places(management_page_controller.searchPlacesRequest.value);
    management_page_controller.searchPlacesResponse.trigger(response);
  }
}
