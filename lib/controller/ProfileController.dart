import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController;
  TextEditingController dniController;
  TextEditingController emailController;
  TextEditingController phoneController;

  @override
  void onInit() {
    nameController = TextEditingController();
    dniController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  void updateProfile() async {
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
    nameController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    dniController?.dispose();
    super.onClose();
  }
}
