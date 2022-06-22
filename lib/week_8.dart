import 'package:flutter/material.dart';
import 'package:taskproject/week_1.dart';

import 'WEEK_8/ActionSheet & popover controller.dart';
import 'WEEK_8/Responsive apps/UiScreen.dart';
import 'WEEK_8/animation.dart';
import 'WEEK_8/localization/localization.dart';
import 'WEEK_8/manage image.dart';
import 'Widget/commonWidget.dart';

class Week8 extends StatefulWidget {
  const Week8({Key? key}) : super(key: key);

  @override
  State<Week8> createState() => _Week8State();
}

class _Week8State extends State<Week8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 8",
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
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                          alignment: Alignment.center,
                          scale: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return animationsScreen();
                      },
                    ));
              },
              child:
                  commonContainer(title: "animations/Material UI", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ResponsiveScreen();
                  },
                ));
              },
              child: commonContainer(
                  title: "Portrait & landscape orientation", height: 75),
            ),

            // InkWell(
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(
            //     //   builder: (context) {
            //     //     return localizationScreen();
            //     //   },
            //     // ));
            //   },
            //   child: commonContainer(title: "localization", height: 75),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return manage_Image();
                  },
                ));
              },
              child: commonContainer(title: "1x,2x,3x image", height: 75),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ActionSheet_popover();
                  },
                ));
              },
              child:
                  commonContainer(title: "ActionSheet & popover", height: 75),
            ),
          ],
        ),
      ),
    );
  }
}
