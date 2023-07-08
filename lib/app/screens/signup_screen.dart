// ignore_for_file: prefer_const_constructors

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';
import 'package:swipe_to/swipe_to.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController repwdController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwdController.dispose();
    repwdController.dispose();
    super.dispose();
  }

  void navigateToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CT.black,
      body: Stack(
        children: [
          Positioned(top: 30, left: 20, child: WT.appBarLogo),
          Positioned(
              bottom: 10,
              right: 20,
              child: SwipeTo(
                child: Text(
                  '<< Swipe Left to Sign in',
                  style: TT.swipeText,
                ),
                onLeftSwipe: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              )),
          Positioned(
            top: 0,
            right: 20,
            child: Image.asset('assets/img/2.png'),
          ),
          Positioned(
            top: 100,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _signupFormKey,
                child: Column(
                  children: [
                    NoteTextField(
                        needNext: true,
                        validator: (value) =>
                            value!.isEmpty ? "Enter name" : null,
                        title: 'Name',
                        textEditingController: nameController),
                    NoteTextField(
                        needNext: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter email");
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          }
                          return null;
                        },
                        title: 'Email',
                        textEditingController: emailController),
                    NotePwdField(
                        needNext: true,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Enter password");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Please enter the password having 6 or more letters");
                          }
                          return null;
                        },
                        title: 'Password',
                        textEditingController: pwdController),
                    NotePwdField(
                        needNext: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Re-enter password");
                          }
                          if (value != pwdController.text) {
                            return ("Enter the password same as entered above");
                          }
                          return null;
                        },
                        title: 'Re-type Password',
                        textEditingController: repwdController),
                    SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                      text: Text(
                        'Sign up',
                        style: TT.textFieldTitle,
                      ),
                      function: () async {
                        if (_signupFormKey.currentState!.validate()) {
                          bool signedUp = await FirebaseAuthService
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: pwdController.text,
                                  name: nameController.text);

                          if (signedUp) {
                            navigateToHome();
                          }
                          
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
