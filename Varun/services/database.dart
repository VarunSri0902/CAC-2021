import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future createUserData(String username, int grade, String firstName) async {
    String post = 'Hello, my name is ' +
        username +
        ". I am in " +
        grade.toString() +
        "th grade";
    await userCollection.doc(username).set({'Name': firstName, 'Grade': grade});
    return await addPost(username, post);
  }

  Future addPost(String username, String post) async {
    CollectionReference userPostCollection =
        FirebaseFirestore.instance.collection('Users/' + username + '/Posts');
    return await userPostCollection.doc('Post1').set({
      'Post Body': post,
      'username': username,
      'timestamp': FieldValue.serverTimestamp()
    });
  }
}
