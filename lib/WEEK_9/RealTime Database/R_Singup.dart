import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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

  final databaseRef = FirebaseDatabase.instance.reference();

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
  String choice = "";
  bool loding = false;

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
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                          errorText:
                              callStatus ? 'Mobile no.Is required' : null,
                          prefixIcon: Icons.phone,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                        padding: EdgeInsets.only(top: 25, left: 20, right: 10),
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
                              } else {
                                setState(() {});
                                insertdata(
                                    tname.text,
                                    temail.text,
                                    tcall.text,
                                    tdesignation.text,
                                    tsalary.text,
                                    choice.toString());
                                print("success");
                                setState(() {
                                  loding = true;
                                  Future.delayed(Duration(seconds: 1), () {
                                    setState(() {
                                      loding = false;
                                    });
                                  });
                                });
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

  void insertdata(String name, String email, String phone, String designation,
      String salary, String gender) {
    String? key = databaseRef.child("Employee").push().key;
    databaseRef.child("Employee").child(key!).set({
      'name': name,
      'email': email,
      'phone': phone,
      'designation': designation,
      'salary': salary,
      'gender': gender,
    });
    tname.clear();
    temail.clear();
    tcall.clear();
    tdesignation.clear();
    tsalary.clear();
    choice = '';
  }
}
