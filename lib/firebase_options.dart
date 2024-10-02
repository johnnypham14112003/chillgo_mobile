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
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDNtNQqJna5d7mAXLVHf6pYKn2gyF_b-4M',
    appId: '1:64271390533:web:bdcc16be536c378832502c',
    messagingSenderId: '64271390533',
    projectId: 'chillgo-exe201',
    authDomain: 'chillgo-exe201.firebaseapp.com',
    storageBucket: 'chillgo-exe201.appspot.com',
    measurementId: 'G-PMX1F08XTX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE9TYWADc2ZVtALf2LEytIM55nvqk4DYI',
    appId: '1:64271390533:android:23d62e9c724bc18932502c',
    messagingSenderId: '64271390533',
    projectId: 'chillgo-exe201',
    storageBucket: 'chillgo-exe201.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCohaix2TRbaxOx0CZ-cGu36BgdULXUtyU',
    appId: '1:64271390533:ios:eae4acbecc742ed232502c',
    messagingSenderId: '64271390533',
    projectId: 'chillgo-exe201',
    storageBucket: 'chillgo-exe201.appspot.com',
    iosBundleId: 'com.exe201fa24.chillgo.chillgoMobile',
  );
}
