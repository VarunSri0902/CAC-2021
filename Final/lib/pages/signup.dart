import 'package:flutter/material.dart';
import 'package:test_app1/services/auth.dart';
import 'package:test_app1/shared/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  //text field state
  String name = '';
  String userName = '';
  int grade = 0;
  String email = '';
  String password = '';
  String error = '';

  final _signInformKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
            child: Center(
                child: Form(
                    key: _signInformKey,
                    child: Column(
                      children: <Widget>[
                        //First Name Input
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'First Name'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },

                          // Check if the field is empty
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),

                        //Username Input
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Username'),
                          onChanged: (val) {
                            setState(() {
                              userName = val;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // Check if the field is empty
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an username';
                            }
                            return null;
                          },
                        ),

                        //Grade Input
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Grade'),
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            setState(() {
                              grade = int.parse(val);
                            });
                          },
                          validator: (value) {
                            // Check if the field is empty
                            if (value == null || value.isEmpty) {
                              return 'Please enter your grade';
                            }
                            //Check if field is in grade range
                            else if (int.parse(value) < 6 ||
                                int.parse(value) > 12) {
                              return 'You must be between 6th and 12th grade';
                            }
                            return null;
                          },
                        ),

                        //Email Input
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // Check if the field is empty
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),

                        //Password Input
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password must contain 8 or more characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_signInformKey.currentState!.validate()) {
                                dynamic result = await _auth.registerEmail(
                                    email, password, userName, name, grade);
                                if (result == null) {
                                  setState(() {
                                    error = 'Could not create an account';
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
                                'Sign Up',
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
