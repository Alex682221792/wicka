import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/FinderController.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/model/ProductIngredients.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/BasicBackButton.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';

class ProductViewer extends StatefulWidget {
  Product product;

  ProductViewer({this.product});

  @override
  State createState() {
    return ProductViewerState(product: this.product);
  }
}

class ProductViewerState extends State<ProductViewer> {
  Product product;
  int _counter = 1;

  ProductViewerState({this.product});

  FinderController _controller = Get.find();
  Future<List<ProductIngredients>> ingredientList;

  @override
  void initState() {
    super.initState();
    this.ingredientList =
        this._controller.getProductIngredients(this.product.id);
  }

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
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Dimens.radiusGeneral)),
                  child: Hero(
                      child: FadeInImage.assetNetwork(
                          // fit: BoxFit.cover,
                          placeholder: 'assets/logo_wicka.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.3,
                          image: this.product.photo),
                      tag: "image_${this.product.photo}")),
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
                    Text("\$" + product.price.toStringAsFixed(2),
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
                                    style: TextStyles.largeStyle)),
                            Row(
                              children: [
                                this.ingredientsList(context),
                                /*Container(
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
                                  ),*/
                                Container(
                                  height: 55.0,
                                  width: 55.0,
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
            this.counterPad(context),
            BasicBackButton(onPress: () {
              Get.back();
            })
          ],
        )));
  }

  Widget ingredientsList(BuildContext context) {
    return FutureBuilder<List<ProductIngredients>>(
        future: this.ingredientList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(Strings.generalError);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null || snapshot.data.isEmpty) {
              return Center(child: Text(Strings.emptyList));
            }
            return Container(
              width: MediaQuery.of(context).size.width - 70.0,
              height: 90.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data
                      .map((e) => this.ingredientItem(e))
                      .toList()),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget ingredientItem(ProductIngredients prodIngredients) {
    return Stack(
      children: [
        Badge(
            badgeColor: Colores.alternativeBackground,
            badgeContent: prodIngredients.count == prodIngredients.minimum
                ? SizedBox()
                : Text("+${prodIngredients.count}"),
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
                    CornerRadiusImage(
                        url: prodIngredients.ingredient.icon,
                        ableOnTap: false,
                        size: 30.0,
                        radiusCorner: Dimens.radiusGeneral),
                    SizedBox(height: 5.0),
                    Text(prodIngredients.ingredient.name,
                        style: TextStyles.normalStyle),
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
                        child: FlatButton(
                          // minWidth: 40.0,
                          // height: 30.0,
                            onPressed: (){decreaseIngredient(prodIngredients);},
                            child: Icon(Icons.remove,
                                color: Colores.tertiary, size: 15.0)),
                        flex: 1),
                    Expanded(
                        child: FlatButton(
                            // minWidth: 40.0,
                            // height: 30.0,
                            onPressed: (){increaseIngredient(prodIngredients);},
                            child: Icon(Icons.add,
                                color: Colores.tertiary, size: 15.0)),
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
                      onPressed: increaseProductCount,
                      child:
                          Icon(Icons.add, color: Colores.tertiary, size: 20.0)),
                  flex: 1),
              Expanded(
                  child: Container(
                      width: 50.0,
                      alignment: Alignment.center,
                      color: Colores.alternativeBackground,
                      child: Text(
                        this._counter.toString(),
                        style: TextStyles.headerStyle,
                      )),
                  flex: 1),
              Expanded(
                  flex: 1,
                  child: FlatButton(
                      minWidth: 40.0,
                      height: 30.0,
                      onPressed: decreaseProductCount,
                      child: Icon(Icons.remove,
                          color: Colores.tertiary, size: 20.0)))
            ],
          ),
        ),
        right: 10,
        top: (MediaQuery.of(context).size.width * 0.5) - 25);
  }

  void increaseProductCount() {
    setState(() {
      this._counter++;
      this.updatePrice();
    });
  }

  void decreaseProductCount() {
    setState(() {
      if (_counter == 1) {
        return;
      }
      this._counter--;
      this.updatePrice();
    });
  }

  void increaseIngredient(ProductIngredients ingredient) {
    setState(() {
      ingredient.count++;
    });
  }

  void decreaseIngredient(ProductIngredients ingredient) {
    setState(() {
      ingredient.count--;
    });
  }

  void updatePrice() {
    //todo recalculate price
  }
}
