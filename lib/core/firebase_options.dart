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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6OMcfXZq2SwTMxjUTQJTIDb-5b63ceXI',
    appId: '1:145414915671:android:5af592d153e691b0754512',
    messagingSenderId: '145414915671',
    projectId: 'ariel-transapp',
    databaseURL: 'https://ariel-transapp-default-rtdb.firebaseio.com',
    storageBucket: 'ariel-transapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwBIolCTHsSYE8gJ-S7hIBE9h_YXbJxnM',
    appId: '1:145414915671:ios:213026fd668d79a6754512',
    messagingSenderId: '145414915671',
    projectId: 'ariel-transapp',
    databaseURL: 'https://ariel-transapp-default-rtdb.firebaseio.com',
    storageBucket: 'ariel-transapp.appspot.com',
    iosClientId:
        '145414915671-ibs3815k0u2okeji9vojhuikro2t44qe.apps.googleusercontent.com',
    iosBundleId: 'br.com.ariel.arielApp',
  );
}
