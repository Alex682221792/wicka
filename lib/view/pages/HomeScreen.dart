import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/MainTabBarController.dart';
import 'package:wicka/model/MenuItem.dart';
import 'package:wicka/model/Product.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/view/fragments/Contracts.dart';
import 'package:wicka/view/fragments/Finder.dart';
import 'package:wicka/view/fragments/KmelloViewer.dart';
import 'package:wicka/view/fragments/MyCart.dart';
import 'package:wicka/view/fragments/ProfileFragment.dart';
import 'package:wicka/view/widgets/BottomTabBar.dart';
import 'package:wicka/view/widgets/MainTabBar.dart';
import 'package:wicka/view/widgets/ProductViewer.dart';
import 'package:wicka/view/widgets/Section.dart';
import 'package:wicka/view/widgets/TopBar.dart';

class HomeScreen extends StatelessWidget {
  final MainTabBarController _controller = Get.put(MainTabBarController());

  @override
  Widget build(BuildContext context) {
    _controller.loadMenu();
    return Scaffold(
        backgroundColor: Colores.primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height),
            Container(
                height: MediaQuery.of(context).size.height - 100.0,
                margin: EdgeInsets.only(top: 80.0),
                child: Obx(() => _controller.chosenOption() == null
                    ? SizedBox()
                    : _controller.chosenOption().widget)),
            BottomTabBar(controller: this._controller),
            TopBar()
          ],
        ));
  }

  Widget getOptionWidget(MenuItem item) {
    print(item.id);
    if (item.id == "opt_home") {
      return Finder();
    }
    if (item.id == "opt_cart") {
      return MyCart();
    }
    return SizedBox();
  }
}
