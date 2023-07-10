// ignore_for_file: prefer_const_constructors

import 'package:fire_notes/app/screens/home_screen.dart';
import 'package:fire_notes/app/screens/signin_screen.dart';
import 'package:fire_notes/app/screens/signup_screen.dart';
import 'package:fire_notes/app/screens/splash_screen.dart';
import 'package:fire_notes/app/shared/dependencies.dart';

var routes = <String,WidgetBuilder>{
  '/': (context) => SplashScreen(),
  '/signin': (context) => SignInScreen(),
  '/signup': (context) => SignUpScreen(),
  '/home': (context) => HomeScreen(),
};
