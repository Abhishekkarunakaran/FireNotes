import 'dart:developer';

import 'package:fire_notes/app/shared/dependencies.dart';
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

      if (userCred != null) {
        return true;
      }

      return false;
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

      if (userCred != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {

      //code to get the google credentials from the user
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var result = await auth.signInWithCredential(credential);

      if (result != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
