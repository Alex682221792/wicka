import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/resources/values/strings.dart';
import 'package:kmello/view/pages/HomeScreen.dart';
import 'package:kmello/view/pages/LoginScreen.dart';
import 'package:kmello/view/pages/SignUpScreen.dart';
import 'package:kmello/view/pages/WizardWorkerScreen.dart';
import 'view/pages/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primaryColor: Colores.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WizardWorkerScreen(),
    );
  }
}
