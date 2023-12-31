// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// ignore: depend_on_referenced_packages
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
    apiKey: 'AIzaSyCG4wbtmKL3W13zyCpRbzDeKAJyIFkOqDk',
    appId: '1:1033243064783:web:2c42f6e010ad854b4ebaba',
    messagingSenderId: '1033243064783',
    projectId: 'firestore-b6168',
    authDomain: 'firestore-b6168.firebaseapp.com',
    storageBucket: 'firestore-b6168.appspot.com',
    measurementId: 'G-ZJ1F5DG9B2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3AKHaZkXZxJ3TaviiPdBOtGyesISFeLI',
    appId: '1:1033243064783:android:69315a27c9b664ec4ebaba',
    messagingSenderId: '1033243064783',
    projectId: 'firestore-b6168',
    storageBucket: 'firestore-b6168.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsuQQF1vIDU4wRlpyH9kcks_X3eDcxxyU',
    appId: '1:1033243064783:ios:60c475154188ef0c4ebaba',
    messagingSenderId: '1033243064783',
    projectId: 'firestore-b6168',
    storageBucket: 'firestore-b6168.appspot.com',
    iosBundleId: 'com.example.flutterApplication5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsuQQF1vIDU4wRlpyH9kcks_X3eDcxxyU',
    appId: '1:1033243064783:ios:09e8367492aab4a44ebaba',
    messagingSenderId: '1033243064783',
    projectId: 'firestore-b6168',
    storageBucket: 'firestore-b6168.appspot.com',
    iosBundleId: 'com.example.flutterApplication5.RunnerTests',
  );
}
