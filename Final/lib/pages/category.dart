import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:test_app1/shared/PostWidget.dart';
import 'package:test_app1/pages/addPost.dart';

class CategoryPosts extends StatefulWidget {
  final String category;
  final String description;
  const CategoryPosts(
      {Key? key, required this.category, required this.description})
      : super(key: key);

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
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.category;
    String description = widget.description;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            category,
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.orange[300],
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster',
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: 'Playfair',
              ),
            ),
          ),
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(246, 178, 107, 1),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddPost(category: category)))
                .then((value) => setState(() {}));
          }),
    );
  }
}
