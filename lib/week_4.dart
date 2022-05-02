import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_4/Map_integration.dart';
import 'package:taskproject/WEEK_4/sand%20service/Email.dart';
import 'package:taskproject/main.dart';
import 'WEEK_4/lazy loading/lazy loading.dart';
import 'WEEK_4/sand service/Seravice.dart';
import 'Widget/commonWidget.dart';

class Week4 extends StatefulWidget {
  const Week4({Key? key}) : super(key: key);

  @override
  State<Week4> createState() => _Week4State();
}

class _Week4State extends State<Week4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 4",
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
                    return lazy_loading();
                  },
                ));
              },
              child: commonContainer(
                title: "lazy loading",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Map_integration();
                  },
                ));
              },
              child: commonContainer(
                title: "Map_integration",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Sand_Service();
                  },
                ));
              },
              child: commonContainer(
                title: "Sand Email/Call/Sms",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
