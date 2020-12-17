import 'package:flutter/cupertino.dart';

class Dimens {
  static double spaceBetweenFields = 20;
  static double lgButtonHeight = 40;
  static double lgButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.7;
  }
}
