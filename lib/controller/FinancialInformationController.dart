import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FinancialInformationController extends GetxController {
  String bankId;
  String accountTypeId;
  TextEditingController accountNumberCtrl;
  TextEditingController dniOwnerCtrl;
  TextEditingController nameOwnerCtrl;

  @override
  void onInit() {
    accountNumberCtrl = TextEditingController();
    dniOwnerCtrl = TextEditingController();
    nameOwnerCtrl = TextEditingController();
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
    accountNumberCtrl?.dispose();
    dniOwnerCtrl?.dispose();
    nameOwnerCtrl?.dispose();
    super.onClose();
  }
}
