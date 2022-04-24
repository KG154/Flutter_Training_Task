import 'package:flutter/material.dart';

class Radio1 extends StatefulWidget {
  const Radio1({Key? key}) : super(key: key);

  @override
  State<Radio1> createState() => _Radio1State();
}

class _Radio1State extends State<Radio1> {
  String choi = "";
  var nam = '';
  bool bb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Column(
          children: [
            RadioListTile(

                // tileColor: Colors.white,
                title: Text(
                  'Male',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: "Male",
                groupValue: choi,
                toggleable: true,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    choi = value.toString();
                    bb = false;
                  });
                }),
            RadioListTile(
                title: Text('Female',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                value: "Female",
                activeColor: Colors.green,
                groupValue: choi,
                toggleable: true,
                onChanged: (value) {
                  setState(() {
                    choi = value.toString();
                    bb = false;
                  });
                }),
            RadioListTile(
                title: Text('Other',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                value: "Other",
                activeColor: Colors.green,
                groupValue: choi,
                toggleable: true,
                onChanged: (value) {
                  setState(() {
                    choi = value.toString();
                    bb = false;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    nam = choi;
                    bb = true;
                  });
                },
                child: Text("Submit")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${nam}",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            // Text(bb ? nam : no),
          ],
        ),
      ),
    );
  }
}
