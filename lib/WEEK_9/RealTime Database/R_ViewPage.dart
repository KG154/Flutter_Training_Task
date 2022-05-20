import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class R_ViewPage extends StatefulWidget {
  const R_ViewPage({Key? key}) : super(key: key);

  @override
  State<R_ViewPage> createState() => _R_ViewPageState();
}

class _R_ViewPageState extends State<R_ViewPage> {
  final databaseRef = FirebaseDatabase.instance.reference().child("Employee");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View RealTime Data",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: FirebaseAnimatedList(
        defaultChild: Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurpleAccent,
          ),
        ),
        query: databaseRef,
        shrinkWrap: true,
        itemBuilder: (context, DataSnapshot snapshot, animation, index) {
          final a = Map.from(json.decode(json.encode(snapshot.value)));
          print(a["name"]);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              // height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurpleAccent.shade200,
                    Colors.deepPurpleAccent.shade100,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 10,
                        ),
                        Text(a['name']),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text(a['email']),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Icon(Icons.work_outline_sharp),
                        SizedBox(
                          width: 10,
                        ),
                        Text(a['designation']),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone),
                            SizedBox(
                              width: 10,
                            ),
                            Text(a['phone']),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Icon(Icons.currency_rupee_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text(a['salary']),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(Icons.transgender),
                        SizedBox(
                          width: 10,
                        ),
                        Text(a['gender']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
