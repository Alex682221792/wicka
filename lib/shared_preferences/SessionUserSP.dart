import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wicka/logic/firebase/Auth.dart';
import 'package:wicka/model/User.dart';

class SessionUserSP {
  final String _loggedUserKey = "loged_user_sp";
  final String _tokenKey = "token_sp";
  final String _expiredDateTokenKey = "expired_date_token_sp";

  Future<User> getLoggedUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(json.decode(prefs.getString(_loggedUserKey))) ?? null;
  }

  Future<bool> setLoggedUser(User clientModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_loggedUserKey, json.encode(clientModel));
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? null;
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, token);
  }

  Future<DateTime> getExpireDateToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var expiredDate = prefs.getString(_expiredDateTokenKey);
    return expiredDate != null
        ? DateTime.parse(prefs.getString(_expiredDateTokenKey))
        : null;
  }

  Future<bool> setExpiredDateToken() async {
    String expiredDateToken = DateTime.now().add(Duration(minutes: 59)).toString();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_expiredDateTokenKey, expiredDateToken);
  }

  Future<bool> expiredDateToken() async {
    String expiredDateToken = DateTime.now().subtract(Duration(minutes: 59)).toString();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_expiredDateTokenKey, expiredDateToken);
  }

  Future<bool> isLoggedUser() async {
    try {
      var user = await this.getLoggedUser();
      return user.id != null && user.id.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  logout(){
    Auth().signOut();
  }
}
