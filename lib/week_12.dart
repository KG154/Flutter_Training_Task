import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_12/Redux/Redux1_Screen.dart';

import 'WEEK_12/Bloc/homeBlocScreen.dart';
import 'WEEK_12/provider/firstproviderScreen.dart';
import 'Widget/commonWidget.dart';

class Week12 extends StatefulWidget {
  const Week12({Key? key}) : super(key: key);

  @override
  State<Week12> createState() => _Week12State();
}

class _Week12State extends State<Week12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 12",
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
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(
          //       builder: (context) {
          //         return BlocPage();
          //       },
          //     ));
          //   },
          //   child: commonContainer(title: "blocs", height: 75),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(
          //       builder: (context) {
          //         return ProviderDemo();
          //       },
          //     ));
          //   },
          //   child: commonContainer(title: "Provider", height: 75),
        // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return Redux1_Screen();
            //       },
            //     ));
            //   },
            //   child: commonContainer(title: "Redux", height: 75),
            // ),
          ],
      ),
    ),);
  }
}
