import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:test_app1/shared/PostWidget.dart';

class CategoryPosts extends StatefulWidget {
  final String category;
  const CategoryPosts({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPostsState createState() => _CategoryPostsState();
}

class _CategoryPostsState extends State<CategoryPosts> {
  Future getPosts() async {
    String location = 'Posts/' + widget.category + '/Posts';
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(location)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs;
    //print(doc[0].data());
    //print(doc[1].data()['id']);
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.category;

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: appBar,
      body: Column(
        children: [
          Text(category,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 20.0,
          ),
          FutureBuilder(
              future: getPosts(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  dynamic docs = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (_, index) {
                        dynamic document = docs[index];
                        String location = 'Posts/' +
                            category +
                            '/Posts/' +
                            document.data()['id'];
                        return Post(
                          location: location,
                        );
                      });
                }
                return Text('Loading');
              }),
        ],
      ),
    );
  }
}
