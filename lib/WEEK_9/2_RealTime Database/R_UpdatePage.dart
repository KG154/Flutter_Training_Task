import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widget/commonWidget.dart';

class R_UpdateScreen extends StatefulWidget {
  String uUrl;
  String uName;
  String uEmail;
  String uPhone;
  String uDesig;
  String uSalary;
  String uGender;
  String key1;

  R_UpdateScreen(
    this.uUrl,
    this.uName,
    this.uEmail,
    this.uPhone,
    this.uDesig,
    this.uSalary,
    this.uGender,
    this.key1,
  );

  // const R_UpdateScreen({Key? key}) : super(key: key);

  @override
  State<R_UpdateScreen> createState() => _R_UpdateScreenState();
}

class _R_UpdateScreenState extends State<R_UpdateScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  final databaseRef = FirebaseDatabase.instance.reference().child("Employee");

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
  File? _image;
  String choice = "";
  bool loding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tname.text = widget.uName;
    temail.text = widget.uEmail;
    tcall.text = widget.uPhone;
    tdesignation.text = widget.uDesig;
    tsalary.text = widget.uSalary;
    choice = widget.uGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Data",
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
                            : widget.uUrl != null
                                ? Container(
                                    width: 100,
                                    height: 100,
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
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        imageUrl: widget.uUrl,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                              color: Colors.white,
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return CircleAvatar(
                                            child: Icon(
                                              Icons.person,
                                              size: 30,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    child: ClipOval(
                                      child: Center(
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                  ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
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
                          horizontal: MediaQuery.of(context).size.width * 0.30,
                          vertical: MediaQuery.of(context).size.height * 0.030),
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

                                updateData(
                                  tname.text,
                                  temail.text,
                                  tcall.text,
                                  tdesignation.text,
                                  tsalary.text,
                                  choice.toString(),
                                  downloadUrl,
                                );
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
                              "Update Data",
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
    );
  }

  void updateData(
    String name,
    String email,
    String phone,
    String designation,
    String salary,
    String gender,
    String downloadUrl,
  ) {
    String? key = databaseRef.child("Employee").push().key;
    databaseRef.child(widget.key1).update({
      'name': name,
      'email': email,
      'phone': phone,
      'designation': designation,
      'salary': salary,
      'gender': gender,
      'url': downloadUrl,
    });

    Navigator.pop(context);
  }
}
