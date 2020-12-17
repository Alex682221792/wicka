import 'package:flutter/material.dart';

import 'dart:math';

import 'package:kmello/resources/values/colors.dart';

class Gradients {
  static LinearGradient wavesGradient = LinearGradient(
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
      colors: [Colores.primary, Colores.secondary]);
}
