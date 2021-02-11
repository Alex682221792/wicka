import 'package:flutter/material.dart';
import 'package:wicka/model/KmelloPost.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/utils/FormatUtils.dart';

class KmelloPostItem extends StatelessWidget {
  KmelloPost kmelloInfo;

  KmelloPostItem({this.kmelloInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
            color: Colores.alternativeBackground,
            border: BorderDirectional(
                start: BorderSide(color: Colores.secondary, width: 3.0))),
        child: Column(children: [
          Padding(
              padding: Dimens.padding10_5,
              child: Row(children: [
                Expanded(
                    flex: 8,
                    child: Text(this.kmelloInfo.title,
                        style: TextStyles.labelViewTitleStyle)),
                Expanded(
                    flex: 1,
                    child: Text("\$${this.kmelloInfo.budget}",
                        style: TextStyles.tableHeadStyle))
              ])),
          Padding(
            padding: Dimens.padding10_5,
            child: Row(children: [
              Text(
                this.kmelloInfo.description,
                style: TextStyles.normalStyle,
              )
            ]),
          ),
          Padding(
              padding: Dimens.padding10_5,
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Row(children: [
                      Icon(Icons.calendar_today, size: 20.0),
                      Text(FormatUtils.toShortDateString(
                          this.kmelloInfo.startDate))
                    ])),
                if (this.kmelloInfo.status == null)
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        Icon(Icons.handyman, size: 20.0),
                        Text("Servicio")
                      ])),
                if (this.kmelloInfo.status != null)
                  Expanded(
                      flex: 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.adjust, size: 20.0),
                            Text("Status")
                          ]))
              ]))
        ]));
  }
}
