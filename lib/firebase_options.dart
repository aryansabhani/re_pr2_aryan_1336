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
    apiKey: 'AIzaSyDcu_PT_nUxXtIg6Z2xJeqrWXMNlGmjo2Y',
    appId: '1:493936910432:web:d1e55b1f6f0fb4cdfa6305',
    messagingSenderId: '493936910432',
    projectId: 're-exam-27f9a',
    authDomain: 're-exam-27f9a.firebaseapp.com',
    storageBucket: 're-exam-27f9a.appspot.com',
    measurementId: 'G-PW6JJSS65B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvDxcu0Uez0b_tbh-4DcvK2QwM6zrVzgg',
    appId: '1:493936910432:android:4781e8946cc79367fa6305',
    messagingSenderId: '493936910432',
    projectId: 're-exam-27f9a',
    storageBucket: 're-exam-27f9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACC4F7PGScT8ZN3nA4rB-EW-yb2kf8Wx0',
    appId: '1:493936910432:ios:e775026081971aeafa6305',
    messagingSenderId: '493936910432',
    projectId: 're-exam-27f9a',
    storageBucket: 're-exam-27f9a.appspot.com',
    iosBundleId: 'com.example.rePr2Aryan1336',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACC4F7PGScT8ZN3nA4rB-EW-yb2kf8Wx0',
    appId: '1:493936910432:ios:71d78f941dbae11bfa6305',
    messagingSenderId: '493936910432',
    projectId: 're-exam-27f9a',
    storageBucket: 're-exam-27f9a.appspot.com',
    iosBundleId: 'com.example.rePr2Aryan1336.RunnerTests',
  );
}
