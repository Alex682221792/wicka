import 'package:flutter/cupertino.dart';
import 'package:wicka/api/services/AddressAPI.dart';
import 'package:wicka/model/Address.dart';

class AddressLogic {
  var addressApi = AddressAPI();

  void getAddressList(Function onSuccess, VoidCallback onFailure) {
    addressApi.getAddressList().then((value) => onSuccess(value), onError: (e) {
      onFailure();
    }).catchError((e, s) {
      onFailure();
    });
  }

  void createAddress(Address address, Function onSuccess, VoidCallback onFailure) {
    addressApi.createAddress(address).then((value) => onSuccess(), onError: (e) {
      onFailure();
    }).catchError((e, s) {
      onFailure();
    });
  }
}
