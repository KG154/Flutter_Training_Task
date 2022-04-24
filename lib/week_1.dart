import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WEEK_1/what is flutter.dart';
import 'WEEK_1/flutter_Life_cycle.dart';

class Week1 extends StatefulWidget {
  const Week1({Key? key}) : super(key: key);

  @override
  _Week1State createState() => _Week1State();
}

class _Week1State extends State<Week1> {
  String _url = 'https://docs.flutter.dev/get-started/install';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Week 1",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Container(
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
                      return First();
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
                    // gradient: LinearGradient(
                    //   colors: [Color(0xFFD62828), Color(0xFFF77F00)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
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
                  child:  Center(
                    child: Text(
                      "What is Flutter",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    ),
                  ),
              ),
              InkWell(
                onTap: () {
                  _launchURL();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: LinearGradient(
                    //   colors: [Color(0xFFD62828), Color(0xFFF77F00)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
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
                      "Install Flutter",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Six();
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
                    ),                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFFD62828), Color(0xFFF77F00)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
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
                      "View controller",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/pag1');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFFD62828), Color(0xFFF77F00)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
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
                      "Navigation",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
