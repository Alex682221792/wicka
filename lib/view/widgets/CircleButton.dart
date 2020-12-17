import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  Color colorButton;
  Color colorIcon;
  IconData icon;
  double size;
  VoidCallback onPress;

  CircleButton(
      {this.colorButton, this.colorIcon, this.icon, this.size, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.all(2.0),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        color: colorButton,
        child: Icon(icon, color: colorIcon, size: size * 0.5),
        onPressed: onPress,
        shape: CircleBorder(side: BorderSide(color: colorButton, width: 2.0)),
      ),
    );
  }
}
