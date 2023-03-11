import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD_1dRIC_i94nze0hDLLAX-VK_TLi9wVwM",
            authDomain: "materialist-4f472.firebaseapp.com",
            projectId: "materialist-4f472",
            storageBucket: "materialist-4f472.appspot.com",
            messagingSenderId: "821360468155",
            appId: "1:821360468155:web:27a48fd407c4c9d8f6c99e"));
  } else {
    await Firebase.initializeApp();
  }
}
