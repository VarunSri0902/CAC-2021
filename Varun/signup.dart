import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //text field state
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        //Email Input
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter a valid email',
                          ),

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

                        //Password Inpuut
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
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
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('all good');
                              //Navigator.pushReplacementNamed(context, '/home');
                            }
                          },
                          child: Text('Sign Up'),
                        )
                      ],
                    )))));
  }
}
