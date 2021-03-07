import 'dart:convert';
import 'package:wicka/api/services/BaseAPI.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

class UserAPI extends BaseRouteAPI {
  UserAPI() {
    super.apiName = 'user';
  }

  Future<User> createByOAuth(User client) async {
    var response = await this
        .postData('/create-by-oauth', bodyData: json.encode(client.toJson()));
    if (response.success) {
      return User.fromJson(json.decode(response.result));
    }
    return null;
  }

  Future<User> createAccount(User client) async {
    var response = await this
        .postData('/create-account', bodyData: json.encode(client.toJson()));
    if (response.success) {
      return User.fromJson(json.decode(response.result));
    }
    return null;
  }

  Future<User> getProfile() async {
    var response = await this.getData('/profile', headers: <String, String>{
      'authorization': await SessionUserSP().getToken(),
    });
    if (response.success) {
      return User.fromJson(json.decode(response.result));
    }
    return null;
  }
  // Future<bool> leaveGirl(String girlId) async {
  //   var response = await this
  //       .deleteData('/unsubscribe-girl/${girlId}', headers: <String, String>{
  //     'authorization': await SessionUserSP().getToken(),
  //   });
  //   return Future.value(response.success);
  // }
}
