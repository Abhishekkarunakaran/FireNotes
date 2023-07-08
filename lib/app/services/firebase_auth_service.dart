import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final auth = FirebaseAuth.instance;
      var userCred = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCred==null) {
        return false;
      }

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final auth = FirebaseAuth.instance;
      UserCredential userCred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = userCred.user!;
      user.updateDisplayName(name);

      if (userCred == null) {
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
