import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'WEEK_9&10/1_Authentication/LoginScrenn.dart';
import 'WEEK_9&10/1_Authentication/userMain_Screen/userMainScareen.dart';
import 'WEEK_9&10/2_RealTime Database/R_Singup.dart';
import 'WEEK_9&10/3_Firestore database/F_LoginScreen.dart';
import 'WEEK_9&10/Firebase Creshlytics.dart';
import 'WEEK_9&10/Local Notification/Local_NotificationScreen.dart';
import 'WEEK_9&10/Page Link.dart';
import 'WEEK_9&10/dynamikLink.dart';
import 'Widget/commonWidget.dart';

class Week9 extends StatefulWidget {
  const Week9({Key? key}) : super(key: key);

  @override
  State<Week9> createState() => _Week9State();
}

class _Week9State extends State<Week9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 9 & 10",
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
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return userMainScareen();
                    },
                  ));
                }
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return LoginScreen();
                //   },
                // ));
              },
              child: commonContainer(title: "Authentication", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return R_SignUpScreen();
                  },
                ));
              },
              child: commonContainer(title: "Realtime database", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return F_LoginScreen();
                  },
                ));
              },
              child: commonContainer(title: "FireStore database", height: 75),
            ),
            InkWell(
              onTap: () async {
                await FirebaseAnalytics.instance.logEvent(
                  name: "local_notification_Screen",
                  parameters: {
                    "localnotificationScreen": "Success",
                  },
                );
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Local_NotificationScreen();
                  },
                ));
              },
              child: commonContainer(title: "Local Notification", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return dynamic_Link();
                  },
                ));
              },
              child: commonContainer(title: "Dynamic Link", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Page_Link();
                  },
                ));
              },
              child: commonContainer(title: "Page Dynamic Link", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Firebase_Crashlytics();
                  },
                ));
              },
              child: commonContainer(title: "Firebase Crashlytics", height: 75),
            ),

          ],
        ),
      ),
    );
  }
}
