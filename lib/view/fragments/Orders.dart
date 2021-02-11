import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/Category.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/HorizontalSlider.dart';
import 'package:wicka/view/widgets/NormalCard.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              height: 40,
              child: Text("Mis órdenes",
                  style: TextStyles.headerStyle),
            ),
            Expanded(child:
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  this.rowValue("label", "value"),
                  this.rowValue("label", "value"),
                  this.rowValue("label", "value")

                ],
              )
            )
          ],
        ));
  }

  Widget rowValue(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: Decorations.counterBarShadow,
      height: 60,
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyles.headerStyle)),
            Container(
                alignment: Alignment.centerRight,
                child: Text(value, style: TextStyles.subHeaderStyle))
          ],
        ));
  }
}