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
    apiKey: 'AIzaSyDPOr_sSByFK8k-SOLfKi026TiVN5-faWc',
    appId: '1:573198782934:web:94e7ffc28f0edc504b9477',
    messagingSenderId: '573198782934',
    projectId: 'fir-notificationapp-3f68b',
    authDomain: 'fir-notificationapp-3f68b.firebaseapp.com',
    storageBucket: 'fir-notificationapp-3f68b.appspot.com',
    measurementId: 'G-P9FTNB330T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2z45yxCEvOFkTx48-3MYIkQRYrsH70O0',
    appId: '1:573198782934:android:e04d7795dc0d07384b9477',
    messagingSenderId: '573198782934',
    projectId: 'fir-notificationapp-3f68b',
    storageBucket: 'fir-notificationapp-3f68b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv4E8QenfhTOcXfjrFZTP-f9jgkSy7BS8',
    appId: '1:573198782934:ios:fbe9eef0cd01dafa4b9477',
    messagingSenderId: '573198782934',
    projectId: 'fir-notificationapp-3f68b',
    storageBucket: 'fir-notificationapp-3f68b.appspot.com',
    iosClientId: '573198782934-4b0bcs437u84lpuf802t8p5hc7m72iaf.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv4E8QenfhTOcXfjrFZTP-f9jgkSy7BS8',
    appId: '1:573198782934:ios:fbe9eef0cd01dafa4b9477',
    messagingSenderId: '573198782934',
    projectId: 'fir-notificationapp-3f68b',
    storageBucket: 'fir-notificationapp-3f68b.appspot.com',
    iosClientId: '573198782934-4b0bcs437u84lpuf802t8p5hc7m72iaf.apps.googleusercontent.com',
    iosBundleId: 'com.example.notificationapp',
  );
}
