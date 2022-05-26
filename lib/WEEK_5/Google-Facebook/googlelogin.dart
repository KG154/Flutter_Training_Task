import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Googledashboard.dart';

class googlelogine1 extends StatefulWidget {
  const googlelogine1({Key? key}) : super(key: key);

  @override
  State<googlelogine1> createState() => _googlelogine1State();
}

class _googlelogine1State extends State<googlelogine1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? 'loginpage' : 'homepage',
      navigatorObservers: [],
      routes: {
        'loginpage': (context) => google_Login(),
        'homepage': (context) => DashboardScreen(),
      },
    );
  }
}

class google_Login extends StatefulWidget {
  const google_Login({Key? key}) : super(key: key);

  @override
  State<google_Login> createState() => _google_LoginState();
}

class _google_LoginState extends State<google_Login> {
  bool isLoading = true;

  final _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: isLoading
            ? Center(
                child: ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = false;
                        });
                        final GoogleSignInAccount? googleSigninAcc =
                            await _googleSignIn.signIn();
                        setState(() {
                          isLoading = true;
                        });

                        if (googleSigninAcc != null) {
                          final GoogleSignInAuthentication authentication =
                              await googleSigninAcc.authentication;
                          setState(() {
                            isLoading = false;
                          });
                          final AuthCredential authCredential =
                              GoogleAuthProvider.credential(
                                  idToken: authentication.idToken,
                                  accessToken: authentication.accessToken);

                          UserCredential result =
                              await _auth.signInWithCredential(authCredential);
                          User? user = await result.user;
                          setState(() {
                            isLoading = true;
                          });
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                      isloading = false;
                      setState(() {});
                    },
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    label: Text("Login With Google")),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class Usermodel {
  String? uid;
  String? email;
  String? firstname;
  String? secondname;
  String? photoURL;

  Usermodel(
      {this.email, this.firstname, this.secondname, this.uid, this.photoURL});

  //receving data from server
  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      firstname: map['firstName'],
      secondname: map['secondName'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email ': email,
      'firstName': firstname,
      'secondName': secondname,
    };
  }
}
