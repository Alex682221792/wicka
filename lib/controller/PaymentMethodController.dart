import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wicka/controller/BaseController.dart';

class PaymentMethodController extends BaseController {
  TextEditingController cardNumber;
  TextEditingController expiryDate;
  TextEditingController cardHolderName;
  TextEditingController cvvCode;
  RxBool isCvvFocused = false.obs;

  @override
  void onInit() {
    cardNumber = TextEditingController();
    expiryDate = TextEditingController();
    cardHolderName = TextEditingController();
    cvvCode = TextEditingController();
    super.onInit();
  }

}
