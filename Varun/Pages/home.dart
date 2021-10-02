import 'package:flutter/material.dart';
import 'package:test_app1/pages/category.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app1/services/database.dart';

class Home extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseService db = new DatabaseService();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dynamic user = FirebaseAuth.instance.currentUser;
    //print(user.displayName);

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: appBar,
      body: Container(
          width: 200.0,
          height: 100.0,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ElevatedButton(
            child: Text('Go to category page'),
            onPressed: () {
              //Pushes the category COVID to the Category Posts Page, any String could have been inputted, simply for testing purposes
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPosts(category: 'COVID')));
            },
          )),
    );
  }
}
