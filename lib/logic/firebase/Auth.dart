import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fauth;
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

abstract class BaseAuth {
  Future<bool> signIn(String email, String password);

  Future<fauth.User> getCurrentUser();

  Future<void> signOut();

  Future<bool> checkExpiredDateToken();
}

class Auth implements BaseAuth {
  final fauth.FirebaseAuth _firebaseAuth = fauth.FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    fauth.UserCredential result = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    fauth.User user = result.user;
    var tokenResult = await user.getIdToken();
    var sessionUser = SessionUserSP();
    sessionUser.setExpiredDateToken();
    sessionUser.setToken(tokenResult);
    return true;
  }

  Future<fauth.User> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    var sessionUser = SessionUserSP();
    sessionUser.setToken(null);
    sessionUser.setLoggedUser(User());
    return _firebaseAuth.signOut();
  }

  Future<bool> checkExpiredDateToken() async {
    var sessionUser = SessionUserSP();
    var expiredDate = await sessionUser.getExpireDateToken();
    if (this._firebaseAuth.currentUser != null && expiredDate != null) {
      if (expiredDate.isAfter(DateTime.now())) {
        var user = this._firebaseAuth.currentUser;
        var tokenResult = await user.getIdToken();
        sessionUser.setExpiredDateToken();
        sessionUser.setToken(tokenResult);
      }
    }
    return true;
  }
}
