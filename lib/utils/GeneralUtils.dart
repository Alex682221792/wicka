import 'dart:math';

import 'package:flutter/cupertino.dart';

class GeneralUtils{
  Color getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.15);
  }

  Color getRandomColorWithAlpha({alpha: double}) {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(alpha);
  }
}