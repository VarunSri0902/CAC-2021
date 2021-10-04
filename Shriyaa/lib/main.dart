import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';

import 'pages/category.dart';
import 'pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/details.dart' ;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
          title: 'Student Discuss',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/location': (context) => ChooseLocation(),
            '/category': (context) => Category(),
            '/details': (context) => Details()
          }
      ));
}
