import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
      apiKey: "AIzaSyBo0ja7cY_ejta8vpQ8gQ1Xowh5OLeSmq4",
      authDomain: "project101-20c5e.firebaseapp.com",
      projectId: "project101-20c5e",
      storageBucket: "project101-20c5e.appspot.com",
      messagingSenderId: "119323746394",
      appId: "1:119323746394:web:33fa4f0ec6d62e4f12b863"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyBo0ja7cY_ejta8vpQ8gQ1Xowh5OLeSmq4",
      authDomain: "project101-20c5e.firebaseapp.com",
      projectId: "project101-20c5e",
      storageBucket: "project101-20c5e.appspot.com",
      messagingSenderId: "119323746394",
      appId: "1:119323746394:web:33fa4f0ec6d62e4f12b863"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyBo0ja7cY_ejta8vpQ8gQ1Xowh5OLeSmq4",
      authDomain: "project101-20c5e.firebaseapp.com",
      projectId: "project101-20c5e",
      storageBucket: "project101-20c5e.appspot.com",
      messagingSenderId: "119323746394",
      appId: "1:119323746394:web:33fa4f0ec6d62e4f12b863"
  );

}
