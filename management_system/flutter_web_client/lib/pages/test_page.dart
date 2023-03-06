import 'package:flutter/material.dart';
import 'package:flutter_web_client/generated_grpc/management_service.pb.dart';
import 'package:flutter_web_client/store/controllers.dart';

import 'add_location_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  GetUsersResponse getUsersResponse = GetUsersResponse();
  AddPlaceRequest addPlaceRequest =
      AddPlaceRequest(locationOfFreeMap: LocationOfFreeMap());

  TextEditingController message_input_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    () async {}();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // request.locationOfFreeMap.writeToJson();
    // request.locationOfFreeMap.mergeFromJson("");

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: getUsersResponse.user
                        .map((user) => Text(user.username))
                        .toList(),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    var response = await management_grpc_controller.get_users(
                        GetUsersRequest(pageSize: 10, pageNumber: 0));
                    print(response.error);
                    print(response.user[0].email);

                    getUsersResponse = response;
                    setState(() {});
                  },
                  child: Text("Click to Fetch")),
              SizedBox(
                height: 50,
                child: Image.asset(
                  'assets/images/me.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Flexible(
            flex: 1,
            child: Container(
                height: 400,
                color: Colors.green.shade50,
                child: Row(
                  children: [],
                )),
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
  }
}
