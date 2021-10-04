import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; // new

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/widgets.dart';
import '../src/authentication.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

  class _HomeState extends State<Home> {

  Map data = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //data = ModalRoute.of(context)?.settings?.arguments as Map;

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/category');
      }
    });

    return Scaffold(
        appBar: AppBar(
            title: Text('Student Discuss')),
        body: ChangeNotifierProvider(
            create: (context) => ApplicationState(),
            builder: (context, _) => SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    Image.asset('assets/codelab.png'),
                   /* FlatButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/location');
                        },
                        icon: Icon(Icons.edit_location),
                        label: Text(
                            'Edit Location'
                        )
                    ),*/
                    SizedBox(height: 8.0),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 16.0,
                        )
                    ),*/
                    // Add from here
                    Consumer<ApplicationState>(
                      builder: (context, appState, _) => Authentication(
                        email: appState.email,
                        loginState: appState.loginState,
                        startLoginFlow: appState.startLoginFlow,
                        verifyEmail: appState.verifyEmail,
                        signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                        cancelRegistration: appState.cancelRegistration,
                        registerAccount: appState.registerAccount,
                        signOut: appState.signOut,
                      ),
                    ),
                    // to here
                  ],
                ),
            ),
        ),
      );
    }

}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    //await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        //Navigator.pushNamed(context, '/location');


      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  ApplicationLoginState get loginState => _loginState;

  String? _email;

  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(String email,
      void Function(FirebaseAuthException e) errorCallback,) async {
    try {
      var methods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}