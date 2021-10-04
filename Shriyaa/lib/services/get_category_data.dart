import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/pages/choose_location.dart';
import 'package:gtk_flutter/pages/details.dart';
import 'package:gtk_flutter/model/cat.dart';



class GetCategoryData extends StatefulWidget {
  @override
  _GetCategoryDataState createState() => _GetCategoryDataState();
}

class _GetCategoryDataState extends State<GetCategoryData> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('topics').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(
                  data['text'],
                  style: TextStyle(
                    fontSize: 20
                  )
              ),
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: {
                  'catagory': data['text']
                });
               /* Navigator.push(
                    context,
                    new MaterialPageRoute<dynamic>(
                      builder: (context) => Details(cat: new Cat(data['text'],''))
                    )
                );*/
              },
            );
          }).toList(),
        );
      },
    );
  }
}