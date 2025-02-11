import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Authentication {
  static final _supabase = Supabase.instance.client.auth;

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _supabase.signInWithPassword(password: password, email: email);
    } catch (error) {
      log("Error ${error.toString()}");
      return error.toString();
    }
    return null;
  }

  static forgetPassword({
    required String email,
  }) async {
    try {
      await _supabase.resetPasswordForEmail(email);
    } catch (error) {
      log("Error ${error.toString()}");
      return error.toString();
    }
    return null;
  }
}
