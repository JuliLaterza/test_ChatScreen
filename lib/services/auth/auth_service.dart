import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {

  //instance of auth
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get Current user.

  User? getCurrentUser(){
    return _firebaseauth.currentUser;
  }


  // sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseauth.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "email": email
        }
      );

      return userCredential;

    } on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    } 
  }

  //Sign up

  Future<UserCredential?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseauth.createUserWithEmailAndPassword(
        email: email, 
        password: password);
        _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
            'uid': userCredential.user!.uid, 'email':email,
          }
        );
      
        return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }


  // sign out
  Future<void> signOut() async {
    await _firebaseauth.signOut();
  }
}