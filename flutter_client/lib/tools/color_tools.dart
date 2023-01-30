import 'dart:math';

import 'package:flutter/material.dart';

extension ColorConvert on String {
  Color get color {
    return ColorTools.everything_to_color(this);
  }
}

class ColorTools {
  static Color everything_to_color(String color_string) {
    RegExp hexColorRegex =
        RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$');
    if (color_string.startsWith("rgba")) {
      List rgbaList =
          color_string.substring(5, color_string.length - 1).split(",");
      return Color.fromRGBO(int.parse(rgbaList[0]), int.parse(rgbaList[1]),
          int.parse(rgbaList[2]), double.parse(rgbaList[3]));
    } else if (color_string.startsWith("rgb")) {
      List rgbList = color_string
          .substring(4, color_string.length - 1)
          .split(",")
          .map((c) => int.parse(c))
          .toList();
      return Color.fromRGBO(rgbList[0], rgbList[1], rgbList[2], 1.0);
    } else if (hexColorRegex.hasMatch(color_string)) {
      if (color_string.length == 4) {
        color_string = color_string + color_string.substring(1, 4);
      }
      if (color_string.length == 7) {
        int colorValue = int.parse(color_string.substring(1), radix: 16);
        return Color(colorValue).withOpacity(1.0);
      } else {
        int colorValue = int.parse(color_string.substring(1, 7), radix: 16);
        double opacityValue =
            int.parse(color_string.substring(7), radix: 16).toDouble() / 255;
        return Color(colorValue).withOpacity(opacityValue);
      }
    } else if (color_string.isEmpty) {
      throw UnsupportedError("Empty color field found.");
    } else if (color_string == 'none') {
      return Colors.transparent;
    } else {
      return Colors.white;
      // throw UnsupportedError(
      //     "Only hex, rgb, or rgba color format currently supported. String:  $color_string");
    }
  }

  static Color hex_to_color(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color get_random_color() {
    return Color(0xFF000000 + Random().nextInt(0xFFFFFF));
  }

  static List<Color> get_a_list_of_random_colors(int length,
      {double opacity = 1}) {
    List<Color> colors = [];
    for (int i = 0; i < length; i++) {
      colors.add(get_random_color().withOpacity(opacity));
    }
    return colors;
  }
}
