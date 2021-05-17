import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/AddressController.dart';
import 'package:wicka/enums/ButtonStyleEnum.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/pages/AddressScreen.dart';
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
                  renderAddressRow(_addressController.items[index]),
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

  Widget renderAddressRow(Address address) {
    var color = GeneralUtils().getRandomColorWithAlpha(alpha: 0.05);
    return Dismissible(
        key: Key(address.id),
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
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: color.withAlpha(75)),
                SizedBox(width: 10.0),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.alias, style: TextStyles.headerStyle),
                    Text(address.direction, style: TextStyles.subHeaderStyle)
                  ],
                )),
              ],
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          color: color,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }
}
