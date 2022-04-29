import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  bool isloding = false;

  var uri = "http://192.168.1.38/Practical_Api/api/add_user";

  login(String path, String name, String email) async {
    final request = await http.MultipartRequest(
      'POST',
      Uri.parse(uri),
    );
    request.fields['name'] = tname.text;
    request.fields['email'] = temail.text;
    request.files.add(await http.MultipartFile.fromPath('profile_pic', path));

    var header = {
      "Token":
          "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
    };
    request.headers.addAll(header);
    var res = await request.send();
    // final responseX = await res.stream.bytesToString();
    // print(responseX);
    if (res.statusCode == 200) {

      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid')),
      );
    }
  }

  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  String emailerror = "";
  bool namestatus = false;
  bool emailstatus = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
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
          child: isloding
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: double.infinity,
                                    height: 170,
                                    color: Colors.white,
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          title: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20.0),
                                            child: Text(
                                              'Select Your Image',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                image = await _picker.pickImage(
                                                    source: ImageSource.camera);
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 90,
                                                width: 70,
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    left: 25,
                                                    right: 25,
                                                    bottom: 5),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        child: Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          size: 40,
                                                          color: Colors
                                                              .green.shade900,
                                                        ),
                                                        backgroundColor:
                                                            Colors.green.shade100,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.only(top: 5),
                                                      child: Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                image = await _picker.pickImage(
                                                    source: ImageSource.gallery);
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 90,
                                                width: 70,
                                                margin: EdgeInsets.only(
                                                    top: 5,
                                                    left: 25,
                                                    right: 25,
                                                    bottom: 5),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        child: Icon(
                                                          Icons.photo,
                                                          size: 40,
                                                          color: Colors
                                                              .green.shade900,
                                                        ),
                                                        backgroundColor:
                                                            Colors.green.shade100,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.only(top: 5),
                                                      child: Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          });
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 55,
                            child: image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      File(image!.path),
                                      width: 105,
                                      height: 105,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),

                                    ),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 50,
                                    ),
                                  ),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
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
                      padding: EdgeInsets.only(top: 15, bottom: 20),
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
                      padding: const EdgeInsets.symmetric(horizontal: 110),
                      child: ElevatedButton(
                          onPressed: () {
                            String name = tname.text;
                            String email = temail.text;

                            bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(email);
                            if (name.isEmpty && email.isEmpty) {
                              namestatus = true;
                              emailstatus = true;
                              emailerror = 'Email Is required';
                            } else if (name.isEmpty && !emailValid) {
                              namestatus = true;
                              emailstatus = true;
                              emailerror = 'Enter Valid Email..';
                            } else if (name.isEmpty) {
                              namestatus = true;
                            } else if (email.isEmpty) {
                              emailstatus = true;
                              emailerror = 'Email Is required';
                            } else if (!emailValid) {
                              emailstatus = true;
                              emailerror = 'Enter Valid Email..';
                            } else {
                              login(image!.path, name, email);
                              setState(() {
                                isloding = true;
                                Future.delayed(Duration(seconds: 3), () {
                                  setState(() {
                                    isloding = false;
                                  });
                                });
                              });
                            }
                          },
                          child: Text('SUBMIT')),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

// login(String path, String name, String email) {}
}
