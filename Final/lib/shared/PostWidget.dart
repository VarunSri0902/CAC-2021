import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/pages/addReply.dart';
import 'package:test_app1/pages/viewPost.dart';
import 'package:test_app1/services/database.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

class Post extends StatelessWidget {
  final String location;
  Post({Key? key, required this.location}) : super(key: key);

  Future getPost() async {
    return await DatabaseService().getPost(location);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPost(),
      builder: (_, doc) {
        if (doc.connectionState == ConnectionState.done) {
          dynamic data = doc.data;

          String username = data['username'];
          String body = data['Post Body'];
          String docID = data['id'];
          dynamic date = data['timestamp'].toDate();
          var dateFormat = DateFormat('hh:mm aaa | EEE, MMM d | ' 'yyyy')
              .format(DateTime.parse(date.toString()));

          return Container(
            padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 2),
            decoration: postDecoration,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Lobster'),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(body,
                      style: TextStyle(fontSize: 16, fontFamily: 'Playfair')),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(dateFormat.toString(),
                          style:
                              TextStyle(fontSize: 12, fontFamily: 'Playfair')),
                    ),
                    SizedBox(
                      height: 30,
                      width: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(246, 178, 107, 1),
                        ),
                        child: Text(
                          'Reply',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Lobster',
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewPost(
                                      category: location.split('/')[1],
                                      docID: docID)));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return Text('Loading');
      },
    );
  }
}

class PostView extends StatelessWidget {
  final String location;
  PostView({Key? key, required this.location}) : super(key: key);

  Future getPost() async {
    return await DatabaseService().getPost(location);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPost(),
      builder: (_, doc) {
        if (doc.connectionState == ConnectionState.done) {
          dynamic data = doc.data;

          String username = data['username'];
          String body = data['Post Body'];
          dynamic date = data['timestamp'].toDate();
          var dateFormat = DateFormat('hh:mm aaa | EEE, MMM d | ' 'yyyy')
              .format(DateTime.parse(date.toString()));

          return Container(
            padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 2),
            decoration: postDecoration,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Lobster'),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    body,
                    style: TextStyle(fontSize: 26, fontFamily: 'Playfair'),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dateFormat.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Playfair',
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(246, 178, 107, 1),
                          ),
                          child: Text(
                            'Reply',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lobster',
                                color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddReply(
                                        location: location + '/Replies')));
                          }),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Text('Loading');
      },
    );
  }
}

class Reply extends StatelessWidget {
  final String location;
  const Reply({Key? key, required this.location}) : super(key: key);

  Future getReply() async {
    return await DatabaseService().getReply(location);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getReply(),
      builder: (_, doc) {
        if (doc.connectionState == ConnectionState.done) {
          dynamic data = doc.data;

          String username = data['username'];
          String body = data['Reply Body'];
          dynamic date = data['timestamp'].toDate();
          var dateFormat = DateFormat('hh:mm aaa | EEE, MMM d | ' 'yyyy')
              .format(DateTime.parse(date.toString()));

          return Container(
            padding: EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 2),
            decoration: postDecoration,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(40.0, 0, 10.0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Lobster'),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    body,
                    style: TextStyle(fontSize: 20, fontFamily: 'Playfair'),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(dateFormat.toString(),
                          style:
                              TextStyle(fontSize: 12, fontFamily: 'Playfair')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        }
        return Text('Loading');
      },
    );
  }
}
