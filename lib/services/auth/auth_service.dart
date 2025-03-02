

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;

  // sign in with email and password

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseauth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return userCredential;

    } on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }


  // sign out

}