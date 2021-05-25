import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/ProfileController.dart';
import 'package:wicka/enums/ButtonStyleEnum.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/fragments/AddressListFragment.dart';
import 'package:wicka/view/pages/PaymentMethodScreen.dart';
import 'package:wicka/view/widgets/CircleButton.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

import '../../utils/GeneralUtils.dart';

class ProfileFragment extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ProfileController _loginController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: FutureBuilder<User>(
          future: SessionUserSP().getLoggedUser(),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                Stack(children: [
                  CornerRadiusImage(
                      size: 90.0, radiusCorner: 45.0, url: snapshot.data.photo),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleButton(
                          onPress: () {},
                          icon: Icons.edit,
                          colorIcon: Colors.white,
                          colorButton: Colores.secondary,
                          size: 30.0))
                ]),
                SizedBox(height: 5),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colores.alternativeBackground,
                  child: Column(
                    children: [
                      Text(snapshot.data.name, style: TextStyles.headerStyle),
                      Text(snapshot.data.email.toLowerCase(),
                          style: TextStyles.subHeaderStyle)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                    child: Text("Forma de pago", style: TextStyles.headerStyle),
                    width: MediaQuery.of(context).size.width - 10.0),
                GestureDetector(
                  child: Container(
                    margin:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    height: 50.0,
                    padding: EdgeInsets.all(10.0),
                    decoration: Decorations.getCustomDecoration(
                        color: GeneralUtils().getRandomColor(),
                        cornerRadius: null),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.credit_card, color: Colores.tertiary),
                        Expanded(
                            child: Text("1444-XXXX-XXXX-2256",
                                style: TextStyles.headerStyle)),
                        //Container(child: Text("ALEXANDER NUNEZ B", style: TextStyles.superTitleStyle), width: (MediaQuery.of(context).size.width - 80.0), margin: EdgeInsets.symmetric(vertical: 10.0)),
                        Container(
                            child:
                            Text("07/22", style: TextStyles.subHeaderStyle),
                            width: (80.0),
                            alignment: Alignment.centerRight)
                      ],
                    ),
                  ),
                  onTap: () {
                    openPaymentMethodScreen(context);
                  },
                ),
                FlatButton(
                    onPressed: () {
                      openPaymentMethodScreen(context);
                    },
                    child: Center(
                        child: Text(Strings.addPaymentMethodTitle,
                            style: TextStyles.tableHeadStyle))),
                SizedBox(height: 20),
                SizedBox(
                    child:
                    Text(Strings.myAddress, style: TextStyles.headerStyle),
                    width: MediaQuery.of(context).size.width - 10.0),
                AddressListFragment()
              ],
            );
          }),
    ));
  }

  void openPaymentMethodScreen(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => PaymentMethodScreen(percentHeightScreen: 1.0));
  }
}
