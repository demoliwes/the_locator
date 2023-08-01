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
    apiKey: 'AIzaSyArzBT58KjNjUjPX7frdvGUVgsucNLGUEk',
    appId: '1:869806603553:web:b87084d0a41076217e1260',
    messagingSenderId: '869806603553',
    projectId: 'the-locator-5198f',
    authDomain: 'the-locator-5198f.firebaseapp.com',
    storageBucket: 'the-locator-5198f.appspot.com',
    measurementId: 'G-CV89JBHQEQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6ONN3K4Sjc0GQpkVn3x16fh5H8IRwi4I',
    appId: '1:869806603553:android:5c625470f4a094517e1260',
    messagingSenderId: '869806603553',
    projectId: 'the-locator-5198f',
    storageBucket: 'the-locator-5198f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAY64UxynJGGnHL_jG-uOin8M74f55bLQI',
    appId: '1:869806603553:ios:29b56c56e12635337e1260',
    messagingSenderId: '869806603553',
    projectId: 'the-locator-5198f',
    storageBucket: 'the-locator-5198f.appspot.com',
    iosClientId: '869806603553-ur3io6dn9mm6ieta9icbl14ugb7kku13.apps.googleusercontent.com',
    iosBundleId: 'com.example.theLocator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAY64UxynJGGnHL_jG-uOin8M74f55bLQI',
    appId: '1:869806603553:ios:29b56c56e12635337e1260',
    messagingSenderId: '869806603553',
    projectId: 'the-locator-5198f',
    storageBucket: 'the-locator-5198f.appspot.com',
    iosClientId: '869806603553-ur3io6dn9mm6ieta9icbl14ugb7kku13.apps.googleusercontent.com',
    iosBundleId: 'com.example.theLocator',
  );
}
