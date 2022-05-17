import 'package:flutter/material.dart';

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
        body: SafeArea(
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
                            color: Colors.deepPurpleAccent.withOpacity(0.3),
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
                    padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: commonTextField(
                      controller: tcall,
                      keyboardType: TextInputType.number,
                      onchange: (value) {
                        setState(() {
                          callstatus = false;
                        });
                      },
                      color: Colors.black54,
                      labelText: 'mobile no.',
                      errorText: callstatus ? 'Mobile no.Is required' : null,
                      prefixIcon: Icons.phone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 50, right: 50),
                    child: InkWell(
                      onTap: () {
                        String name = tname.text;
                        String phono = tcall.text;
                        String email = temail.text;
                        String password = tpass.text;
                        // if (name.isEmpty &&
                        //     phono.isEmpty &&
                        //     email.isEmpty &&
                        //     password.isEmpty) {
                        //   namestatus = true;
                        //   callstatus = true;
                        //   emailstatus = true;
                        //   emailerror = 'Email Is required';
                        //   passstatus = true;
                        //   passworderror = 'Password Is required';
                        // } else if (name.isEmpty && password.isEmpty) {
                        //   namestatus = true;
                        //   passstatus = true;
                        //   passworderror = 'Password Is required';
                        // } else if (email.isEmpty && password.isEmpty) {
                        //   emailstatus = true;
                        //   emailerror = 'Email Is required';
                        //   passstatus = true;
                        //   passworderror = 'Password Is required';
                        // } else if (name.isEmpty) {
                        //   namestatus = true;
                        // } else if (email.isEmpty) {
                        //   emailstatus = true;
                        //   emailerror = 'Email Is required';
                        // } else if (password.isEmpty) {
                        //   passstatus = true;
                        //   passworderror = 'Password Is required';
                        // } else {}
                        if (name.isEmpty) {
                          namestatus = true;
                        } else if (phono.isEmpty) {
                          callstatus = true;
                        } else if (email.isEmpty) {
                          emailstatus = true;
                          emailerror = 'Email Is required';
                        } else if (password.isEmpty) {
                          passstatus = true;
                          passworderror = 'Password Is required';
                        } else {}
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
                            "Login",
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
}
