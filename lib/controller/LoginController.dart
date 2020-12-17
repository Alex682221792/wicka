import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    /*Request request = Request(url: urlLogin, body: {
      'email': emailTextController.text,
      'password': passwordTextController.text
    });
    request.post().then((value) {
      Get.back();
      Get.offNamed('/homeView');
    }).catchError((onError) {});*/
  }

  @override
  void onClose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
