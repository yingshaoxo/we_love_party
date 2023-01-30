import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullScreenImagePage extends StatefulWidget {
  final Image image;
  const FullScreenImagePage({Key? key, required this.image}) : super(key: key);

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "", //'Preview',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        titleTextStyle: TextStyle(fontSize: 16),
      ),
      body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          child: FittedBox(child: widget.image, fit: BoxFit.fill)),
    );
  }
}
