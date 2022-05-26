import 'package:flutter/material.dart';

import 'WEEK_5/Audio Player/Audio_Player List Page .dart';
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
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/Social_Media_Login');
              },
              child: commonContainer(
                title: "Google",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaceBookLoginDemo(),
                  ),
                );
              },
              child: commonContainer(
                title: "Facebook",
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => Media_Login()));
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.elliptical(70, 70),
            //         bottomLeft: Radius.elliptical(70, 70),
            //       ),
            //       border: Border.all(width: 1.0, color: Colors.blue),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.black87.withOpacity(0.3),
            //             blurRadius: 1,
            //             offset: Offset(0, 1),
            //             spreadRadius: 1)
            //       ],
            //     ),
            //     height: 75,
            //     child: const Center(
            //       child: Text(
            //         "Social Media Login",
            //         style: TextStyle(fontSize: 25, color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
