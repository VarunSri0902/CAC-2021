import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,

    //Border created if the text field is enabled
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),

    //Border created if the text field is being updated
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0)),

    //Border created when there is an error
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)));

final appBar = AppBar(
  title: Text(
    'App Title',
    style: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  centerTitle: true,
  backgroundColor: Colors.cyanAccent[100],
);
