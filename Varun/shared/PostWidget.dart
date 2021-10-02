import 'package:flutter/material.dart';
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(body, style: TextStyle(fontSize: 20)),
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
                          style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(
                      height: 30,
                      width: 65,
                      child: ElevatedButton(
                        child: Text(
                          'Reply',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        onPressed: () {
                          // Will go to View Post page later, just for testing
                          print('Reply: ' + docID);
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
