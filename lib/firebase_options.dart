// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD4NflasuSZ-TghZpioROF7vVM7Cda_dM8',
    appId: '1:921711689338:web:b6b58419b2d6954d4785c3',
    messagingSenderId: '921711689338',
    projectId: 'finalproject-29e57',
    authDomain: 'finalproject-29e57.firebaseapp.com',
    databaseURL: 'https://finalproject-29e57-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-29e57.appspot.com',
    measurementId: 'G-Q8KX5XE8B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfl40sCUvV6irVpkSCeS9F24V7h12ek-A',
    appId: '1:921711689338:android:c53aef436067a9654785c3',
    messagingSenderId: '921711689338',
    projectId: 'finalproject-29e57',
    databaseURL: 'https://finalproject-29e57-default-rtdb.firebaseio.com',
    storageBucket: 'finalproject-29e57.appspot.com',
  );
}
