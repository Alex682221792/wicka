import 'package:flutter/material.dart';

class ClipperSignUp extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double heightColor = 0.6;
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.05, size.height * heightColor,
        size.width * 0.25, size.height * heightColor);
    path.lineTo(size.width, size.height * heightColor);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
