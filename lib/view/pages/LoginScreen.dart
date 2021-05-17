import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/LoginController.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/dimens.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/view/pages/SignUpScreen.dart';
import 'package:wicka/view/widgets/ClipperSignIn.dart';
import 'package:wicka/view/widgets/LargeTextButton.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colores.primaryBackground,
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -0.0 : 0.0,
            child: ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colores.alternativeBackground,
                child: Image.asset(
                  "assets/bg_signin.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              clipper: ClipperSignIn(),
            ),
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
                        SizedBox(height: 10.0),
                        Center(
                            child: Hero(
                                tag: 'logo',
                                child: Image.asset("assets/logo_wicka.png",
                                    height: 150))),
                        SizedBox(height: 30.0),
                        Text(Strings.signIn, style: TextStyles.titleStyle),
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: this._loginController.emailController,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.email),
                        ),
                        SizedBox(height: Dimens.spaceBetweenFields),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: this._loginController.passwordController,
                          style: TextStyles.textFieldStyle,
                          cursorColor: Colores.primary,
                          decoration: Decorations.basicInputDecoration(
                              label: Strings.password),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    Strings.forgetPass,
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
                            text: Strings.enter,
                            onPress: () {
                              _loginController.signInEmailPassword();
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 40.0, bottom: 30.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.to(SignUpScreen());
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: Strings.notYetAccount,
                                              style: TextStyles.signUpNowStyle),
                                          TextSpan(
                                              text: Strings.register,
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
                            FlatButton(
                                color: Colores.alternativeBackground,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimens.radiusButtons),
                                    side:
                                        BorderSide(color: Colors.transparent)),
                                onPressed: () {
                                  _loginController.signInGoogle();
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/google.svg",
                                        width: 30.0,
                                        height: 30.0,
                                        color: Colores.error),
                                    SizedBox(width: 5),
                                    Text(Strings.continueGoogle)
                                  ],
                                )),
                            // GestureDetector(
                            //     onTap: () {
                            //       _loginController.apiLogin();
                            //     },
                            //     child: SvgPicture.asset("assets/google.svg",
                            //         width: 30.0,
                            //         height: 30.0,
                            //         color: Colores.tertiary)),
                            // SizedBox(width: 20),
                            // SvgPicture.asset("assets/facebook.svg",
                            //     width: 30.0,
                            //     height: 30.0,
                            //     color: Colores.tertiary)
                          ],
                        ),
                      ]))),
        ],
      ),
    );
  }
}
