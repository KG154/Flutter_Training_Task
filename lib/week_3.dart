import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_3/Gestures1.dart';
import 'WEEK_3/Gestures.dart';
import 'WEEK_3/Gestures1.dart';
import 'WEEK_3/Image Picker.dart';
import 'WEEK_3/Api/calling web services.dart';
import 'Widget/commonWidget.dart';

class Week3 extends StatefulWidget {
  const Week3({Key? key}) : super(key: key);

  @override
  State<Week3> createState() => _Week3State();
}

class _Week3State extends State<Week3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 3",
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
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
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
                    return const Gestures1();
                  },
                ));
              },
              child: commonContainer(
                title: "Gestures",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ImagePicker1();
                  },
                ));
              },
              child: commonContainer(
                title: "Image Picker",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/SqfLite');
              },
              child: commonContainer(
                title: "SqfLite",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const WebColling();
                  },
                ));
              },
              child: commonContainer(
                title: "Calling Web",
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return allGestures();
            //       },
            //     ));
            //   },
            //   child: commonContainer(
            //     title: "Gestures1",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
