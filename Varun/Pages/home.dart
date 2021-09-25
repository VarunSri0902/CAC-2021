import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: appBar,
      body: Container(
        width: 200.0,
        height: 100.0,
        color: Colors.blueAccent[400],
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}
