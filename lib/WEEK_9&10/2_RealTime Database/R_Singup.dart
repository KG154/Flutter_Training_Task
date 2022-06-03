import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widget/commonWidget.dart';
import 'R_ViewPage.dart';

class R_SignUpScreen extends StatefulWidget {
  const R_SignUpScreen({Key? key}) : super(key: key);

  @override
  State<R_SignUpScreen> createState() => _R_SignUpScreenState();
}

class _R_SignUpScreenState extends State<R_SignUpScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  final databaseRef = FirebaseDatabase.instance.ref();
  final storageRef = FirebaseStorage.instance.ref();

  ///
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tcall = TextEditingController();
  TextEditingController tdesignation = TextEditingController();
  TextEditingController tsalary = TextEditingController();

  bool nameStatus = false;
  bool emailStatus = false;
  bool callStatus = false;
  bool designationStatus = false;
  bool salaryStatus = false;
  String emailError = "";
  String callError = "";
  String choice = "";
  bool loding = false;
  File? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "RealTime Database",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: loding
            ? Center(
                child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent.shade700),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 20),
                        child: InkWell(
                          onTap: () async {
                            final photo = await ImagePicker.platform.getImage(
                              source: ImageSource.gallery,
                              imageQuality: 50,
                            );
                            _image = File(photo!.path);
                            updateui();
                          },
                          child: _image != null
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  // margin: EdgeInsets.only(top: 20, bottom: 50),
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
                                  width: 100,
                                  height: 100,
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
                                    size: 50,
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: commonTextField(
                          controller: tname,
                          onchange: (value) {
                            setState(() {
                              nameStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Name',
                          errorText: nameStatus ? 'Name Is required' : null,
                          prefixIcon: Icons.person,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Container(
                          child: commonTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: temail,
                            color: Colors.black54,
                            onchange: (value) {
                              setState(() {
                                emailStatus = false;
                              });
                            },
                            labelText: 'Email Id',
                            errorText: emailStatus ? '${emailError}' : null,
                            prefixIcon: Icons.mail,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: commonTextField(
                          controller: tcall,
                          keyboardType: TextInputType.number,
                          onchange: (value) {
                            setState(() {
                              callStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Mobile no.',
                          errorText: callStatus ? '${callError}' : null,
                          prefixIcon: Icons.phone,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: commonTextField(
                          controller: tdesignation,
                          keyboardType: TextInputType.text,
                          onchange: (value) {
                            setState(() {
                              designationStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Designation',
                          errorText: designationStatus
                              ? 'designation Is required'
                              : null,
                          prefixIcon: Icons.work_outline_sharp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: commonTextField(
                          controller: tsalary,
                          keyboardType: TextInputType.phone,
                          onchange: (value) {
                            setState(() {
                              salaryStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Salary',
                          errorText: salaryStatus ? 'salary Is required' : null,
                          prefixIcon: Icons.currency_rupee_rounded,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                        child: Row(
                          children: [
                            Text("Gender : "),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: "Male",
                                        groupValue: choice,
                                        activeColor: Colors.deepPurple,
                                        onChanged: (value) {
                                          setState(() {
                                            choice = value.toString();
                                          });
                                        }),
                                    Text('Male')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: "Female",
                                        activeColor: Colors.deepPurple,
                                        groupValue: choice,
                                        onChanged: (value) {
                                          setState(() {
                                            choice = value.toString();
                                          });
                                        }),
                                    Text('Female')
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: "Other",
                                        groupValue: choice,
                                        activeColor: Colors.deepPurple,
                                        onChanged: (value) {
                                          setState(() {
                                            choice = value.toString();
                                          });
                                        }),
                                    Text('Other')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.30,
                            vertical:
                                MediaQuery.of(context).size.height * 0.030),
                        child: InkWell(
                          onTap: () async {
                            String email = temail.text;
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if (tname.text.isEmpty) {
                              nameStatus = true;
                            }
                            if (email.isEmpty) {
                              emailStatus = true;
                              emailError = 'Email Is required';
                            }
                            if (tcall.text.isEmpty) {
                              callStatus = true;
                              callError = 'Mobile no.Is required';
                            }
                            if (tcall.text.isNotEmpty) {
                              if (tcall.text.length != 10) {
                                callStatus = true;
                                callError = 'Mobile no. must be of 10 digit';
                              }
                            }
                            if (tdesignation.text.isEmpty) {
                              designationStatus = true;
                            }
                            if (tsalary.text.isEmpty) {
                              salaryStatus = true;
                            }
                            if (email.isNotEmpty) {
                              if (!emailValid) {
                                emailStatus = true;
                                emailError = 'Enter Valid Email';
                              }
                            }
                            if (choice.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black87,
                                  content: Text(
                                    "Please Select Gender...",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white60),
                                  ),
                                ),
                              );
                            } else {
                              if (!emailValid) {
                                emailStatus = true;
                                emailError = 'Enter Valid Email';
                              }
                              if (tcall.text.length != 10) {
                                callStatus = true;
                                callError = 'Mobile no. must be of 10 digit';
                              } else {
                                if (_image == null) {
                                  Fluttertoast.showToast(
                                    msg: "Please Provided Image.. ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.deepPurple,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                } else {
                                  setState(() {
                                    loding = true;
                                  });
                                  String uplodfilename = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();
                                  var fileName =
                                      "id-${tname.text}-${uplodfilename}";
                                  final destination = 'files/$fileName';
                                  TaskSnapshot snapshot = await FirebaseStorage
                                      .instance
                                      .ref()
                                      .child(destination)
                                      .putFile(_image!);
                                  final String downloadUrl =
                                      await snapshot.ref.getDownloadURL();

                                  ///

                                  insertdata(
                                    tname.text,
                                    temail.text,
                                    tcall.text,
                                    tdesignation.text,
                                    tsalary.text,
                                    choice.toString(),
                                    downloadUrl,
                                  );
                                  print("success");
                                  setState(() {
                                    loding = false;
                                  });
                                }
                              }
                            }

                            updateui();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurpleAccent.shade700,
                                  Colors.deepPurple.shade400,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add Data",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.30,
                            right: MediaQuery.of(context).size.width * 0.30,
                            bottom: MediaQuery.of(context).size.height * 0.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return R_ViewPage();
                              },
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurpleAccent.shade700,
                                  Colors.deepPurple.shade400,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "View Data",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
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

  Future<void> insertdata(
      String name,
      String email,
      String phone,
      String designation,
      String salary,
      String gender,
      String downloadUrl) async {
    String? key = databaseRef.child("Employee").push().key;
    databaseRef.child("Employee").child(key!).set({
      'key': key,
      'name': name,
      'email': email,
      'phone': phone,
      'designation': designation,
      'salary': salary,
      'gender': gender,
      'url': downloadUrl,
    });
    _image = null;
    tname.clear();
    temail.clear();
    tcall.clear();
    tdesignation.clear();
    tsalary.clear();
    choice = '';
  }
}
