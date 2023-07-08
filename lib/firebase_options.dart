// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDwt5DbJXgX5dDOIUUYFrk9V3cyNqJOY7s',
    appId: '1:960809307423:web:846c52d0b65585382b742a',
    messagingSenderId: '960809307423',
    projectId: 'notes-6409c',
    authDomain: 'notes-6409c.firebaseapp.com',
    storageBucket: 'notes-6409c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3wQy9bFts3jsP-yKUn3rrdb3wUkhoZrA',
    appId: '1:960809307423:android:ce2e7bac34c26e412b742a',
    messagingSenderId: '960809307423',
    projectId: 'notes-6409c',
    storageBucket: 'notes-6409c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1-d6EFVcLsei4UrerR9LlfESXhDwK3xE',
    appId: '1:960809307423:ios:7aa065b4a920bf8d2b742a',
    messagingSenderId: '960809307423',
    projectId: 'notes-6409c',
    storageBucket: 'notes-6409c.appspot.com',
    iosClientId: '960809307423-sfveo02faf14hs4md5p2st21ti6fc2dj.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1-d6EFVcLsei4UrerR9LlfESXhDwK3xE',
    appId: '1:960809307423:ios:705b57fbe94f4d782b742a',
    messagingSenderId: '960809307423',
    projectId: 'notes-6409c',
    storageBucket: 'notes-6409c.appspot.com',
    iosClientId: '960809307423-oqstu5n0imqfohai8f9trf1kjm4t4ro3.apps.googleusercontent.com',
    iosBundleId: 'com.example.fireNotes.RunnerTests',
  );
}
