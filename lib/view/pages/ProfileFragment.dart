import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/controller/ProfileController.dart';
import 'package:kmello/enums/ButtonStyleEnum.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/dimens.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/widgets/CircleButton.dart';
import 'package:kmello/view/widgets/CornerRadiusImage.dart';
import 'package:kmello/view/widgets/LargeTextButton.dart';
import 'package:kmello/view/widgets/Section.dart';

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
        Form(
            key: _formKey,
            child: Section(title: Strings.basicInfo, children: [
              TextFormField(
                  keyboardType: TextInputType.name,
                  controller: this._loginController.nameController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration:
                      Decorations.basicInputDecoration(label: Strings.name)),
              SizedBox(height: Dimens.spaceBetweenFields),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: this._loginController.dniController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration:
                      Decorations.basicInputDecoration(label: Strings.dni)),
              SizedBox(height: Dimens.spaceBetweenFields),
              TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: this._loginController.phoneController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration:
                      Decorations.basicInputDecoration(label: Strings.phone)),
              SizedBox(height: Dimens.spaceBetweenFields)
            ])),
        LargeTextButton(
            text: "Completar perfil Kmellador",
            onPress: () {},
            colorButton: Colores.tertiary,
            buttonStyle: ButtonStyleEnum.OUTLINE)
      ],
    );
  }
}
