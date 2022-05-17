import 'package:flutter/material.dart';

class manage_Image extends StatefulWidget {
  const manage_Image({Key? key}) : super(key: key);

  @override
  State<manage_Image> createState() => _manage_ImageState();
}

class _manage_ImageState extends State<manage_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "1x,2x,3x image",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset("Images/select_job_ic.png"),
          ),
          Center(
            child: Image.asset("Images/2x/select_job_ic.png"),
          ),
          Center(
            child: Image.asset("Images/3x/select_job_ic.png"),
          ),
        ],
      ),
    );
  }
}
