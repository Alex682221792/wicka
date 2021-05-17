import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';

class BaseController extends GetxController {
  void errorSnackbar({@required String msg}) {
    return Get.snackbar(Strings.errorHint, '$msg',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colores.error,
        colorText: Colors.white,
        duration: Duration(seconds: 5));
  }

  void showDialog(){
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  void hideDialog(){
    Get.back();
  }
}
