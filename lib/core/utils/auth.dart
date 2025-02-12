import 'dart:developer';

import 'package:e_commerce/core/utils/role_based.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Authentication {
  static final _firebase = FirebaseAuth.instance;

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? user = await _firebase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String role = await RoleBased.getUserRole(uid: user.user!.uid).then(
        (rolee) => rolee.toString(),
      );
      print(role);
      return role;
    } on FirebaseAuthException catch (_) {
      return null;
    } catch (error) {
      return null;
    }
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
    required String name,
  }) async {
    try {
      UserCredential user = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user.user!.updateDisplayName(name);
      user.user!.reload();
      var response = await RoleBased.createUser(
        username: email,
        token: user.user!.uid,
      );
      if (response != null) return null;
    } catch (error) {
      return error.toString();
    }
  }
}
