import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB0_-3ZfOEw0TR9LMEA9rfucisuYW2JruU",
            authDomain: "spreecode-pvt-ltd.firebaseapp.com",
            projectId: "spreecode-pvt-ltd",
            storageBucket: "spreecode-pvt-ltd.appspot.com",
            messagingSenderId: "544642156485",
            appId: "1:544642156485:web:80924adaae86a3ff36edac",
            measurementId: "G-0T9HZKBMDX"));
  } else {
    await Firebase.initializeApp();
  }
}
