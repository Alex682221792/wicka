import 'package:flutter/cupertino.dart';

class MenuItem {
  IconData icon;
  String label;
  String id;
  bool isMain;
  bool isSelected;
  Widget widget;

  MenuItem(
      {this.id,
      this.label,
      this.icon,
      this.isMain,
      this.isSelected = false,
      this.widget});
}
