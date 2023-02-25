import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tools/internet_tools.dart';

class NetworkErrorPage extends StatefulWidget {
  const NetworkErrorPage({Key? key}) : super(key: key);

  @override
  State<NetworkErrorPage> createState() => _NetworkErrorPageState();
}

class _NetworkErrorPageState extends State<NetworkErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Container(
        width: 0.7.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Oops",
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Unable to connect to the server. \nPlease check your internet connection.",
              style: TextStyle(fontSize: 16, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () async {
                  await has_internet_check_in_the_background();
                },
                child: Text(
                  "TRY AGAIN",
                ))
          ],
        ),
      )),
    );
  }
}
