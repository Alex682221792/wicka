import 'package:flutter/cupertino.dart';
import 'package:wicka/model/embedded/Location.dart';

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

  static bool isValidLocation(Location location) {
    return location.latitude != null && location.longitude != null;
  }

}
