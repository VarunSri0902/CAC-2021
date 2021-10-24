import 'package:flutter/material.dart';
import 'package:test_app1/pages/category.dart';
import 'package:test_app1/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app1/services/database.dart';

class Home extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseService db = new DatabaseService();

  Home({Key? key}) : super(key: key);

  final categories = [
    "Let’s Connect",
    "Homework Help",
    "Clubs",
    "Sports",
    "Events",
    "How are you feeling today"
  ];

  final catDescriptions = [
    "Get in touch with like-minded students based on your interests and hobbies. You get to know real people, unblind their profiles. Unlike other apps, no profile picture is visible, You are anonymous. It’s only your true self that matters. ",
    "Get help on a homework problem or a concept you are struggling with. This feature allows you to be a part of an online community of students that helps each other learn and grow.",
    "Forum to either promote your Club’s activities or learn about the fun activities organized by the clubs.",
    "Follow your favorite high school teams and get alerted when new information is available. Find schedules, scores, rosters, stats and standings. Get push notifications for game scores and when your favorite teams update their sports information.",
    "Never miss a school event, receive alerts when information about a new event is available.",
    "Feeling stressed out, overwhelmed or lonely? Not sure how you’re feeling? This is a safe place to share your feelings."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (_, index) {
              return Column(children: [
                SizedBox(
                  height: 20,
                  width: 200,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPosts(
                                    category: categories[index],
                                    description: catDescriptions[index],
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(246, 178, 107, 1),
                        fixedSize: Size(275, 50)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    ))
              ]);
            },
          ),
        ));
  }
}
