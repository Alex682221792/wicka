import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmello/model/MenuItem.dart';

class MainTabBarController extends GetxController {
  var items = List<MenuItem>().obs;

  void loadMenu() {
    items.clear();
    items.add(MenuItem(
        id: "opt_0", label: "Perfil", icon: Icons.person, isMain: false));
    items.add(MenuItem(
        id: "opt_1", label: "Cliente", icon: Icons.face, isMain: false));
    items.add(MenuItem(
        id: "opt_4",
        label: "Configuraciones",
        icon: Icons.settings,
        isMain: true));
    items.add(MenuItem(
        id: "opt_2", label: "Kmellador", icon: Icons.handyman, isMain: false));
    items.add(MenuItem(
        id: "opt_3",
        label: "Balance",
        icon: Icons.attach_money,
        isMain: false));
    update();
  }
}
