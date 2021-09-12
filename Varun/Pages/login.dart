import 'package:flutter/material.dart';

// Create Stateful Widget
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}


class _LogInState extends State<LogIn> {
  //Create variables to store information from textt fields
  String email = '';
  String password = '';

  // only done when page is opened
  @override
  void initState() {
    // run constructor on startup
    super.initState();
  }
  
  // build the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Create App Bar
        appBar: AppBar(
          title: Text(
            'App Title',
            // Bold black text, size 40
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          //App bar is cyan
          backgroundColor: Colors.cyanAccent[100],
        ),
        //Creates a Container for the From
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            //Center Form
            child: Center(
                // Create Form
                child: Form(
                    child: Column(
                    children: <Widget>[
                      //Space top of Text Field
                      SizedBox(
                        height: 20.0,
                      ),
                      //Create email text field
                      TextFormField(
                        //update email string when the text field is changes
                        onChanged: (val) {setState(() {email = val;} ); },
                      ),
                      
                      //Create password text field
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        // Hide the text
                        obscureText: true,
                        //update password string when the text field is changes
                        onChanged: (val) {setState(() {email = val;} ); },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Email: ' + email + '\nPassword: ' + password);
                          //Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text('Log In'),
                      )
                    ],
            )))));
  }
}
