import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

abstract class Authentication {
  static final _firebase = FirebaseAuth.instance;

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (error) {
      return error.toString();
    }
    return null;
  }

  static forgetPassword({
    required String email,
  }) async {
    try {} catch (error) {
      log("Error ${error.toString()}");
      return error.toString();
    }
    return null;
  }

  static Future<String?> createAccount({
    required String email,
    required String password,
    required String name ,
  }) async {
    try{
      UserCredential user =  await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.user!.updateDisplayName(name);
      user.user!.reload();
    }
    catch(error)
    {
      return error.toString();
    }
    return null ;
  }

}
