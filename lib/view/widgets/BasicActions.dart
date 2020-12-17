import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmello/enums/ButtonStyleEnum.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/widgets/LargeTextButton.dart';

class BasicActionsButton extends StatelessWidget {
  VoidCallback onStepContinue;
  VoidCallback onStepCancell;

  BasicActionsButton({this.onStepContinue, this.onStepCancell});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Row(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: LargeTextButton(
                  text: Strings.accept,
                  onPress: onStepContinue,
                  buttonStyle: ButtonStyleEnum.GRADIENT)),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: LargeTextButton(
                  text: Strings.cancel,
                  onPress: onStepCancell,
                  buttonStyle: ButtonStyleEnum.SECONDARY))
        ]));
  }
}
