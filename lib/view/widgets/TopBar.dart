import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/view/widgets/CircleButton.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 40.0,
      top: 20.0,
      left: MediaQuery.of(context).size.width * 0.025,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 30.0,
          decoration: Decorations.topBarShadow,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Header", style: TextStyles.headerStyle))),
              CircleButton(
                colorIcon: Colores.primaryBackground,
                colorButton: Colors.transparent,
                size: 40.0,
                icon: Icons.notifications,
                onPress: () {},
              ),
              CircleButton(
                colorIcon: Colores.primaryBackground,
                colorButton: Colors.transparent,
                size: 40.0,
                icon: Icons.chat,
                onPress: () {},
              ),
              CircleButton(
                colorIcon: Colores.primary,
                colorButton: Colors.transparent,
                size: 40.0,
                icon: Icons.more_vert,
                onPress: () {},
              )
            ],
          )),
    );
  }
}
