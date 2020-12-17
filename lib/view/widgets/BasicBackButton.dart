import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicBackButton extends StatelessWidget {
  VoidCallback onPress;

  BasicBackButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25.0,
      left: -15.0,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        color: Colors.transparent,
        child:
            Icon(Icons.arrow_back_ios, color: Colors.white, size: 40.0 * 0.5),
        onPressed: (onPress),
        shape: CircleBorder(
            side: BorderSide(color: Colors.transparent, width: 2.0)),
      ),
    );
  }
}
