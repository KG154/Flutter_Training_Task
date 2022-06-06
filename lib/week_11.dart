import 'package:flutter/material.dart';

import 'WEEK_11/Flutter SliverScreen.dart';
import 'WEEK_11/save files/get files from local.dart';
import 'Widget/commonWidget.dart';

class Week11 extends StatefulWidget {
  const Week11({Key? key}) : super(key: key);

  @override
  State<Week11> createState() => _Week11State();
}

class _Week11State extends State<Week11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 11",
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
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SliverScreen();
                  },
                ));
              },
              child: commonContainer(title: "Flutter Sliver", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return file_Screen();
                  },
                ));
              },
              child: commonContainer(
                  title: "save files/get files from local", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}
