import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:lab_13_1/screens/LoginScreen.dart';
import 'package:lab_13_1/screens/singupscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Ideal time to initialize

  runApp(MaterialApp(
    home: MyApp(),
  ));
//...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Login_screen();
  }
}
