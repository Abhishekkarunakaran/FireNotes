// ignore_for_file: prefer_const_constructors

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SignInSignUpProvider provider = Provider.of<SignInSignUpProvider>(context,listen: false);
    FirebaseAuthService.checkAuthStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    //To clos the textinput option if any of the inputfields are open
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    

    return Scaffold(
      backgroundColor: CT.black,
      body: Stack(
        children: [
          Positioned(top: 0, right: 20, child: Image.asset('assets/img/1.png')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 20),
            child: Center(
                child: Column(
              children: [
                WT.logo,
                SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
