import 'package:flutter/material.dart';
import 'package:flutter_web_client/generated_grpc/management_service.pb.dart';
import 'package:flutter_web_client/store/controllers.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  GetUsersResponse getUsersResponse = GetUsersResponse();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              'assets/images/me.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: getUsersResponse.user
                .map((user) => Text(user.username))
                .toList(),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () async {
                var response = await management_grpc_controller
                    .get_users(GetUsersRequest(pageSize: 10, pageNumber: 0));
                print(response.error);
                print(response.user[0].email);

                getUsersResponse = response;
                setState(() {});
              },
              child: Text("Click to Fetch"))
        ],
      )),
    );
  }
}
