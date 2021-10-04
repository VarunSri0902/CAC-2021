import 'dart:async';
import 'package:gtk_flutter/src/authentication.dart';

import 'package:gtk_flutter/src/widgets.dart' ;
import 'package:gtk_flutter/pages/home.dart';
import 'package:gtk_flutter/services/get_category_data.dart';
import 'package:gtk_flutter/model/cat.dart' ;

import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  //Cat cat ;

  @override
  _DetailsState createState() => _DetailsState();

  //Details({Key? key, required this.cat}) : super(key: key);

}

class _DetailsState extends State<Details> {



  @override
  void initState() {
    super.initState();
  }

  // Declare a field that holds the Todo.
  late final Cat cat;

  @override
  Widget build(BuildContext context) {
    //Cat data = ModalRoute.of(context)?.settings?.arguments as Cat;
    Map data = ModalRoute.of(context)?.settings?.arguments as Map;

/*
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/category');
      }
    });
*/
    return Scaffold(
      appBar: AppBar(
          title: Text('Student Discuss')),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/codelab.png'),
              SizedBox(height: 8.0),
              Text(
                  data!['catagory'],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  )
              ),
              SizedBox(height: 8.0),
              const Divider(
                height: 8,
                thickness: 3,
                indent: 8,
                endIndent: 8,
                color: Colors.grey,
              ),
            ],
          ),
          ),
        );
  }

}



void signOut() {
  FirebaseAuth.instance.signOut();
}