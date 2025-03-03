// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testchatscreen/firebase_options.dart';
import 'package:testchatscreen/pages/home_page.dart';
import 'package:testchatscreen/pages/register_page.dart';
import 'package:testchatscreen/services/auth/auth_gate.dart';
import 'package:testchatscreen/services/auth/login_or_register.dart';
import 'pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate()
    );
  }
}
