import 'dart:async';
import 'package:gtk_flutter/src/authentication.dart';

import 'package:gtk_flutter/src/widgets.dart' ;
import 'package:gtk_flutter/pages/home.dart';
import 'package:gtk_flutter/services/get_category_data.dart';

import 'package:firebase_auth/firebase_auth.dart'; // new


import 'package:flutter/material.dart';
import 'package:flutter/src/material/page.dart' ;


class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    //Map data = ModalRoute.of(context)?.settings?.arguments as Map;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/codelab.png'),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () {
                        signOut() ;
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      icon: Icon(Icons.logout),
                      label: Text('Logout'),
                    )
              ]),
              SizedBox(height: 8.0),
              Text(
                'Category ',
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
              GetCategoryData(),
            ],
          ),
          ),
        );
  }

}

void signOut() {
  FirebaseAuth.instance.signOut();
}