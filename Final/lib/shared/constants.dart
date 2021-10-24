import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
    fillColor: Colors.blueGrey.shade100,
    filled: true,

    //Border created if the text field is enabled
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey.shade100, width: 2.0)),

    //Border created if the text field is being updated
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0)),

    //Border created when there is an error
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)));

final postDecoration = BoxDecoration(
    color: Colors.blue[100],
    border: Border.all(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20)));

final initialAppBar = AppBar(
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [logo],
  ),
  centerTitle: true,
  backgroundColor: Colors.transparent,
);

final appBar = AppBar(
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        'WeConnect',
        style: TextStyle(
          fontSize: 35.0,
          color: Color.fromRGBO(246, 178, 107, 1),
          fontFamily: 'Lobster',
        ),
      ),
      SizedBox(
        width: 50,
      ),
      logo
    ],
  ),
  leading: BackButton(),
  centerTitle: true,
  backgroundColor: Colors.transparent,
);

Image logo = new Image(
    image: new ExactAssetImage("lib/assets/logo.png"),
    height: 75.0,
    width: 75.0,
    alignment: FractionalOffset.centerRight);
