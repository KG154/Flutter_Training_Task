import 'package:flutter/material.dart';

class newSecondScreen extends StatefulWidget {
  const newSecondScreen({Key? key}) : super(key: key);

  @override
  State<newSecondScreen> createState() => _newSecondScreenState();
}

class _newSecondScreenState extends State<newSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back"),
      ),
      body: Center(
        child: Text(
          "Api Calling Success",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
