import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInSignUpProvider extends ChangeNotifier {
  bool isLoading = false;

  bool signedIn = false;

  User? user;

  Future<void> googleSignIn() async {
    isLoading = true;
    notifyListeners();

    signedIn = await FirebaseAuthService.signInWithGoogle();

    isLoading = false;
    notifyListeners();
  }
}

