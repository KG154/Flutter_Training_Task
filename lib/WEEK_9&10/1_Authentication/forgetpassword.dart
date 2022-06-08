import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widget/commonWidget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  TextEditingController temail = TextEditingController();
  bool emailstatus = false;
  String emailerror = "";

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   temail.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
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
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Reset Link will be sent to your email id !',
                  style: TextStyle(fontSize: 20.0),
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
                    errorText: emailstatus ? '${emailerror}' : null,
                    prefixIcon: Icons.mail,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                child: InkWell(
                  onTap: () {
                    bool emailValid = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(temail.text);

                    if (temail.text.isEmpty) {
                      emailstatus = true;
                      emailerror = 'Email Is required';
                    }
                    if (!emailValid) {
                      emailstatus = true;
                      emailerror = 'Enter Valid Email';
                    } else {
                      resetPassword(temail.text);
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
                        "Send Email",
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
    );
  }

  resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: temail.text,
      );
      temail.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black54,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0, color: Colors.white60),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      }
    }
  }
}
