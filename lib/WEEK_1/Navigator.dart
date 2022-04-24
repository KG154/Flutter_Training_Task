import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Seven extends StatefulWidget {
  const Seven({Key? key}) : super(key: key);

  @override
  _SevenState createState() => _SevenState();
}

class _SevenState extends State<Seven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/pag2');
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                  border: Border.all(color: Colors.blue)),
              child: Text(
                "Page 1",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 25,
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
