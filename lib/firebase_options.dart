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
    apiKey: 'AIzaSyC_crJJQnZhf9p4ODo6L0MyydNLo_DDb6Q',
    appId: '1:218994517295:web:1fd17b82dbc5ca5539edda',
    messagingSenderId: '218994517295',
    projectId: 'fluttertodo-e157c',
    authDomain: 'fluttertodo-e157c.firebaseapp.com',
    storageBucket: 'fluttertodo-e157c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7W7NoqfvAt19tidGRYoeGw4C8X-7k8FY',
    appId: '1:218994517295:android:092d91733b244d5139edda',
    messagingSenderId: '218994517295',
    projectId: 'fluttertodo-e157c',
    storageBucket: 'fluttertodo-e157c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0RtsiL7ko-_tceUV0hf6vAo5bJaDRk7M',
    appId: '1:218994517295:ios:fd20f85ffedcadff39edda',
    messagingSenderId: '218994517295',
    projectId: 'fluttertodo-e157c',
    storageBucket: 'fluttertodo-e157c.appspot.com',
    iosBundleId: 'com.example.agrebnevruTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0RtsiL7ko-_tceUV0hf6vAo5bJaDRk7M',
    appId: '1:218994517295:ios:b898311a7a14bdae39edda',
    messagingSenderId: '218994517295',
    projectId: 'fluttertodo-e157c',
    storageBucket: 'fluttertodo-e157c.appspot.com',
    iosBundleId: 'com.example.agrebnevruTodo.RunnerTests',
  );
}
