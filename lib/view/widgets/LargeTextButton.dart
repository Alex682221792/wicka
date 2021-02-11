import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/enums/ButtonStyleEnum.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/gradients.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/dimens.dart';

class LargeTextButton extends StatelessWidget {
  Color colorButton;
  String text;
  VoidCallback onPress;
  ButtonStyleEnum buttonStyle;

  LargeTextButton(
      {this.colorButton, this.text, this.onPress, this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    BoxDecoration chosenDecoration;
    switch (this.buttonStyle) {
      case ButtonStyleEnum.SECONDARY:
        chosenDecoration = Decorations.secondaryButtonStyle;
        break;
      case ButtonStyleEnum.OUTLINE:
        chosenDecoration = Decorations.outlineButtonStyle;
        break;
      default:
        chosenDecoration = Decorations.gradientButtonStyle;
    }
    ;
    return Container(
        height: Dimens.lgButtonHeight,
        width: Dimens.lgButtonWidth(context),
        margin: EdgeInsets.all(2.0),
        child: RaisedButton(
          onPressed: onPress,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: chosenDecoration,
            child: Container(
              padding: EdgeInsets.all(5.0),
              constraints: BoxConstraints(
                  maxWidth: 300.0, minHeight: Dimens.lgButtonHeight),
              alignment: Alignment.center,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: (this.buttonStyle == null ||
                          ButtonStyleEnum.GRADIENT == this.buttonStyle)
                      ? TextStyles.mainGradientButtonStyle
                      : TextStyles.sectionTitleStyle),
            ),
          ),
        ));
  }
}
