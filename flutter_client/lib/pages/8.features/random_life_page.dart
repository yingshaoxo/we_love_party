import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_client/store/controllers.dart';

class RandomLifePage extends StatefulWidget {
  const RandomLifePage({Key? key}) : super(key: key);

  @override
  State<RandomLifePage> createState() => _RandomLifePageState();
}

class _RandomLifePageState extends State<RandomLifePage> {
  List<String> places = [
    "5-KFC",
    "5-McDonald's",
    "4-Charger_Space_Left",
    "4-Charger_Space_Right",
    "2-KFC",
    "2-7-family_Left",
    "2-7-family_Right",
    "1-McDonald's",
  ];

  List<String> todo_list = [
    "English Practice",
    "Coding Practice",
    "Business Practice",
  ];
  // practice makes perfect

  @override
  Widget build(BuildContext context) {
    var random_index = Random.secure().nextInt(places.length);
    var random_place = places[random_index];

    var username = variable_controller.userModel.username ?? "yingshaoxo";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text("Random Life"),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Where to go: "),
              Text(random_place),
            ],
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          Text("""
Hi, ${username}

今天又是愉快的一天，记住几句话：

1. 不谈恋爱不结婚
2. 不打工不受压榨
3. 练习 普通话 + English
4. 写代码 + 卖东西
"""
              .trim()),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
