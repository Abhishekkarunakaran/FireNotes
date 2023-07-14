import 'dart:developer';

import 'package:fire_notes/app/shared/dependencies.dart';


class FirebaseAuthService {
  // Stream<String> get onAuthStateChanged =>
  //     FirebaseAuth.instance.authStateChanges().listen(
  //           (user) => user?.uid,
  //     );
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

  static Future<void> signOut(context) async {
    User? user = FirebaseAuth.instance.currentUser;
    for (UserInfo userInfo in user!.providerData) {
      if (userInfo.providerId == 'google.com') {
        await GoogleSignIn().signOut().then(
            (value) => Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false), onError: (e) {
          log("Error in signing out from google account: $e");
        });
      } else {
        await FirebaseAuth.instance.signOut().then(
            (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                ), onError: (e) {
          log("Error in signing out from email and password : $e");
        });
      }
    }
  }

  static void checkAuthStatus(context) {
    User? user = FirebaseAuth.instance.currentUser;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user != null) {
        log("------- uid ----------");
        log(user.uid);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/signin');
      }
    });
  }

  static String? getUserId() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      log(user.uid);
      return user.uid;
    }
    return null;
  }
}
