import 'package:flutter/material.dart';

import '../../Widget/commonWidget.dart';

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
        body: Container(
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
                    errorText: callStatus ? 'Mobile no.Is required' : null,
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
                    errorText:
                        designationStatus ? 'designation Is required' : null,
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
                      horizontal: MediaQuery.of(context).size.width * 0.30,
                      vertical: MediaQuery.of(context).size.height * 0.050),
                  child: InkWell(
                    onTap: () async {
                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(temail.text);
                      if (tname.text.isEmpty) {
                        nameStatus = true;
                      }
                      if (temail.text.isEmpty) {
                        emailStatus = true;
                        emailError = 'Email Is required';
                      }
                      if (!emailValid) {
                        emailStatus = true;
                        emailError = 'Enter Valid Email';
                      }
                      if (tcall.text.isEmpty) {
                        callStatus = true;
                      }
                      if (tdesignation.text.isEmpty) {
                        designationStatus = true;
                      }
                      if (tsalary.text.isEmpty) {
                        salaryStatus = true;
                      } else {
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
                        } else {}
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
                              color: Colors.white, fontWeight: FontWeight.bold),
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
}
