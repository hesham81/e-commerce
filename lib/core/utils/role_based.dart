import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RoleBased {
  static final _firestore = FirebaseFirestore.instance.collection("users");
  static late var role = "";

  static Future<String?> createUser({
    required String username,
    required String token,
    String role = "user",
  }) async {
    try {
      await _firestore.doc(token).set(
        {
          "username": username,
          "role": role,
        },
      );
      return null;
    } catch (error) {
      log("Error ${error.toString()}");
      return error.toString();
    }
  }

  static Future<String> getUserRole({
    required String uid,
  }) async {
    try{
      await _firestore.doc(uid).get().then(
        (DocumentSnapshot<Map<String, dynamic>> value) {
          role = value.data()!['role'];
        },
      );
      return role;
    }
    catch(error)
    {
      log("Error ${error.toString()}");
      return error.toString();
    }
  }
}
