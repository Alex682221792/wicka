import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/FinderController.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';
import 'package:wicka/view/widgets/ProductViewer.dart';

class DailySuggestion extends StatefulWidget {
  @override
  State createState() {
    return DailySuggestionState();
  }
}

class DailySuggestionState extends State<DailySuggestion> {
  final FinderController _controller = Get.find();
  Future<List<Product>> suggestionList;

  @override
  void initState() {
    suggestionList = _controller.getDailySuggestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(Strings.dailySuggestion,
                  style: TextStyles.sliderTitleStyle)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 200.0,
            child: FutureBuilder<List<Product>>(
                // Initialize FlutterFire
                future: suggestionList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(Strings.generalError);
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ...snapshot.data
                            .map((product) => this.renderItem(product))
                      ],
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Widget renderItem(Product product) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        width: 160.0,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              IgnorePointer(
                  child: CornerRadiusImage(
                      size: 125,
                      radiusCorner: 63,
                      url: product.photo,
                      ableOnTap: false),
                  ignoring: true),
              SizedBox(height: 5.0),
              Text(product.name, style: TextStyles.headerStyle)
            ])),
      ),
      onTap: () {
        Get.to(ProductViewer(product: product));
      },
    );
  }
}
