import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wicka/api/services/UserAPI.dart';
import 'package:wicka/logic/SignInLogic.dart';
import 'package:wicka/model/User.dart';
import 'package:wicka/shared_preferences/SessionUserSP.dart';

import 'firebase/FireDB.dart';

class SignUpLogic {
  Future<bool> createAccount(
      {User client, VoidCallback onSuccess, VoidCallback onFailure}) {
    UserAPI().createAccount(client).then((response) {
      if (response != null) {
        SessionUserSP()
            .setLoggedUser(response)
            .then((value) => SignInLogic()
                .signIn(client.email, client.password, onSuccess, onFailure))
            .catchError(() => onFailure());
      } else {
        onFailure();
      }
    });
  }
}
