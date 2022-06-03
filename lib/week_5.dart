import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'WEEK_5/Audio Player/Audio_Player List Page .dart';
import 'WEEK_5/G_F_Login/HomeScreen.dart';
import 'WEEK_5/G_F_Login/loginScrenn.dart';
import 'WEEK_5/Google-Facebook/faceBookLogin.dart';
import 'WEEK_5/Video Player/Video Player List Page.dart';
import 'Widget/commonWidget.dart';

class Week5 extends StatefulWidget {
  const Week5({Key? key}) : super(key: key);

  @override
  State<Week5> createState() => _Week5State();
}

class _Week5State extends State<Week5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 5",
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
                    return Audio_Player();
                  },
                ));
              },
              child: commonContainer(
                title: "Audio player",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const videoPlayerDemo_();
                  },
                ));
              },
              child: commonContainer(
                title: "Video player",
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/Social_Media_Login');
            //   },
            //   child: commonContainer(
            //     title: "Google",
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => FaceBookLoginDemo(),
            //       ),
            //     );
            //   },
            //   child: commonContainer(
            //     title: "Facebook",
            //   ),
            // ),
            InkWell(
              onTap: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => G_F_Screen(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sigin_In_Screnn(),
                    ),
                  );
                }
              },
              child: commonContainer(
                title: "Social Media Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
