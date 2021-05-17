import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/MainTabBarController.dart';
import 'package:wicka/model/MenuItem.dart';
import 'package:wicka/resources/fonts/my_flutter_app_icons.dart';
import 'package:wicka/resources/styles/decorations.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/widgets/CircleButton.dart';

class BottomTabBar extends StatelessWidget {
  MainTabBarController controller = Get.find();

  BottomTabBar({this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: 60.0,
        bottom: 5.0,
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
                  key: Key(controller.items
                      .firstWhere((element) => element.isSelected)
                      .id),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) =>
                      renderMenuItem(controller.items[index], context),
                )),
          )
        ]));
  }

  Widget renderMenuItem(MenuItem item, BuildContext context) {
    if (item.isMain) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / controller.items.length,
          child: CircleButton(
              size: 60.0,
              onPress: () {
                this.controller.selectOption(item);
              },
              colorButton: Colores.primary,
              colorIcon: Colores.primaryBackground,
              icon: item.icon));
    } else {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: item.isSelected
                              ? Colores.primary
                              : Colors.transparent,
                          width: 2.0))),
              height: 40.0,
              width:
                  MediaQuery.of(context).size.width / controller.items.length,
              child: FlatButton(
                  onPressed: () {
                    this.controller.selectOption(item);
                  },
                  child: Icon(item.icon,
                      color: !item.isSelected
                          ? Colores.secondary
                          : Colores.primary))));
    }
  }

  MainTabBarController getController() {
    return this.controller;
  }
}
