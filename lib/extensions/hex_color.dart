import 'package:flutter/material.dart';

extension HexColor on String {
  Color get fromHex {
    var hex = this;
    hex = hex.toUpperCase().replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    final hexNum = int.parse(hex, radix: 16);

    if (hexNum == 0) {
      return const Color(0xff000000);
    }

    return Color(hexNum);
  }
}
