import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_7/Custom%20Camera/camera%20Screen.dart';

import 'Widget/commonWidget.dart';

class Week7 extends StatefulWidget {
  const Week7({Key? key}) : super(key: key);

  @override
  State<Week7> createState() => _Week7State();
}

class _Week7State extends State<Week7> {
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
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CameraScreen();
                  },
                ));
              },
              child: commonContainer(title: "Camera", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}
