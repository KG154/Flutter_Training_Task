import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_6/Admob_Facebook%20Ads/ADS.dart';
import 'package:taskproject/WEEK_6/sharing.dart';
import 'package:taskproject/Widget/commonWidget.dart';

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
              child: commonContainer(
                title: "sharing",
                height: 75
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
              child: commonContainer(
                title: "Share with default intent",
                height: 75
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Ads();
                  },
                ));
              },
              child: commonContainer(
                title: "ADS",
                height: 75
              ),
            ),

          ],
        ),
      ),
    );
  }
}
