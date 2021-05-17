import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/values/dimens.dart';

class BasicBackButton extends StatelessWidget {
  VoidCallback onPress;

  BasicBackButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 25.0,
        left: 5.0,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            margin: EdgeInsets.all(5.0),
            height: 40.0,
            width: 40.0,
            decoration: Decorations.circleShadowWithBackground(
                size: 80.0, background: Colors.black26),
            child: IconButton(
                icon:
                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.0),
                onPressed: (onPress))));
  }
}
