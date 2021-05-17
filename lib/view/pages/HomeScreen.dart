import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/MainTabBarController.dart';
import 'package:wicka/model/MenuItem.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/utils/GeneralUtils.dart';
import 'package:wicka/view/fragments/Finder.dart';
import 'package:wicka/view/fragments/MyCart.dart';
import 'package:wicka/view/widgets/BottomTabBar.dart';
import 'package:wicka/view/widgets/TopBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {
  final MainTabBarController _controller = Get.put(MainTabBarController());

  @override
  void initState() {
    _controller.loadMenu();
  }

  @override
  Widget build(BuildContext context) {
    print("height: ${WidgetsBinding.instance.window.physicalSize.height}");
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colores.primaryBackground,
        body: SafeArea(
            child: Stack(alignment: AlignmentDirectional.topStart, children: [
              // SizedBox(height: WidgetsBinding.instance.window.physicalSize.height),
              Obx(() => Container(
                  // height: 580.0,
                  // height: WidgetsBinding.instance.window.physicalSize.height * 0.5,
                  margin: EdgeInsets.only(top: _controller.menuOptionActive.value ? 0.0 : 40.0),
                  child:  _controller.chosenOption() == null
                      ? SizedBox()
                      : _controller.chosenOption().widget)),
              BottomTabBar(controller: this._controller),
              Obx(() =>
              _controller.menuOptionActive.value ? SizedBox() : TopBar()
              )
            ])
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


class ResponsiveApp {
  static MediaQueryData _mediaQueryData;

  MediaQueryData get mq => _mediaQueryData;

  static void setMq(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }
}