import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wicka/logic/base/Constants.dart';
import 'package:wicka/model/Catalog.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';

class NormalCard extends StatelessWidget {
  Catalog category;

  NormalCard(this.category);

  final double heightItem = 120.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            alignment: AlignmentDirectional.centerEnd,
            height: heightItem,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: heightItem,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Hero(
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/logo_wicka.png',
                          width: MediaQuery.of(context).size.width * 0.4,
                          fit: BoxFit.cover,
                          image: this
                              .category
                              .config
                              .firstWhere((element) =>
                          element.label == Constants.urlParam)
                              .value),
                      tag: category.id,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        // color: Colores.primaryBackground,
                        //gradient: Gradients.darkGradientBottom,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: heightItem,
                      width: MediaQuery.of(context).size.width * 0.5),
                ],
              ),
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          alignment: AlignmentDirectional.centerStart,
          height: heightItem,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colores.alternativeBackground,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            height: heightItem,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(this.category.name, style: TextStyles.headerStyle),
                Text(this.category.detail.toString())
              ],
            ),
          ),
        ),
        Positioned(
          child: Text("Ver más", style: TextStyles.subHeaderStyle),
          width: MediaQuery.of(context).size.width * 0.6,
          height: 30.0,
          bottom: 3.0,
          left: 15.0,
        )
      ],
    );
  }
}
