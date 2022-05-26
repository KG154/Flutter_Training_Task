import 'package:flutter/material.dart';
import 'WEEK_9/1_Authentication/LoginScrenn.dart';
import 'WEEK_9/2_RealTime Database/R_Singup.dart';
import 'WEEK_9/3_Firestore database/F_LoginScreen.dart';
import 'WEEK_9/Local Notification/Local_NotificationScreen.dart';
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
          "Week 9",
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
                    return LoginScreen();
                  },
                ));
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Local_NotificationScreen();
                  },
                ));
              },
              child: commonContainer(title: "Local Notification", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}
