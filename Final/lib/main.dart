import 'package:flutter/material.dart';

import 'package:test_app1/pages/startup.dart';
import 'package:test_app1/pages/signup.dart';
import 'package:test_app1/pages/login.dart';
import 'package:test_app1/pages/home.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/startup',
    routes: {
      '/startup': (context) => StartUp(),
      '/login': (context) => LogIn(),
      '/signup': (context) => SignUp(),
      '/home': (context) => Home(),
    },
  ));
}
