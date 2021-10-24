import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app1/services/database.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign up with email and password
  Future registerEmail(String email, String password, String username,
      String name, int grade) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Create document for user
      dynamic user = result.user;
      await user.updateProfile(displayName: username);
      await DatabaseService().createUserData(username, grade, name);

      //Return user data
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // log in with email and password
  Future logInEmail(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
