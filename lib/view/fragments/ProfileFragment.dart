import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/ProfileController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/widgets/CircleButton.dart';
import 'package:wicka/view/widgets/CornerRadiusImage.dart';

class ProfileFragment extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ProfileController _loginController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          CornerRadiusImage(
              size: 90.0,
              radiusCorner: 45.0,
              url:
                  "https://mk0ziglar4ifu5ixq7cx.kinstacdn.com/wp-content/uploads/2016/09/michelle-prince-profile-img.png"),
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
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          color: Colores.alternativeBackground,
          child: Column(
            children: [
              Text("Alexander", style: TextStyles.headerStyle),
              Text("alex.nb.92@hotmail.com", style: TextStyles.subHeaderStyle)
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(child: Text("Forma de pago", style: TextStyles.headerStyle), width: MediaQuery.of(context).size.width - 10.0),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          height: 50.0,
          padding: EdgeInsets.all(10.0),
          decoration: Decorations.getCustomDecoration(color: GeneralUtils().getRandomColor(), cornerRadius: null),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.credit_card, color: Colores.tertiary),
              Expanded(child:
              Text("1444-XXXX-XXXX-2256", style: TextStyles.headerStyle)),
              //Container(child: Text("ALEXANDER NUNEZ B", style: TextStyles.superTitleStyle), width: (MediaQuery.of(context).size.width - 80.0), margin: EdgeInsets.symmetric(vertical: 10.0)),
              Container(child: Text("07/22", style: TextStyles.subHeaderStyle), width: (80.0), alignment: Alignment.centerRight)
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(child: Text("Mis direcciones", style: TextStyles.headerStyle), width: MediaQuery.of(context).size.width - 10.0),
        this.renderAddressRow("-"),
        this.renderAddressRow("+")
      ],
    );
  }

  Widget renderAddressRow(String id){
    var color =  GeneralUtils().getRandomColor();
    return Dismissible(
      key: Key(id),
      onDismissed: (direction) {

      },
      direction: DismissDirection.startToEnd,
      background: Container(
          padding: EdgeInsets.all(10.0),
          color: Colores.alternativeBackground, 
          child: Center(
            child: Row(children: [Icon(Icons.delete, color: Colores.error,), Text("Eliminar", style: TextStyles.normalStyle)]),
      )),
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      height: 50.0,
      padding: EdgeInsets.all(10.0),
      decoration: Decorations.getCustomDecoration(color: color, cornerRadius: null),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: color.withAlpha(75)),
          SizedBox(width: 10.0),
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Casa", style: TextStyles.headerStyle),
            Text("Calle a y callejon b", style: TextStyles.subHeaderStyle)
          ],)),
        ],
      ),
    ));
  }
}
