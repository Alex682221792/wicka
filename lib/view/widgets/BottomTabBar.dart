import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/controller/MainTabBarController.dart';
import 'package:kmello/model/MenuItem.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/values/colors.dart';
import 'package:kmello/view/widgets/CircleButton.dart';

class BottomTabBar extends StatelessWidget {
  final MainTabBarController _controller = Get.put(MainTabBarController());

  @override
  Widget build(BuildContext context) {
    _controller.loadMenu();
    return Positioned(
        height: 60.0,
        bottom: 0.0,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  decoration: Decorations.tabBarShadow)),
          Container(
            height: 60.0,
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.items.length,
                  itemBuilder: (context, index) =>
                      renderMenuItem(_controller.items[index], context),
                )),
          )
        ]));
  }

  Widget renderMenuItem(MenuItem item, BuildContext context) {
    if (item.isMain) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / _controller.items.length,
          child: CircleButton(
              size: 60.0,
              onPress: () {},
              colorButton: Colores.primaryBackground,
              colorIcon: Colores.primary,
              icon: Icons.local_fire_department));
    } else {
      return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              height: 40.0,
              width:
                  MediaQuery.of(context).size.width / _controller.items.length,
              child: FlatButton(
                  onPressed: () {},
                  child: Icon(item.icon, color: Colors.white))));
    }
  }
}
