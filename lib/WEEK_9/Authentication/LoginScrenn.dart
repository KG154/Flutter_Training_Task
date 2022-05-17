import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_9/Authentication/SignupScreen.dart';

import '../../Widget/commonWidget.dart';

class FireBase_AuthenticationScreen extends StatefulWidget {
  const FireBase_AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<FireBase_AuthenticationScreen> createState() =>
      _FireBase_AuthenticationScreenState();
}

class _FireBase_AuthenticationScreenState
    extends State<FireBase_AuthenticationScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  ///
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
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
        appBar: AppBar(
          title: const Text(
            "Authentication",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 200,
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
                          "Login",
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
                  child: Container(
                    child: commonTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: temail,
                      color: Colors.black54,
                      onchange: (value) {
                        setState(() {
                          emailstatus = false;
                        });
                      },
                      labelText: 'Enter Email',
                      errorText: emailstatus ? 'Enter Email Id' : null,
                      prefixIcon: Icons.mail,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: Container(
                    child: commonTextField(
                      controller: tpass,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: showpass,
                      maxLines: 1,
                      labelText: 'Password',
                      hintText: 'abc@123',
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
                        icon: Icon(
                            showpass ? Icons.visibility_off : Icons.visibility),
                      ),
                      errorText: passstatus ? 'Enter Password' : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: InkWell(
                    onTap: () {
                      String email = temail.text;
                      String password = tpass.text;

                      if (email.isEmpty && password.isEmpty) {
                        emailstatus = true;
                        emailerror = 'Email Is required';
                        passstatus = true;
                        passworderror = 'Password Is required';
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
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
                          "SignUp",
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
