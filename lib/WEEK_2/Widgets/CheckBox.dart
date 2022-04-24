import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chechbox1 extends StatefulWidget {
  const Chechbox1({Key? key}) : super(key: key);

  @override
  State<Chechbox1> createState() => _Chechbox1State();
}

class _Chechbox1State extends State<Chechbox1> {
  final allcheck = CheckBoxModal(title: 'All Select');
  final CheckBoxList = [
    CheckBoxModal(
      title: "one",
    )
  ];
  List<String> list = [
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
    "tree",
    "foure",
    "five"
  ];

  late List<bool> _isChecked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isChecked = List<bool>.filled(list.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Box'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              tileColor: Colors.white,
              title: Text(
                list[index],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: _isChecked[index],
              onChanged: (value) {
                setState(() {
                  _isChecked[index] = value!;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class CheckBoxModal {
  String title;
  bool value;

  CheckBoxModal({required this.title, this.value = false});
}
