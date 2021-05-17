import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/AddressController.dart';
import 'package:wicka/enums/ButtonStyleEnum.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/model/PaymentMethod.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/pages/AddressScreen.dart';
import 'package:wicka/view/pages/PaymentMethodScreen.dart';
import 'package:wicka/view/widgets/ItemMenuWidget.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

class AddressListFragment extends StatefulWidget {
  @override
  AddressListFragmentState createState() => AddressListFragmentState();
}

class AddressListFragmentState extends State<AddressListFragment> {
  AddressController _addressController = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _addressController.getListAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Container(
            height:
                double.parse((_addressController.items.length * 60).toString()),
            child: ListView.builder(
              itemCount: _addressController.items.length,
              itemBuilder: (context, index) =>
                  SizedBox()
                  // renderAddressRow(_addressController.items[index]),
            )),
        if (_addressController.items.length < 3)
          FlatButton(
              onPressed: () {
                openAddAddress(context);
              },
              child: Center(
                  child: Text(Strings.addressTitle,
                      style: TextStyles.tableHeadStyle)))
      ]),
    );
  }

  void openAddAddress(BuildContext context) {
    Get.to(AddressScreen(height: MediaQuery.of(context).size.height));
  }

  Widget renderAddressRow(PaymentMethod paymentMethod) {
    var color = GeneralUtils().getRandomColorWithAlpha(alpha: 0.05);
    return Dismissible(
        key: Key(paymentMethod.id),
        onDismissed: (direction) {},
        direction: DismissDirection.startToEnd,
        background: Container(
            padding: EdgeInsets.all(10.0),
            color: Colores.alternativeBackground,
            child: Center(
              child: Row(children: [
                Icon(
                  Icons.delete,
                  color: Colores.error,
                ),
                Text("Eliminar", style: TextStyles.normalStyle)
              ]),
            )),
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            height: 50.0,
            padding: EdgeInsets.all(10.0),
            decoration: Decorations.getCustomDecoration(
                color: GeneralUtils().getRandomColor(), cornerRadius: null),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.credit_card, color: Colores.tertiary),
                    Expanded(
                        child: Text(paymentMethod.alias,
                            style: TextStyles.headerStyle)),
                    Container(
                        child: Text(
                            "${paymentMethod.expiryMonth}/${paymentMethod.expiryYear}",
                            style: TextStyles.subHeaderStyle),
                        width: (80.0),
                        alignment: Alignment.centerRight)
                  ],
                ),
                if(paymentMethod.isPrincipal)
                Text(
                    Strings.principalPaymentMethod,
                    style: TextStyles.headerStyle)
              ],
            ),
          ),
          onTap: () {
            openPaymentMethodScreen(context);
          },
        ));
  }

  void openPaymentMethodScreen(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => PaymentMethodScreen(percentHeightScreen: 1.0));
  }
}
