import 'package:flutter/material.dart';

class ClipperMainMenu extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double heightColor = 0.6;
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        0.0, size.height, 0, size.height * 0.9);
    path.lineTo(0, size.height * 0.1);
    path.quadraticBezierTo(
        0, 0, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
