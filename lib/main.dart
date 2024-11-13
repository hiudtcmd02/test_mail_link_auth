import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_mail_link_auth_3/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
          apiKey: "AIzaSyBUz4OvxCWfZbQbZbZeV7rp8Iob17lW_9U",
          // authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
          projectId: "phone-auth-app-230af",
          storageBucket: "phone-auth-app-230af.firebasestorage.app",
          messagingSenderId: "514028005582",
          appId: "1:514028005582:android:e61de74f39752a0cde489f"
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      home: LoginView(),
    );
  }
}