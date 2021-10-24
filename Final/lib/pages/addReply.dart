import 'package:flutter/material.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:test_app1/services/database.dart';
import 'package:test_app1/pages/viewPost.dart';

class AddReply extends StatefulWidget {
  final String location;
  const AddReply({Key? key, required this.location}) : super(key: key);

  @override
  _AddReplyState createState() => _AddReplyState();
}

class _AddReplyState extends State<AddReply> {
  final DatabaseService db = DatabaseService();

  //text field value
  String body = '';
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  final _addReplyKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
          child: Center(
            child: Form(
              key: _addReplyKey,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Enter in your reply'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (val) {
                      setState(() {
                        body = val;
                      });
                    },

                    // Check if the field is empty
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a body for your reply';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_addReplyKey.currentState!.validate()) {
                          dynamic result =
                              await db.addReply(body, widget.location);
                          if (result != null) {
                            setState(() {
                              error = 'Could not reply';
                            });
                          } else {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewPost(
                                        category: widget.location.split("/")[1],
                                        docID: widget.location.split("/")[3])));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(246, 178, 107, 1)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: Text(
                          'Reply',
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
