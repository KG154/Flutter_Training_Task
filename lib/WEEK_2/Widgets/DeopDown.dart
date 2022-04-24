import 'package:flutter/material.dart';

class Drop1 extends StatefulWidget {
  const Drop1({Key? key}) : super(key: key);

  @override
  State<Drop1> createState() => _Drop1State();
}

class _Drop1State extends State<Drop1> {
  var dropvalue;

  List list = [
    "one",
    "two",
    "tree",
    "foure",
    "five",
    "six",
    "seven",
    "Eight",
    "kishan",
    "jydeep",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white, border: Border.all()),
                child: DropdownButton(
                    value: dropvalue,
                    iconSize: 24,
                    // elevation: 16,
                    hint: Text('Select Your Chioce'),
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: list.map((list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(list),
                      );
                    }).toList(),
                    onChanged: (drop) {
                      setState(() {
                        dropvalue = drop.toString();
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
