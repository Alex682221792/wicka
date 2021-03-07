import 'package:flutter/material.dart';

import 'package:wicka/resources/values/colors.dart';

class Gradients {
  static LinearGradient wavesGradient = LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
      colors: [Colores.primary, Colores.secondary]);
}
