import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blueGrey[100],
        appBar: initialAppBar,
        body: Stack(children: [
          Positioned.fill(
              child: Image(
            image: AssetImage('lib/assets/background.gif'),
            fit: BoxFit.fill,
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'WeConnect',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize: 85,
                      color: Color.fromRGBO(246, 178, 107, 1)),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(246, 178, 107, 1)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
                //
                //
                SizedBox(height: 30.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(246, 178, 107, 1)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
              ],
            ),
          )
        ]));
  }
}
