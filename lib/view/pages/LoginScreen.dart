import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/controller/LoginController.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/gradients.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/dimens.dart';
import 'package:kmello/view/widgets/LargeTextButton.dart';
import '../widgets/WaveWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colores.primaryBackground,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height - 100,
            color: Colores.primaryBackground,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: Hero(
                tag: 'waves-1',
                child: WaveWidget(
                  size: size,
                  yOffset: size.height * 0.95,
                  color: null,
                  gradient: Gradients.wavesGradient,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.0),
                        Center(
                            child: Hero(
                                tag: 'logo',
                                child: Image.asset("assets/iso_kmello.png"))),
                        SizedBox(height: 40.0),
                        Text('Iniciar Sesión', style: TextStyles.titleStyle),
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: this._loginController.usernameController,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: "Username"),
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: this._loginController.passwordController,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: "Password"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Olvidaste tu contraseña?",
                                    textAlign: TextAlign.right,
                                    style: TextStyles.forgotPassStyle,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Center(
                          child: LargeTextButton(
                            colorButton: Colores.primary,
                            text: "Ingresar",
                            onPress: () {},
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 40.0, bottom: 30.0),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Aún no tienes cuenta? ',
                                              style: TextStyles.signUpNowStyle),
                                          TextSpan(
                                              text: 'Regístrate',
                                              style:
                                                  TextStyles.signUpNowBoldStyle)
                                        ],
                                      ),
                                    )))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/google.svg",
                                width: 30.0,
                                height: 30.0,
                                color: Colores.tertiary),
                            SizedBox(width: 20),
                            SvgPicture.asset("assets/facebook.svg",
                                width: 30.0,
                                height: 30.0,
                                color: Colores.tertiary)
                          ],
                        ),
                      ]))),
        ],
      ),
    );
  }
}
