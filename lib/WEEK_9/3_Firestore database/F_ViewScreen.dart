import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'F_UpdateScreen.dart';

class F_ViewScreen extends StatefulWidget {
  const F_ViewScreen({Key? key}) : super(key: key);

  @override
  State<F_ViewScreen> createState() => _F_ViewScreenState();
}

class _F_ViewScreenState extends State<F_ViewScreen> {
  CollectionReference student =
      FirebaseFirestore.instance.collection("student");

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("student").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                data['id'] = document.id;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    // height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurpleAccent.shade100,
                          Colors.deepPurpleAccent.shade200,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data['status'],
                                  style: TextStyle(
                                      color: data['status'] == 'Done'
                                          ? Colors.green.shade900
                                          : Colors.red.shade900),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return F_UpdateScreen(
                                              Title: data['title'],
                                              Description: data['Description'],
                                              // Create_Date: data['Create_Date'],
                                              End_Date: data['End_Date'],
                                              status: data['status'],
                                              UId: data['id'],
                                            );
                                          },
                                        ));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteuser(data['id']);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.key,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                data['id'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.title,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                data['title'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10, bottom: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.description,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                data['Description'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "${data['Create_Date']}   -   ${data['End_Date']}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Future<void> deleteuser(id) async {
    return await student
        .doc(id)
        .delete()
        .then(
          (value) => print("User Delete"),
        )
        .catchError((onError) => print("Failed To Delete User ${onError}"));
  }
}
