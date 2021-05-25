import 'package:flutter/cupertino.dart';

class Dimens {
  static double sizeIcons = 25;
  static double heightProductImages = 50;
  static double radiusButtons = 20;
  static double radiusGeneral = 10;
  static double spaceBetweenFields = 20;
  static double lgButtonHeight = 40;
  static double largeFont = 17;
  static double normalFont = 14;
  static double smallFont = 10;
  static double lgButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.7;
  }

  static EdgeInsets padding10_5 =
      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
}
