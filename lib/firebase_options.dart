// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'firebase_options.dart';

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
    apiKey: 'AIzaSyD8Obc6URnxDe89R8yubYSiRSgtHEyo94I',
    appId: '1:680916591227:web:8d20515a200b02d9b4b8de',
    messagingSenderId: '680916591227',
    projectId: 'portofoliodevalda',
    authDomain: 'portofoliodevalda.firebaseapp.com',
    storageBucket: 'portofoliodevalda.appspot.com',
    measurementId: 'G-TPWTJZ3LYK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHW2xSyT8aOg_CSRikqDMX6_8PJRF0Rmg',
    appId: '1:680916591227:android:b4745455c03caeaab4b8de',
    messagingSenderId: '680916591227',
    projectId: 'portofoliodevalda',
    storageBucket: 'portofoliodevalda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0EK2IOd9_L38TNAVdOz7zxQOTQ_TJMdc',
    appId: '1:680916591227:ios:802ebbdb5846481db4b8de',
    messagingSenderId: '680916591227',
    projectId: 'portofoliodevalda',
    storageBucket: 'portofoliodevalda.appspot.com',
    iosClientId:
        '680916591227-sgsffdg0tlt5tshj6qusb37qntm17il6.apps.googleusercontent.com',
    iosBundleId: 'com.example.devaldaporto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0EK2IOd9_L38TNAVdOz7zxQOTQ_TJMdc',
    appId: '1:680916591227:ios:802ebbdb5846481db4b8de',
    messagingSenderId: '680916591227',
    projectId: 'portofoliodevalda',
    storageBucket: 'portofoliodevalda.appspot.com',
    iosClientId:
        '680916591227-sgsffdg0tlt5tshj6qusb37qntm17il6.apps.googleusercontent.com',
    iosBundleId: 'com.example.devaldaporto',
  );
}
