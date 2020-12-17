import 'package:flutter/cupertino.dart';

class MenuItem {
  IconData icon;
  String label;
  String id;
  bool isMain;

  MenuItem({this.id, this.label, this.icon, this.isMain});
}
