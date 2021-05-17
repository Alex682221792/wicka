import 'dart:convert';

import 'package:wicka/api/services/BaseAPI.dart';
import 'package:wicka/model/Address.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

class AddressAPI extends BaseRouteAPI {
  AddressAPI() {
    super.apiName = 'address';
  }

  Future<User> createAddress(Address address) async {
    var response = await this
        .postData('create', bodyData: json.encode(address.toJson()), headers: <String, String>{
      'Authorization': await SessionUserSP().getToken(),
    });
    if (response.success) {
      return User.fromJson(json.decode(response.result));
    }
    return null;
  }

  Future<List<Address>> getAddressList() async {
    var response = await this.getData('by-user-id', headers: <String, String>{
      'Authorization': await SessionUserSP().getToken(),
    });
    if (response.success) {
      return List<dynamic>.from(json.decode(response.result))
          .map((e) => Address.fromJson(e)).toList();
    }
    return null;
  }
}
