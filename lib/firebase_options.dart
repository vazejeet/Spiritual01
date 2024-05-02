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
        return windows;
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
    apiKey: 'AIzaSyCHn4yx6IvPyUeb2Qy0BrkERzG3Lw4RWZg',
    appId: '1:590083804053:web:8aca6e3b30df43cad9849c',
    messagingSenderId: '590083804053',
    projectId: 'spiritual01',
    authDomain: 'spiritual01.firebaseapp.com',
    databaseURL: 'https://spiritual01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spiritual01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBA1uVpeeieVIlv3rFTiGLVhA3ckpYQico',
    appId: '1:590083804053:android:b4507a321f1f6722d9849c',
    messagingSenderId: '590083804053',
    projectId: 'spiritual01',
    databaseURL: 'https://spiritual01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spiritual01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqKx26mW6i3kai28RvqzQ1-0QkqgkVG4I',
    appId: '1:590083804053:ios:ab4a8dc41f894314d9849c',
    messagingSenderId: '590083804053',
    projectId: 'spiritual01',
    databaseURL: 'https://spiritual01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spiritual01.appspot.com',
    iosBundleId: 'com.example.spiritual01',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqKx26mW6i3kai28RvqzQ1-0QkqgkVG4I',
    appId: '1:590083804053:ios:ab4a8dc41f894314d9849c',
    messagingSenderId: '590083804053',
    projectId: 'spiritual01',
    databaseURL: 'https://spiritual01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spiritual01.appspot.com',
    iosBundleId: 'com.example.spiritual01',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHn4yx6IvPyUeb2Qy0BrkERzG3Lw4RWZg',
    appId: '1:590083804053:web:92ef7a5d03a24a83d9849c',
    messagingSenderId: '590083804053',
    projectId: 'spiritual01',
    authDomain: 'spiritual01.firebaseapp.com',
    databaseURL: 'https://spiritual01-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'spiritual01.appspot.com',
  );
}
