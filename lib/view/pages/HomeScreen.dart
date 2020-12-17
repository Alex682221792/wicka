import 'package:flutter/material.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/view/pages/ProfileFragment.dart';
import 'package:kmello/view/widgets/BottomTabBar.dart';
import 'package:kmello/view/widgets/MainTabBar.dart';
import 'package:kmello/view/widgets/Section.dart';
import 'package:kmello/view/widgets/TopBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
                margin: EdgeInsets.only(top: 60.0), child: ProfileFragment()),
            BottomTabBar(),
            TopBar()
          ],
        ));
  }
}
