import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_9/Authentication/SignupScreen.dart';
import 'package:taskproject/WEEK_9/Authentication/userMain_Screen/userMainScareen.dart';

import '../../Widget/commonWidget.dart';
import 'forgetpassword.dart';

// class Authentation_Screen extends StatelessWidget {
//   Authentation_Screen({Key? key}) : super(key: key);
//
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           print("Something Went Wrong");
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return MaterialApp(
//           title: "Authentication",
//           debugShowCheckedModeBanner: false,
//           home: LoginScreen(),
//         );
//       },
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
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
        appBar: AppBar(
          title: Text(
            "Authentication",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                    // color: Colors.deepPurpleAccent.shade400,
                    // borderRadius: BorderRadius.only(
                    //   bottomRight: Radius.elliptical(300, 200),
                    //   bottomLeft: Radius.elliptical(300, 200),
                    // ),
                    // gradient: LinearGradient(
                    //     begin: Alignment.topRight,
                    //     end: Alignment.bottomLeft,
                    //     colors: [
                    //       Colors.deepPurpleAccent.shade700,
                    //       Colors.deepPurple.shade400,
                    //     ]),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.deepPurpleAccent.withOpacity(0.3),
                    //       blurRadius: 1,
                    //       offset: Offset(0, 1),
                    //       spreadRadius: 1)
                    // ],
                    ),
                // margin: EdgeInsets.only(top: 130, bottom: 50),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent.shade700,
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
                    errorText: emailstatus ? '${emailerror}' : null,
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
                    errorText: passstatus ? '${passworderror}' : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent.shade400,
                          // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ForgetPasswordScreen();
                            },
                          ));
                        },
                        child: Text("Forget Password"))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                child: InkWell(
                  onTap: () {
                    if (temail.text.isEmpty) {
                      emailstatus = true;
                      emailerror = 'Email Is required';
                    }
                    if (tpass.text.isEmpty) {
                      passstatus = true;
                      passworderror = 'Password Is required';
                    } else {
                      loginUser();
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
    );
  }

  Future<void> loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: temail.text,
        password: tpass.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => userMainScareen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      }
    }
  }
}
