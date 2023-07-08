import 'package:fire_notes/app/shared/dependencies.dart';

class SignInSignUpProvider extends ChangeNotifier {
  bool isLoading = false;

  bool signedIn = false;

  void googleSignIn() async {
    isLoading = true;
    notifyListeners();

    signedIn = await FirebaseAuthService.signInWithGoogle();

    isLoading = false;
    notifyListeners();
  }
}
