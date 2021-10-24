import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final db = FirebaseFirestore.instance;

  Future createUserData(String username, int grade, String firstName) async {
    CollectionReference userCollection = db.collection('Users');
    return await userCollection
        .doc(username)
        .set({'Name': firstName, 'Grade': grade});
  }

  Future addUserPost(String location) async {
    dynamic user = FirebaseAuth.instance.currentUser;
    String username = user.displayName;

    CollectionReference userPostCollection =
        db.collection('Users/' + username + '/Posts');
    DocumentReference userPostRef = userPostCollection.doc();
    return await userPostRef.set({'reference': location});
  }

  Future addPost(String post, String location) async {
    dynamic user = FirebaseAuth.instance.currentUser;
    String username = user.displayName;

    CollectionReference postCollection = db.collection(location);

    DocumentReference postRef = postCollection.doc();

    DocumentSnapshot postDoc = await postRef.get();
    String id = postDoc.reference.id;

    addUserPost(location + '/' + id);
    return await postRef.set({
      'Post Body': post,
      'username': username,
      'timestamp': FieldValue.serverTimestamp(),
      'id': id,
    });
  }

  Future addReply(String reply, String location) async {
    dynamic user = FirebaseAuth.instance.currentUser;
    String username = user.displayName;

    CollectionReference postCollection = db.collection(location);

    DocumentReference postRef = postCollection.doc();

    DocumentSnapshot postDoc = await postRef.get();
    String id = postDoc.reference.id;

    return await postRef.set({
      'Reply Body': reply,
      'username': username,
      'timestamp': FieldValue.serverTimestamp(),
      'id': id,
    });
  }

  Future getPost(String location) async {
    DocumentSnapshot doc = await db.doc(location).get();
    return doc.data();
  }

  Future getReply(String location) async {
    DocumentSnapshot doc = await db.doc(location).get();
    return doc.data();
  }
}
