import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/resources/styles/gradients.dart';
import 'package:kmello/resources/styles/text-styles.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/pages/LoginScreen.dart';
import '../widgets/WaveWidget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    this.goToLogin();

    return Scaffold(
      backgroundColor: Colors.white,
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
                tag: 'waves',
                child: WaveWidget(
                  size: size,
                  yOffset: size.height * 0.65,
                  color: null,
                  gradient: Gradients.wavesGradient,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(tag: 'logo', child: Image.asset("assets/logo_kmello.png"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210.0, right: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Center(
                    child: Text(
                  Strings.slogan,
                  style: TextStyles.sloganStyle,
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                  child: Text(Strings.signatureEncIdeas,
                      style: TextStyles.signatureEncIdeasStyle)),
              SizedBox(height: 30.0)
            ],
          )
        ],
      ),
    );
  }

  void goToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(LoginScreen());
    });
  }
}
