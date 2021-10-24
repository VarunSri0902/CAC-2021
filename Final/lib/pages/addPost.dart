import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/services/database.dart';
import 'package:test_app1/shared/constants.dart';

class AddPost extends StatefulWidget {
  final String category;
  const AddPost({Key? key, required this.category}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final DatabaseService db = DatabaseService();

  //text field value
  String body = '';
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  final _addPostKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String location = 'Posts/' + widget.category + '/Posts';
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
          child: Center(
            child: Form(
              key: _addPostKey,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter in your post'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) {
                      setState(() {
                        body = val;
                      });
                    },

                    // Check if the field is empty
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a body for your post';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_addPostKey.currentState!.validate()) {
                          dynamic result = await db.addPost(body, location);
                          if (result != null) {
                            print(result.toString());
                            setState(() {
                              error = 'Could not post';
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(246, 178, 107, 1)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Text(
                          'Post',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Lobster',
                          ),
                        ),
                      )),
                  SizedBox(height: 12),
                  Text(
                    error,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
