import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_9/Authentication/LoginScrenn.dart';

import '../../../Widget/commonWidget.dart';

class Change_Password_Screen extends StatefulWidget {
  const Change_Password_Screen({Key? key}) : super(key: key);

  @override
  State<Change_Password_Screen> createState() => _Change_Password_ScreenState();
}

class _Change_Password_ScreenState extends State<Change_Password_Screen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  TextEditingController tpass = TextEditingController();
  bool passstatus = false;
  bool showpass = true;
  String passworderror = "";
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.deepPurpleAccent.shade700,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Container(
                  child: commonTextField(
                    controller: tpass,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showpass,
                    maxLines: 1,
                    labelText: 'New Password',
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
                    errorText: passstatus ? '${passworderror}' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                child: InkWell(
                  onTap: () {
                    if (tpass.text.isEmpty) {
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else {
                      changePassword();
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
                        "Change Password",
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

  Future<void> changePassword() async {
    try {
      await currentUser!.updatePassword(tpass.text);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Your Password has been Changed. Login again !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
