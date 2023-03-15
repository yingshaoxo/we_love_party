import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
