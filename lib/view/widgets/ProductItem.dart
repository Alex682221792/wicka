import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';
import 'package:wicka/view/widgets/ProductViewer.dart';

class ProductItem extends StatelessWidget {
  Product product;

  ProductItem(Product product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    var sizeSubstringDesc =
        product.description.length >= 30 ? 30 : product.description.length;
    return GestureDetector(
      child: Card(
          color: Colores.alternativeBackground,
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radiusGeneral),
          ),
          child: Row(
            children: [
              Padding(
                  padding: Dimens.padding10_5,
                  child: IgnorePointer(
                      ignoring: true,
                      child: CornerRadiusImage(
                          url: product.photo,
                          radiusCorner: Dimens.radiusGeneral,
                          size: Dimens.heightProductImages,
                          ableOnTap: false))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: TextStyles.headerStyle),
                          Text(
                              product.description.substring(0, sizeSubstringDesc),
                              style: TextStyles.subHeaderStyle)
                        ],
                      ))),
              Padding(
                padding: Dimens.padding10_5,
                child: Center(
                    child: Text("\$${product.price.toStringAsFixed(2)}",
                        style: TextStyles.primaryTextBold)),
              )
            ],
          )),
      onTap: (){Get.to(ProductViewer(product: product));},
    );
  }
}
