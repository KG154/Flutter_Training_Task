import 'package:flutter/material.dart';

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
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),),
        child: Center(
          child:                 InkWell(
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/pag2'));
              // Navigator.of(context).pushNamedAndRemoveUntil('/pag2', (route) => false);

            },
            child: Container(
              width: 210,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black54,
                        Color.fromRGBO(0, 41, 102, 1)
                      ]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                  border: Border.all(color: Colors.blue)),
              child: Text(
                "Go To Second Page",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
