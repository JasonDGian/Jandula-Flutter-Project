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
    apiKey: 'AIzaSyBjIvPmgI8PUvw6kt-We7XcwQEt2_TAQbM',
    appId: '1:735294905016:web:1e09cee312b5cdf1b7724d',
    messagingSenderId: '735294905016',
    projectId: 'proyecto-login-djg',
    authDomain: 'proyecto-login-djg.firebaseapp.com',
    storageBucket: 'proyecto-login-djg.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcZB6fbcD_g0d37KdOR2X3JsVGPNeOoQM',
    appId: '1:735294905016:android:cf93de560d77e7ebb7724d',
    messagingSenderId: '735294905016',
    projectId: 'proyecto-login-djg',
    storageBucket: 'proyecto-login-djg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_gQT0vU4eMqK4OrXstGu-kW9i76Tncto',
    appId: '1:735294905016:ios:b4e3a5977e017a67b7724d',
    messagingSenderId: '735294905016',
    projectId: 'proyecto-login-djg',
    storageBucket: 'proyecto-login-djg.appspot.com',
    iosClientId: '735294905016-8s9ma10dmfbqleli9osbfa7fkc5elfak.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_gQT0vU4eMqK4OrXstGu-kW9i76Tncto',
    appId: '1:735294905016:ios:b4e3a5977e017a67b7724d',
    messagingSenderId: '735294905016',
    projectId: 'proyecto-login-djg',
    storageBucket: 'proyecto-login-djg.appspot.com',
    iosClientId: '735294905016-8s9ma10dmfbqleli9osbfa7fkc5elfak.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginProject',
  );
}
