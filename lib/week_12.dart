import 'package:flutter/material.dart';

import 'Widget/commonWidget.dart';

class Week12 extends StatefulWidget {
  const Week12({Key? key}) : super(key: key);

  @override
  State<Week12> createState() => _Week12State();
}

class _Week12State extends State<Week12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 12",
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
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return SliverScreen();
                //   },
                // ));
              },
              child: commonContainer(title: "blocs", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}