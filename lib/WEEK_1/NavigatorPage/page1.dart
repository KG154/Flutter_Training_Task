import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widget/commonWidget.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: commonButton(
                    width: 110,
                    height: 50,
                    title: "Go Back",
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/pag3');
                  },
                  child: commonButton(
                    width: 120,
                    height: 50,
                    title: "Next Page",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
