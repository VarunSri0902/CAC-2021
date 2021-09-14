import 'package:flutter/material.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            'App Title',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent[100],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  )),
              //
              //
              SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  )),
            ],
          ),
        ));
  }
}
