import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/styles/text-styles.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';
import 'package:wicka/view/pages/HomeScreen.dart';
import 'package:wicka/view/pages/LoginScreen.dart';
import '../widgets/WaveWidget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("splash build");
    final size = MediaQuery.of(context).size;
    // final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    this.goToLogin();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: Decorations.tabBarShadow,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                    tag: 'logo',
                    child: Image.asset("assets/logo_wicka_white.png"))
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
                  "",
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

  void goToLogin(){
    Future.delayed(const Duration(seconds: 2), () async {
      if(await SessionUserSP().isLoggedUser()){
        Get.off(HomeScreen());
      } else {
        Get.off(LoginScreen());
      }
    });
  }
}
