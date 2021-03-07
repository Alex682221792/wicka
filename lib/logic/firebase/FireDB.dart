import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

abstract class FireDB {
  Future<DataSnapshot> read(String path);
}

class FireDBGestor implements FireDB {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  Future<DataSnapshot> read(String path) async {
    return await _firebaseDatabase.reference().child(path).once();
  }
}