import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/resources/styles/text-styles.dart';

class HorizontalSlider extends StatelessWidget {
  String title;
  String description;

  HorizontalSlider({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(this.title, style: TextStyles.sliderTitleStyle)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 160.0,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Image.asset("assets/logo_wicka.png", height: 125),
                        SizedBox(height: 5.0),
                        Text("Item 1", style: TextStyles.headerStyle)
                      ])),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 160.0,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Image.asset("assets/logo_wicka.png", height: 125),
                        SizedBox(height: 5.0),
                        Text("Item 1", style: TextStyles.headerStyle)
                      ])),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                      color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 160.0,
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Image.asset("assets/logo_wicka.png", height: 125),
                        SizedBox(height: 5.0),
                        Text("Item 1", style: TextStyles.headerStyle)
                      ])),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
