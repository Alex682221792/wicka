import 'package:flutter/cupertino.dart';

class ValidatorsUtils {
  static bool areFilledFields(List<TextEditingController> fields) {
    var flag = true;
    fields.forEach((field) {
      if (field.text.trim().isEmpty) {
        flag = false;
      }
    });
    return flag;
  }
}
