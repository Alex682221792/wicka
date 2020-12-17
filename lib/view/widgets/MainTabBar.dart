import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/controller/MainTabBarController.dart';
import 'package:kmello/model/MenuItem.dart';
import 'package:kmello/resources/styles/decorations.dart';
import 'package:kmello/resources/styles/gradients.dart';

class MainTabBar extends StatelessWidget {
  final MainTabBarController _controller = Get.put(MainTabBarController());

  @override
  Widget build(BuildContext context) {
    _controller.loadMenu();
    return Container(
      width: 50.0,
      height: MediaQuery.of(context).size.height,
      decoration: Decorations.tabBarShadow,
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() => ListView.builder(
                        itemCount: _controller.items.length,
                        itemBuilder: (context, index) =>
                            renderMenuItem(_controller.items[index]),
                      )))),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                SizedBox(height: 30.0),
                Image.network(
                    "https://image.freepik.com/vector-gratis/perfil-empresario-dibujos-animados_18591-58479.jpg",
                    height: 30.0,
                    width: 30.0),
                SizedBox(height: 10.0),
                Divider(height: 2.0, color: Colors.white)
              ])),
          Positioned(
              left: 10.0,
              bottom: 15.0,
              child: RotatedBox(
                  quarterTurns: -1,
                  child: Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        "assets/iso_kmello_white.png",
                        height: 30.0,
                      ))))
        ],
      ),
    );
  }

  Widget renderMenuItem(MenuItem item) {
    return FlatButton(
        onPressed: () {}, child: Icon(item.icon, color: Colors.white));
  }
}
