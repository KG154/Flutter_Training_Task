import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_9&10/1_Authentication/LoginScrenn.dart';

import '../../Widget/commonWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  ///
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
  TextEditingController tcall = TextEditingController();
  bool callstatus = false;
  bool namestatus = false;
  bool emailstatus = false;
  bool passstatus = false;
  bool showpass = true;
  String emailerror = "";
  String passworderror = "";

  bool isLoding = false;

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   tname.dispose();
  //   tpass.dispose();
  //   temail.dispose();
  //   tpass.dispose();
  // }

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
        // appBar: AppBar(
        //   title: const Text(
        //     "SignUp",
        //     style: TextStyle(fontSize: 25),
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Colors.black45,
        // ),
        body: isLoding
            ? Center(
                child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent.shade700),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent.shade400,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.elliptical(300, 200),
                              bottomLeft: Radius.elliptical(300, 200),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.deepPurpleAccent.shade700,
                                  Colors.deepPurple.shade400,
                                ]),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Colors.deepPurpleAccent.withOpacity(0.3),
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                  spreadRadius: 1)
                            ],
                          ),
                          // margin: EdgeInsets.only(top: 130, bottom: 50),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  "Register User",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 10, right: 10),
                          child: commonTextField(
                            controller: tname,
                            onchange: (value) {
                              setState(() {
                                namestatus = false;
                              });
                            },
                            color: Colors.black54,
                            labelText: 'Name',
                            errorText: namestatus ? 'Name Is required' : null,
                            prefixIcon: Icons.person,
                          ),
                        ),
                        // Padding(
                        //   padding:
                        //       EdgeInsets.only(top: 25, left: 10, right: 10),
                        //   child: commonTextField(
                        //     controller: tcall,
                        //     keyboardType: TextInputType.number,
                        //     onchange: (value) {
                        //       setState(() {
                        //         callstatus = false;
                        //       });
                        //     },
                        //     color: Colors.black54,
                        //     labelText: 'mobile no.',
                        //     errorText:
                        //         callstatus ? 'Mobile no.Is required' : null,
                        //     prefixIcon: Icons.phone,
                        //   ),
                        // ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 10, right: 10),
                          child: commonTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: temail,
                            color: Colors.black54,
                            onchange: (value) {
                              setState(() {
                                emailstatus = false;
                              });
                            },
                            labelText: 'Email',
                            errorText: emailstatus ? '${emailerror}' : null,
                            prefixIcon: Icons.mail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 10, right: 10),
                          child: Container(
                            child: commonTextField(
                              controller: tpass,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: showpass,
                              maxLines: 1,
                              labelText: 'Password',
                              // hintText: 'abc@123',
                              color: Colors.black54,
                              onchange: (value) {
                                setState(() {
                                  passstatus = false;
                                });
                              },
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                color: Colors.black54,
                                onPressed: () {
                                  setState(() {
                                    showpass = !showpass;
                                  });
                                },
                                icon: Icon(showpass
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              errorText: passstatus ? '${passworderror}' : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 50, right: 50),
                          child: InkWell(
                            onTap: () {
                              bool emailValid = RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(temail.text);
                              if (tname.text.isEmpty) {
                                namestatus = true;
                              }

                              if (temail.text.isEmpty) {
                                emailstatus = true;
                                emailerror = 'Email Is required';
                              }
                              if (tpass.text.isEmpty) {
                                passstatus = true;
                                passworderror = 'Password Is required';
                              }
                              if (!emailValid) {
                                emailstatus = true;
                                emailerror = 'Enter Valid Email';
                              } else {
                                registerUser();
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
                                  "Register",
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
      ),
    );
  }

  Future<void> registerUser() async {
    try {
      setState(() {
        isLoding = true;
      });
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: temail.text,
        password: tpass.text,
      );
      print(userCredential);
      setState(() {
        isLoding = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          isLoding = false;
        });
        print("Password Provided is too Weak");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          isLoding = false;
        });
        print("Account Already exists");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      }
    }
  }
}
