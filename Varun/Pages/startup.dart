import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: appBar,
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
