import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_4/Map_integration.dart';
import 'package:taskproject/WEEK_4/sand%20service/Email.dart';
import 'package:taskproject/main.dart';
import 'WEEK_4/lazy loading/lazy loading.dart';
import 'WEEK_4/sand service/Seravice.dart';

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
                    "lazy loading",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Map_integration();
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
                    "Map_integration",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Sand_Service();
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
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
                    "Sand Email/Call/Sms",
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
