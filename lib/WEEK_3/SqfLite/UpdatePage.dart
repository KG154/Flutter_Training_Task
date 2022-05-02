import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskproject/Widget/commonWidget.dart';

import 'Databasehelper.dart';

class Updatepage extends StatefulWidget {
  Map _map;

  Updatepage(this._map);

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
  bool namestatus = false;
  bool emailstatus = false;
  bool passstatus = false;
  bool showpass = true;

  String emailerror = "";
  String passworderror = "";
  int userid = 0;
  Database? _database;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userid = widget._map['id'];
    tname.text = widget._map['tname'];
    temail.text = widget._map['temail'];
    tpass.text = widget._map['tpass'];
    DatabaseHandler().CreateDataBase().then((value) {
      _database = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Data",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: ListView(
          padding: EdgeInsets.only(top: 100, left: 10, right: 10),
          children: [
            Container(
              child: TextField(
                controller: tname,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    namestatus = false;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Name',
                  hintText: 'abc',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  errorText: namestatus ? 'Name Is required' : null,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: TextField(
                controller: temail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    emailstatus = false;
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Email',
                  hintText: 'abc@gmail.com',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  errorText: emailstatus ? '$emailerror' : null,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 30),
              child: TextField(
                controller: tpass,
                keyboardType: TextInputType.visiblePassword,
                obscureText: showpass,
                onChanged: (value) {
                  setState(() {
                    passstatus = false;
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelText: 'Password',
                  hintText: 'abc@123',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  suffixIcon: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        showpass = !showpass;
                      });
                    },
                    icon: Icon(
                        showpass ? Icons.visibility_off : Icons.visibility),
                  ),
                  errorText: passstatus ? '$passworderror' : null,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  String name = tname.text;
                  String email = temail.text;
                  String password = tpass.text;

                  bool emailValid =
                      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(email);
                  if (name.isEmpty && email.isEmpty && password.isEmpty) {
                    namestatus = true;
                    emailstatus = true;
                    emailerror = 'Email Is required';
                    passstatus = true;
                    passworderror = 'Password Is required';
                  } else if (name.isEmpty && email.isEmpty) {
                    namestatus = true;
                    emailstatus = true;
                    emailerror = 'Email Is required';
                  } else if (email.isEmpty && password.isEmpty) {
                    emailstatus = true;
                    emailerror = 'Email Is required';
                    passstatus = true;
                    passworderror = 'Password Is required';
                  } else if (name.isEmpty && password.isEmpty && !emailValid) {
                    namestatus = true;
                    passstatus = true;
                    passworderror = 'Password Is required';
                    emailstatus = true;
                    emailerror = 'Enter Valid Email..';
                  } else if (name.isEmpty && password.isEmpty) {
                    namestatus = true;
                    passstatus = true;
                    passworderror = 'Password Is required';
                  } else if (name.isEmpty && !emailValid) {
                    namestatus = true;
                    emailstatus = true;
                    emailerror = 'Enter Valid Email..';
                  } else if (password.isEmpty && !emailValid) {
                    passstatus = true;
                    passworderror = 'Password Is required';
                    emailstatus = true;
                    emailerror = 'Enter Valid Email..';
                  } else if (name.isEmpty) {
                    namestatus = true;
                  } else if (email.isEmpty) {
                    emailstatus = true;
                    emailerror = 'Email Is required';
                  } else if (password.isEmpty) {
                    passstatus = true;
                    passworderror = 'Password Is required';
                  } else if (!emailValid) {
                    emailstatus = true;
                    emailerror = 'Enter Valid Email..';
                  } else {
                    DatabaseHandler()
                        .updateData(_database!, userid, name, email, password);
                    Navigator.pop(context, true);
                    // Navigator.popUntil(context, ModalRoute.withName('/SqfLite'));

                  }
                });
              },
              child: commonButton(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                width: size.width * 0.5,
                height: size.height * 0.06,
                title: "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
