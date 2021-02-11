import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/CircleButton.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 40.0,
      top: 40.0,
      left: MediaQuery.of(context).size.width * 0.025,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 30.0,
          decoration: Decorations.topBarShadow,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/logo_wicka.png", height: 40),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("buen día", style: TextStyles.subHeaderStyle),
                          Text("Alexander", style: TextStyles.headerStyle)
                        ],
                      ))),
              CircleButton(
                colorIcon: Colores.tertiary,
                colorButton: Colors.transparent,
                size: 40.0,
                icon: Icons.notifications,
                onPress: () {},
              )
            ],
          )),
    );
  }
}
