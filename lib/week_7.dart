import 'package:flutter/material.dart';

import 'WEEK_7/Custom Camera/camera Screen.dart';
import 'WEEK_7/In App Purchase/in App Purchase.dart';
import 'WEEK_7/Payment GateWays/Payment GateWays.dart';
import 'WEEK_7/refreshScrenn.dart';
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
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return refreshScrenn();
                  },
                ));
              },
              child: commonContainer(title: "Pull To Refresh", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return In_App_Purchase();
                  },
                ));
              },
              child: commonContainer(title: "In App Purchase", height: 75),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return payment_GetWays();
                //   },
                // ));
              },
              child: commonContainer(title: "payment GetWays", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}
