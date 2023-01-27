import 'dart:math';
import 'dart:ui';

extension ColorConvert on String {
  Color get color {
    return ColorTools.hex_to_color(this);
  }
}

class ColorTools {
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
