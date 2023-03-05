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
    apiKey: 'AIzaSyBBunmpS9FCTmkLy8IBB4TmyqV63Q0jBnw',
    appId: '1:678311716526:web:74ea238d278bdf44eeaf3f',
    messagingSenderId: '678311716526',
    projectId: 'fluttertest-9f7bb',
    authDomain: 'fluttertest-9f7bb.firebaseapp.com',
    storageBucket: 'fluttertest-9f7bb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrpUzWQJBpNypoG3Mz3uKAM5TwoVqdasA',
    appId: '1:678311716526:android:924a128e26eb1d68eeaf3f',
    messagingSenderId: '678311716526',
    projectId: 'fluttertest-9f7bb',
    storageBucket: 'fluttertest-9f7bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6aqlCZJPRr60xwD59bY-i7LZFuokuJdo',
    appId: '1:678311716526:ios:7feb068506782a3deeaf3f',
    messagingSenderId: '678311716526',
    projectId: 'fluttertest-9f7bb',
    storageBucket: 'fluttertest-9f7bb.appspot.com',
    iosClientId: '678311716526-fk7mne5fa0bvffdnm36aeeuen96tu8o1.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6aqlCZJPRr60xwD59bY-i7LZFuokuJdo',
    appId: '1:678311716526:ios:7feb068506782a3deeaf3f',
    messagingSenderId: '678311716526',
    projectId: 'fluttertest-9f7bb',
    storageBucket: 'fluttertest-9f7bb.appspot.com',
    iosClientId: '678311716526-fk7mne5fa0bvffdnm36aeeuen96tu8o1.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebase',
  );
}
