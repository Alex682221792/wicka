import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/Category.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/HorizontalSlider.dart';
import 'package:wicka/view/widgets/NormalCard.dart';

import '../../resources/styles/gradients.dart';
import '../../utils/GeneralUtils.dart';
import '../widgets/ClipperSignIn.dart';
import '../widgets/ClipperSignUp.dart';
import '../widgets/ClipperWidget.dart';
import '../widgets/WaveWidget.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Stack(
          children: [
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                color: GeneralUtils().getRandomColorWithAlpha(alpha: 0.1),
                child: SizedBox(),
              ),
              clipper: ClipperSignUp(),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  height: 40,
                  child: Text("Mis órdenes", style: TextStyles.headerStyle),
                ),
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    this.rowValue("label", "statusvalue", "Esperando"),
                    this.rowValue("label", "status", "en camino"),
                    this.rowValue("label", "Status", "En camino")
                  ],
                ))
              ],
            )
          ],
        ));
  }

  Widget rowValue(String label, String value, String status) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: TextStyles.headerStyle),
                    Text(value, style: TextStyles.subHeaderStyle)
                  ],
                )),
                Container(
                    alignment: Alignment.centerRight,
                    child: Text(status, style: TextStyles.subHeaderStyle))
              ],
            )));
  }
}
