import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wicka/api/services/UserAPI.dart';
import 'package:wicka/controller/BaseContoller.dart';
import 'package:wicka/logic/SignInLogic.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';
import 'package:wicka/utils/ValidatorsUtils.dart';
import 'package:wicka/view/pages/HomeScreen.dart';

class LoginController extends BaseController {
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

  void signInEmailPassword() async {
    if (!validateForm()) {
      return;
    }
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    SignInLogic().signIn(emailController.text, passwordController.text,
        () async {
      SessionUserSP().setLoggedUser(await UserAPI().getProfile());
      Get.back();
      Get.off(HomeScreen());
      errorSnackbar(msg: "Logged");
    }, () {
      Get.back();
      errorSnackbar(msg: Strings.errorHint);
    });
  }

  bool validateForm() {
    if (!ValidatorsUtils.areFilledFields(
        [emailController, passwordController])) {
      errorSnackbar(msg: Strings.requiredFields);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      errorSnackbar(msg: Strings.emailBadFormat);
      return false;
    }
    return true;
  }

  void signInGoogle() async {
    await SignInLogic().signInWithGoogle(() async {
      Get.back();
      Get.off(HomeScreen());
      errorSnackbar(msg: "Logged");
    }, () {
      Get.back();
      errorSnackbar(msg: Strings.errorHint);
    });
  }

  @override
  void onClose() {
    usernameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
