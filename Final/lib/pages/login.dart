import 'package:flutter/material.dart';
import 'package:test_app1/services/auth.dart';
import 'package:test_app1/shared/constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthService _auth = AuthService();
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  final _logInformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
                child: Form(
                    key: _logInformKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            }),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_logInformKey.currentState!.validate()) {
                                dynamic result =
                                    await _auth.logInEmail(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Could not log in';
                                  });
                                  print(error);
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(246, 178, 107, 1)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontFamily: 'Lobster',
                                ),
                              ),
                            )),
                        SizedBox(height: 20),
                        Text(
                          error,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )))));
  }
}
