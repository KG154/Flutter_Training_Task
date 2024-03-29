import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskproject/Widget/commonWidget.dart';

import 'Databasehelper.dart';

class SqfLite extends StatefulWidget {
  const SqfLite({Key? key}) : super(key: key);

  @override
  State<SqfLite> createState() => _SqfLiteState();
}

class _SqfLiteState extends State<SqfLite> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
  bool namestatus = false;
  bool emailstatus = false;
  bool passstatus = false;
  bool showpass = true;

  String emailerror = "";
  String passworderror = "";
  Database? _database;

  bool _loading = false;

  // final ImagePicker _picker = ImagePicker();
  // XFile? image;
  File? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHandler().CreateDataBase().then(
      (value) {
        _database = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SqfLite",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Center(
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: InkWell(
                          onTap: () async {
                            final photo = await ImagePicker.platform.getImage(
                              source: ImageSource.gallery,
                              imageQuality: 50,
                            );
                            _image = File(photo!.path);
                            setState(() {});
                          },
                          child: _image != null
                              ? Container(
                                  height: 150,
                                  width: 150,
                                  margin: EdgeInsets.only(top: 20, bottom: 50),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  width: 150,
                                  height: 150,
                                  margin: EdgeInsets.only(bottom: 40),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 100,
                                  ),
                                ),
                        ),
                      ),
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
                        child: commonTextField(
                          controller: tpass,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: showpass,
                          labelText: 'Password',
                          hintText: 'abc@123',
                          onchange: (value) {
                            setState(() {
                              passstatus = false;
                            });
                          },
                          prefixIcon: Icons.lock,
                          suffixIcon: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                            icon: Icon(showpass
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          errorText: passstatus ? '$passworderror' : null,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            String name = tname.text;
                            String email = temail.text;
                            String password = tpass.text;

                            bool emailValid = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(email);
                            if (name.isEmpty &&
                                email.isEmpty &&
                                password.isEmpty) {
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
                            } else if (name.isEmpty &&
                                password.isEmpty &&
                                !emailValid) {
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
                              String? _img;
                              if (_image != null) {
                                _img = base64Encode(_image!.readAsBytesSync());
                              }
                              DatabaseHandler().insertdata(
                                  _database!, name, email, password, _img);

                              setState(() {
                                _loading = true;
                                Future.delayed(Duration(milliseconds: 200), () {
                                  setState(() {
                                    _loading = false;
                                    Fluttertoast.showToast(
                                        msg: "Data Insert Successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black54,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                                });
                              });
                              tname.text = "";
                              temail.text = "";
                              tpass.text = "";
                              _image = null;
                            }
                          });
                        },
                        child: commonButton(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.3),
                            width: size.width * 0.27,
                            height: size.height * 0.06,
                            title: "Submit"),
                      ),



                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: InkWell(
                          onTap: () {
                            _image = null;
                            Navigator.of(context).pushNamed('/ViewPage');
                          },
                          child: commonButton(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.3),
                            width: size.width * 0.5,
                            height: size.height * 0.06,
                            title: "View",
                          ),
                        ),
                      ),



                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
