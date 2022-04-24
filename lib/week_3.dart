import 'package:flutter/material.dart';
import 'WEEK_3/Gestures.dart';
import 'WEEK_3/Image Picker.dart';
import 'WEEK_3/Api/calling web services.dart';

class Week3 extends StatefulWidget {
  const Week3({Key? key}) : super(key: key);

  @override
  State<Week3> createState() => _Week3State();
}

class _Week3State extends State<Week3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 3",
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
                    return const Gestures1();
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
                  // gradient: const LinearGradient(
                  //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
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
                    "Gestures",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ImagePicker1();
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
                  // gradient: const LinearGradient(
                  //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
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
                    "Image Picker",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/SqfLite');

                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const SqfLite();
                //   },
                // ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  // gradient: const LinearGradient(
                  //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
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
                    "SqfLite",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const WebColling();
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
                  // gradient: const LinearGradient(
                  //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
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
                    "Calling Web",
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
