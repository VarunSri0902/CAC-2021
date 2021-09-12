import 'package:flutter/material.dart';

import 'package:test_app1/pages/startup.dart';
import 'package:test_app1/pages/signup.dart';
import 'package:test_app1/pages/login.dart';
import 'package:test_app1/pages/home.dart';

void main() {
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
