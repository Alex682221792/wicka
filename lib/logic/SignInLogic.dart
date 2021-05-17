import 'package:flutter/material.dart';
import 'package:wicka/api/services/UserAPI.dart';
import 'package:wicka/logic/firebase/Auth.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';
import 'package:firebase_auth/firebase_auth.dart' as fauth;
import 'package:google_sign_in/google_sign_in.dart';

class SignInLogic {
  fauth.User _user;
  final fauth.FirebaseAuth _auth = fauth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void checkLoggedUser(BuildContext context) {
    SessionUserSP().isLoggedUser().then((response) {
      if (response) {
        Navigator.pushReplacementNamed(context, 'preparing');
      } else {
        Navigator.pushReplacementNamed(context, 'signIn');
      }
    });
  }

  void signIn(String email, String pass, VoidCallback onSuccess,
      VoidCallback onFailure) {
    Auth().signIn(email, pass).then((value) => onSuccess()).catchError((e, s) {
      print(e);
      print(s);
      onFailure();
    });
  }

  void signInWithGoogle(
      VoidCallback onSuccess, VoidCallback onFailure) async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    fauth.AuthCredential credential = fauth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var authResult = await _auth.signInWithCredential(credential);

    _user = authResult.user;

    assert(!_user.isAnonymous);

    var token = await _user.getIdToken();
    assert(token != null);

    fauth.User currentUser = _auth.currentUser;

    assert(_user.uid == currentUser.uid);

    User user = User(
        id: _user.uid,
        email: _user.email,
        name: _user.displayName,
        isActive: true,
        photo: _user.photoURL);
    await SessionUserSP().setToken(token);
    var savedUser = await UserAPI().createByOAuth(user);
    if(savedUser != null){
      SessionUserSP().setLoggedUser(savedUser);
      SessionUserSP().setExpiredDateToken();
      onSuccess();
    } else {
      onFailure();
    }
  }
}
