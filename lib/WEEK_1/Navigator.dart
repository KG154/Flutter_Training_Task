import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskproject/Widget/commonWidget.dart';

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
            child: commonButton(
              width: 100,
              height: 50,
              title: "Page 1",
            ),
          ),
        ),
      ),
    );
  }
}
