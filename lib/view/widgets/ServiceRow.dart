import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wicka/model/ServicePrice.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/BasicActions.dart';
import 'package:wicka/view/widgets/CircleButton.dart';

class ServiceRow extends StatefulWidget {
  Color background;
  ServicePrice servicePrice;
  bool showPrice;
  void Function(String) onDeleteItem;

  ServiceRow(
      {this.background, this.servicePrice, this.showPrice, this.onDeleteItem});

  @override
  _ServiceRowState createState() => new _ServiceRowState(
      background: this.background,
      servicePrice: this.servicePrice,
      showPrice: this.showPrice,
      onDeleteItem: this.onDeleteItem);
}

class _ServiceRowState extends State<ServiceRow> {
  Color background;
  ServicePrice servicePrice;
  bool showPrice;
  String newValue = "0";
  void Function(String) onDeleteItem;

  _ServiceRowState(
      {this.background, this.servicePrice, this.showPrice, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: ObjectKey(servicePrice),
        onTap: () {
          if (this.showPrice)
            showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                backgroundColor: Colores.primaryBackground,
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: IntrinsicHeight(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Colors.white,
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(this.servicePrice.name,
                                            style: TextStyles.titleStyle),
                                        Divider(
                                          height: 2.0,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: TextField(
                                              autofocus: false,
                                              controller: TextEditingController(
                                                  text: this.newValue !=
                                                          this
                                                              .servicePrice
                                                              .price
                                                              .toString()
                                                      ? this.newValue
                                                      : this
                                                          .servicePrice
                                                          .price
                                                          .toString()),
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      decimal: true),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                        r'^\d+\.?\d{0,2}')),
                                              ],
                                              onChanged: (value) {
                                                this.newValue = value;
                                              },
                                              decoration: InputDecoration(
                                                labelText: "Costo/Hora",
                                                suffixIcon:
                                                    Icon(Icons.monetization_on),
                                              ),
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            BasicActionsButton(
                                              onStepContinue: () {
                                                setState(() {
                                                  this.servicePrice.price =
                                                      double.parse(
                                                          this.newValue);
                                                });
                                                Navigator.pop(context);
                                              },
                                              onStepCancell: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        )
                                      ]))),
                        ),
                      ),
                    ),
                  );
                });
        },
        child: Container(
            color: this.background,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Text(this.servicePrice.name,
                        style: TextStyles.normalStyle)),
                if (this.showPrice)
                  Expanded(
                      child: Text("\$${this.servicePrice.price}",
                          style: TextStyles.normalStyle)),
                CircleButton(
                    icon: Icons.delete_forever,
                    size: 35.0,
                    colorButton: Colores.error,
                    colorIcon: Colors.white,
                    onPress: () {
                      setState(() {
                        this.onDeleteItem(this.servicePrice.id);
                      });
                    })
              ],
            )));
  }
}
