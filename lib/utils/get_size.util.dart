import 'package:flutter/material.dart';

class GetSize {
  static late double width;
  static late double height;

  static void init(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if (widthSize > 500) {
      width = 500;
    } else {
      width = widthSize;
    }
  }
}
