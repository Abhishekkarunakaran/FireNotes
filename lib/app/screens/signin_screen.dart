// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fire_notes/app/shared/dependencies.dart';
import 'package:fire_notes/app/theme/text_color_theme.dart';
import 'package:swipe_to/swipe_to.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  final _signinFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  void _showSnackbar() {
    final snackbar = SnackBar(
      content: Text('Incorrect Email or Password !!'),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
          Positioned(
              bottom: 10,
              left: 20,
              child: SwipeTo(
                child: Text(
                  'Swipe Right to Signup >>',
                  style: TT.swipeText,
                ),
                onRightSwipe: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              )),
          Positioned(
            top: 0,
            right: 20,
            child: Image.asset('assets/img/1.png'),
          ),
          Positioned(
            top: SS.width / 8,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _signinFormKey,
                child: Column(
                  children: [
                    WT.logo,
                    SizedBox(
                      height: 20,
                    ),
                    NoteTextField(
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
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                        text: Text(
                          'Sign in',
                          style: TT.textFieldTitle,
                        ),
                        function: () async {
                          if (_signinFormKey.currentState!.validate()) {
                            bool signedIn = await FirebaseAuthService
                                .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: pwdController.text,
                            );
                            if (signedIn) {
                              navigateToHome();
                            } else {
                              _showSnackbar();
                            }
                          }
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'OR',
                        style: TT.textFieldTitle,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      buttonColor: Colors.white,
                      function: () {
                        //TODO: Sign in with google
                      },
                      text: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign in with   ',
                            style: TT.whiteButtonText,
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              'assets/img/google.png',
                            ),
                          )
                        ],
                      ),
                    )
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
