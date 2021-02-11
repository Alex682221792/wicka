import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/CircleButton.dart';
import 'package:wicka/view/widgets/ItemCart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              height: 210,
              decoration: Decorations.summaryOrder,
              child: Column(
                children: [
                  Container(
                      //color: Colores.alternativeBackground,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                  child: Text("Mi orden",
                                      style: TextStyles.whiteTextStyle))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.delete,
                                        color: Colores.primaryBackground,
                                      ))))
                        ],
                      )),
                  Divider(
                    color: Colores.primaryBackground,
                  ),
                  this.rowValue("Subtotal", "\$3.20"),
                  this.rowValue("IVA", "\$0.40"),
                  this.rowValue("Entrega a domicilio", "Gratis"),
                  this.rowValue("TOTAL", "\$3.60"),
                  SizedBox(
                      width: 200.0,
                      height: 40,
                      child: Container(
                          decoration: Decorations.tabBarShadow,
                          child: FlatButton(
                            child: Text("Pagar", style: TextStyles.headerStyle),
                            onPressed: () {},
                          )))
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 340,
                child:
                    ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png")),
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png")),
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png")),
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png")),
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png")),
                  ItemCart(
                      product: Product(
                          id: "",
                          name: "Producto",
                          description: "description",
                          photo:
                              "https://i2.wp.com/freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png"))
                ])),
          ],
        ));
  }

  Widget rowValue(String label, String value) {
    return Expanded(
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyles.whiteLightTextStyle)),
            Container(
                alignment: Alignment.centerRight,
                child: Text(value, style: TextStyles.whiteTextStyle))
          ],
        ),
        flex: 1);
  }
}
