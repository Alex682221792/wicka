import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/strings.dart';

class StepItem extends StatelessWidget {
  IconData icon;
  double size;
  double index;
  double currentIndex;

  StepItem({this.icon, this.size, this.index, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.all(2.0),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        color: currentIndex == index
            ? Colores.secondary
            : currentIndex > index
                ? Colores.primary
                : Colores.tertiary,
        child: Icon(icon, color: Colores.primaryBackground, size: size * 0.5),
        onPressed: () {
          final scaffold = Scaffold.of(context);
          scaffold.showSnackBar(
            SnackBar(
              content: Text(Strings.incompleteStepError),
            ),
          );
        },
        shape: CircleBorder(
            side: BorderSide(
                color:
                    currentIndex < index ? Colores.tertiary : Colores.primary,
                width: 2.0)),
      ),
    );
  }
}
