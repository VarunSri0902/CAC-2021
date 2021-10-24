import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:test_app1/shared/PostWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewPost extends StatefulWidget {
  final String category;
  final String docID;
  const ViewPost({Key? key, required this.category, required this.docID})
      : super(key: key);

  @override
  _ViewPostState createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  Future getViewPost(String location) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(location)
        .orderBy('timestamp', descending: true)
        .get();
    return snapshot.docs;
  }

  Future getReplies(String location) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(location)
        .orderBy('timestamp', descending: true)
        .get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    String location = 'Posts/' + widget.category + '/Posts/' + widget.docID;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          FutureBuilder(
              future: getViewPost(location),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return PostView(
                    location: location,
                  );
                }
                return Text('Loading ...');
              }),
          FutureBuilder(
              future: getReplies(location + '/Replies'),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  dynamic docs = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (_, index) {
                        dynamic document = docs[index];
                        String replyLoc =
                            location + '/Replies/' + document.data()['id'];
                        return Reply(
                          location: replyLoc,
                        );
                      });
                }
                return Text('Loading ...');
              }),
        ],
      ),
    );
  }
}
