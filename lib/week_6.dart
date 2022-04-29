import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_6/sharing.dart';

import 'WEEK_6/Share with default intent.dart';

class Week6 extends StatefulWidget {
  const Week6({Key? key}) : super(key: key);

  @override
  State<Week6> createState() => _Week6State();
}

class _Week6State extends State<Week6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 6",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 5),
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const sharingScreen();
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                height: 75,
                child: const Center(
                  child: Text(
                    "sharing",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const share_with_default_intent();
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                height: 75,
                child: const Center(
                  child: Text(
                    "Share with default intent",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
