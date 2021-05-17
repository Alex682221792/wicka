import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/model/MenuItem.dart';
import 'package:wicka/view/fragments/Finder.dart';
import 'package:wicka/view/fragments/MyCart.dart';
import 'package:wicka/view/fragments/Orders.dart';
import 'package:wicka/view/fragments/ProfileFragment.dart';
import 'package:wicka/view/pages/MainMenuScreen.dart';

class MainTabBarController extends GetxController {
  var items = List<MenuItem>().obs;
  var menuOptionActive = false.obs;

  void loadMenu() {
    items.clear();
    print("loading data:::::");
    items.add(MenuItem(
        id: "opt_menu",
        label: "Menú",
        icon: Icons.menu,
        isMain: false,
        widget: MainMenuScreen()));
    items.add(MenuItem(
        id: "opt_profile",
        label: "Perfil",
        icon: Icons.person,
        isMain: false,
        widget: ProfileFragment()));
    items.add(MenuItem(
        id: "opt_home",
        label: "Home",
        icon: Icons.home,
        isMain: true,
        isSelected: true,
        widget: Finder()));
    items.add(MenuItem(
        id: "opt_history",
        label: "Mis Pedidos",
        icon: Icons.fact_check,
        isMain: false,
        widget: Orders()));
    items.add(MenuItem(
        id: "opt_cart",
        label: "Carrito",
        icon: Icons.shopping_cart,
        isMain: false,
        widget: MyCart()));
    update();
  }

  void selectOption(MenuItem item) {
    print("select option:::::");
    this.items.forEach((element) {
      element.isSelected = false;
    });
    var index = this.items.indexOf(item);
    this.items[index].isSelected = true;
    items.refresh();
    menuOptionActive.value = item.id == "opt_menu";
    menuOptionActive.refresh();
  }

  MenuItem chosenOption() {
    print("chosen option:::::");
    return this
        .items.value
        .firstWhere((element) => element.isSelected, orElse: () => null);
  }
}
