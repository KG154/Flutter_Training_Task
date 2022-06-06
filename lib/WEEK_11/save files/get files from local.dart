import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../Widget/commonWidget.dart';

class file_Screen extends StatefulWidget {
  const file_Screen({Key? key}) : super(key: key);

  @override
  State<file_Screen> createState() => _file_ScreenState();
}

class _file_ScreenState extends State<file_Screen> {
  TextEditingController tname = TextEditingController();
  TextEditingController tdoc = TextEditingController();
  bool namestatus = false;
  bool docstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "save files/get files from local",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: commonTextField(
                controller: tname,
                onchange: (value) {
                  setState(() {
                    namestatus = false;
                  });
                },
                color: Colors.black54,
                labelText: 'File Name',
                errorText: namestatus ? 'File Name Is required' : null,
                prefixIcon: Icons.person,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: commonTextField(
                controller: tdoc,
                maxLines: 5,
                onchange: (value) {
                  setState(() {
                    docstatus = false;
                  });
                },
                color: Colors.black54,
                labelText: 'Message',
                errorText: docstatus ? 'Message Is required' : null,
                prefixIcon: Icons.message,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (tname.text.isEmpty) {
                    namestatus = true;
                  }
                  if (tdoc.text.isEmpty) {
                    docstatus = true;
                  } else {
                    saveFile();
                    print("success");
                  }
                });
              },
              child: Text("Save File"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ViewDataPage();
                  },
                ));
              },
              child: Text("view"),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> saveFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    print("path == ${path}");
    final file = File("$path/${tname.text}.txt");
    print("file == ${file}");
    print("${file.writeAsString(tdoc.text)}");
    return file.writeAsString(tdoc.text);
  }
}

class ViewDataPage extends StatefulWidget {
  const ViewDataPage({Key? key}) : super(key: key);

  @override
  State<ViewDataPage> createState() => _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
