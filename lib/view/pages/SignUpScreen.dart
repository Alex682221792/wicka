import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/LoginController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/gradients.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/view/widgets/BasicBackButton.dart';
import 'package:wicka/view/widgets/ClipperSignUp.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

class SignUpScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Stack(children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(gradient: Gradients.wavesGradient),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Center(
                        child: Hero(
                            tag: 'logo',
                            child: Image.asset("assets/iso_kmello_white.png")))
                  ],
                ),
              ),
              clipper: ClipperSignUp(),
            ),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (keyboardOpen)
                  Center(child: Image.asset("assets/iso_kmello.png")),
                SizedBox(
                    height: Dimens.spaceBetweenFields *
                        (keyboardOpen ? 1.75 : 3.5)),
                Text('Crear cuenta', style: TextStyles.titleStyle),
                SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: this._loginController.usernameController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration: Decorations.basicInputDecoration(label: "Nombre"),
                ),
                SizedBox(height: Dimens.spaceBetweenFields),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: this._loginController.usernameController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration: Decorations.basicInputDecoration(label: "Email"),
                ),
                SizedBox(height: Dimens.spaceBetweenFields),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: this._loginController.passwordController,
                  style: TextStyles.textFieldStyle,
                  cursorColor: Colores.primary,
                  decoration:
                      Decorations.basicInputDecoration(label: "Contraseña"),
                ),
                SizedBox(
                  height: Dimens.spaceBetweenFields,
                ),
                Center(
                  child: LargeTextButton(
                    colorButton: Colores.primary,
                    text: "Registrarme",
                    onPress: () {},
                  ),
                )
              ],
            ),
          )),
          BasicBackButton(onPress: () {})
        ]));
  }
}
