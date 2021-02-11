import 'package:flutter/material.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/CircleButton.dart';

class ItemCart extends StatelessWidget {
  Product product;

  ItemCart({this.product});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colores.border, width: 1.0))),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        height: 100.0,
        width: width,
        child: Row(
          children: [
            FadeInImage.assetNetwork(
                placeholder: 'assets/logo_wicka.png',
                width: width * 0.2,
                height: 80.0,
                fit: BoxFit.cover,
                image: this.product.photo),
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    height: 80.0,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(children: [
                      Text(this.product.name, style: TextStyles.normalStyle),
                      SizedBox(height: 5.0),
                      Text(
                        "\$22",
                        style: TextStyles.headerStyle,
                      )
                    ]))),
            Container(
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
                height: 90.0,
                width: 30.0,
                child: Column(
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.add, size: 15.0),
                        ),
                        flex: 1),
                    Text(
                      "99",
                      style: TextStyles.headerStyle,
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.remove, size: 15.0),
                        ),
                        flex: 1),
                  ],
                ))
          ],
        ));
  }
}
