import 'package:flutter/material.dart';

class ClipperSignIn extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double heightColor = 0.6;
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * heightColor, 0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * heightColor, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
