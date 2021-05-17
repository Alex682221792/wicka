import 'package:flutter/cupertino.dart';
import 'package:wicka/controller/BaseController.dart';
import 'package:wicka/logic/AddressLogic.dart';
import 'package:wicka/model/Address.dart';
import 'package:get/get.dart';
import 'package:wicka/model/embedded/Location.dart';
import 'package:wicka/resources/values/strings.dart';
import 'package:wicka/utils/ValidatorsUtils.dart';

class AddressController extends BaseController {
  var items = List<Address>().obs;
  var error = "".obs;

  //form fields new address
  TextEditingController alias;
  TextEditingController direction;
  TextEditingController reference;
  Location location;

  @override
  void onInit() {
    alias = TextEditingController();
    direction = TextEditingController();
    reference = TextEditingController();
    location = Location();
    direction.text = "prueba";
    super.onInit();
  }

  void getListAddress() async {
    showDialog();
    AddressLogic().getAddressList((List<Address> addressList) async {
      hideDialog();
      items.assignAll(addressList);
      items.refresh();
    }, () {
      hideDialog();
      error.value = Strings.generalError;
    });
  }

  void saveAddress(VoidCallback postSuccess) {
    if (!validForm()) {
      return;
    }

    showDialog();
    AddressLogic().createAddress(getAddressModel(), () {
      hideDialog();
      getListAddress();
      postSuccess();
    }, () {
      hideDialog();
      error.value = Strings.generalError;
    });
  }

  bool validForm() {
    if (!ValidatorsUtils.areFilledFields([alias, reference, direction])) {
      errorSnackbar(msg: Strings.requiredFields);
      return false;
    }
    if (!ValidatorsUtils.isValidLocation(location)) {
      errorSnackbar(msg: Strings.locationFields);
      return false;
    }
    return true;
  }

  Address getAddressModel() {
    return Address(
        alias: alias.text,
        reference: reference.text,
        direction: direction.text,
        latitude: location.latitude,
        longitude: location.longitude);
  }
}
