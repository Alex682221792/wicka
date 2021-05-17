import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wicka/enums/StatusPostEnum.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/model/Order.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/view/widgets/DailySuggestion.dart';
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
                    this.rowValue(Order(
                        date: "25 Oct 2021",
                        status: StatusOrderEnum.PENDING,
                        number: "39858")),
                    this.rowValue(Order(
                        date: "02 Abr 2021",
                        status: StatusOrderEnum.ON_THE_WAY,
                        number: "2858")),
                    this.rowValue(Order(
                        date: "02 Abr 2021",
                        status: StatusOrderEnum.COMPLETED,
                        number: "2858"))
                  ],
                ))
              ],
            )
          ],
        ));
  }

  Widget rowValue(Order order) {
    return Card(
        color: Colores.alternativeBackground,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radiusGeneral),
        ),
        child: IntrinsicHeight(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                   padding: EdgeInsets.all(10.0),
                child: Center(
              child: StatusOrderHelper().getIcon(order.status),
            )),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Orden #${order.number}",
                            style: TextStyles.headerStyle),
                        Text(StatusOrderHelper().getVal(order.status),
                            style: TextStyles.subHeaderStyle)
                      ],
                    ))),
            Column(children: [
              Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: Decorations.dateOrderStyle,
                  alignment: Alignment.centerRight,
                  child: Text(order.date, style: TextStyles.normalWhiteText))
            ])
          ],
        )));
  }
}
