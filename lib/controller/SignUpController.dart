import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wicka/logic/SignUpLogic.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/resources/values/colors.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/ValidatorsUtils.dart';
import 'package:wicka/view/pages/HomeScreen.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  void sendRegister() async {
    if (!validateForm()) {
      return;
    }
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var user = User(
        email: emailController.text,
        name: usernameController.text,
        password: passwordController.text);
    SignUpLogic().createAccount(
      client: user,
      onSuccess: () {
        Get.back();
        Get.off(HomeScreen());
      },
      onFailure: () {
        Get.back();
        Get.dialog(Center(child: Text("Error")), barrierDismissible: true);
      },
    );
  }

  bool validateForm() {
    if (!ValidatorsUtils.areFilledFields(
        [emailController, passwordController, usernameController])) {
      errorSnackbar(msg: Strings.requiredFields);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      errorSnackbar(msg: Strings.emailBadFormat);
      return false;
    }
    return true;
  }

  void errorSnackbar({@required String msg}) {
    return Get.snackbar(Strings.errorHint, '$msg',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colores.error,
        colorText: Colors.white,
        duration: Duration(seconds: 5));
  }

  @override
  void onClose() {
    usernameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
