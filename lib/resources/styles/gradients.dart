import 'package:flutter/material.dart';

import 'package:wicka/resources/values/colors.dart';

class Gradients {
  static LinearGradient wavesGradient = LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
      colors: [Colores.primary, Colores.secondary]);

  static LinearGradient whiteVerticalGradient = LinearGradient(
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
      // stops: [0.75, 1.0],
      colors: [Colores.primaryBackground, Colores.primaryBackground.withAlpha(0)]);
}
