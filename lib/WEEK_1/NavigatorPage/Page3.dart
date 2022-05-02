import 'package:flutter/material.dart';

import '../../Widget/commonWidget.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/pag2'));
              // Navigator.of(context).pushNamedAndRemoveUntil('/pag2', (route) => false);
            },
            child: commonButton(
              width: 210,
              height: 50,
              title: "Go To Second Page",
            ),
          ),
        ),
      ),
    );
  }
}
