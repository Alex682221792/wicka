import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';

class ProductViewer extends StatelessWidget {
  Product product;

  ProductViewer({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height),
              this.circle(context, 0.975, 0.35),
              this.circle(context, 0.8, 0.35),
              Positioned(
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/logo_wicka.png',
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    image: this.product.photo),
                left: MediaQuery.of(context).size.width * 0.25,
                top: (MediaQuery.of(context).size.height * 0.2) -
                    (MediaQuery.of(context).size.width * 0.0),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.0),
                      Text(product.name, style: TextStyles.headerStyle),
                      Text(product.description, style: TextStyles.normalStyle),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.45),
                      Text("\$" + product.price.toString(),
                          style: TextStyles.productPriceTitleStyle),
                      SizedBox(height: 20.0),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 3.0),
                                  child: Text("Ingredientes",
                                      style: TextStyles.normalStyle)),
                              Row(
                                children: [
                                  this.ingredientsList(context),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    padding: EdgeInsets.symmetric(vertical: 6.0),
                                    decoration: Decorations.counterBarShadow,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Icon(Icons.add),
                                            Text("Extra",
                                                style: TextStyles.subHeaderStyle)
                                          ],
                                        )),
                                  ),
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    padding: EdgeInsets.symmetric(vertical: 6.0),
                                    decoration: Decorations.addToCarButtonShadow,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            Icon(Icons.add_shopping_cart,
                                                color: Colores.primaryBackground),
                                            Text("Listo",
                                                style: TextStyles.addButtonStyle)
                                          ],
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                  child: Text("Extras: \$0.10",
                                      style: TextStyles.headerStyle))
                            ],
                          )),
                    ],
                  )),
              this.counterPad(context)
            ],
          )
        ));
  }

  Widget ingredientsList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 120.0,
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          this.ingredientItem(),
          this.ingredientItem(),
          this.ingredientItem(),
          this.ingredientItem()
        ],
      ),
    );
  }

  Widget ingredientItem() {
    return Stack(
      children: [
        Badge(
            badgeColor: Colores.alternativeBackground,
            badgeContent: Text("+3"),
            // badgeContent: Icon(Icons.block),
            position: BadgePosition.topEnd(top: 0, end: 0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colores.alternativeBackground,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 2.0)
                  ],
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt()),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: 90.0,
              height: 90.0,
              child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Column(children: [
                    Image.asset("assets/logo_wicka.png", height: 30),
                    SizedBox(height: 5.0),
                    Text("Item 1", style: TextStyles.normalStyle),
                  ])),
            )),
        Positioned(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                    color: Colores.primaryBackground,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colores.border,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0)
                    ]),
                height: 25.0,
                width: 90.0,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.remove, size: 15.0),
                        ),
                        flex: 1),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.add, size: 15.0),
                        ),
                        flex: 1),
                  ],
                )),
            left: 0.0,
            bottom: 2.0),
      ],
    );
  }

  Widget circle(BuildContext context, double percentWidthSize, double top) {
    return Container(
      margin: EdgeInsets.only(
          left:
              MediaQuery.of(context).size.width * ((1 - percentWidthSize) / 2),
          top: (MediaQuery.of(context).size.height * top) -
              (MediaQuery.of(context).size.width * (percentWidthSize / 2))),
      decoration: Decorations.circleShadow(
          size: MediaQuery.of(context).size.width * percentWidthSize),
      height: MediaQuery.of(context).size.width * percentWidthSize,
      width: MediaQuery.of(context).size.width * percentWidthSize,
    );
  }

  Widget counterPad(BuildContext context) {
    return Positioned(
        child: Container(
          width: 50.0,
          height: 150.0,
          decoration: Decorations.counterBarShadow,
          child: Column(
            children: [
              Expanded(
                  child: FlatButton(
                      minWidth: 40.0,
                      height: 30.0,
                      onPressed: () {},
                      child:
                          Icon(Icons.add, color: Colores.tertiary, size: 20.0)),
                  flex: 1),
              Expanded(
                  child: Container(
                      width: 50.0,
                      alignment: Alignment.center,
                      color: Colores.alternativeBackground,
                      child: Text(
                        "1",
                        style: TextStyles.headerStyle,
                      )),
                  flex: 1),
              Expanded(
                  flex: 1,
                  child: FlatButton(
                      minWidth: 40.0,
                      height: 30.0,
                      onPressed: () {},
                      child: Icon(Icons.remove,
                          color: Colores.tertiary, size: 20.0)))
            ],
          ),
        ),
        right: 10,
        top: (MediaQuery.of(context).size.width * 0.5) - 25);
  }
}
