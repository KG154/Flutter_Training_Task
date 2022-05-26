// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'googledashScreen.dart';
//
// class Media_Login extends StatefulWidget {
//   const Media_Login({Key? key}) : super(key: key);
//
//   @override
//   State<Media_Login> createState() => _Media_LoginState();
// }
//
// class _Media_LoginState extends State<Media_Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Social Media Login",
//           style: TextStyle(fontSize: 20),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black45,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton.icon(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.white24),
//                   ),
//                   onPressed: () async {
//                     await FirebaseServices().signInWithGoogle();
//                     Navigator.pushReplacement(context, MaterialPageRoute(
//                       builder: (context) {
//                         return const dasScreen();
//                       },
//                     ));
//                   },
//                   icon: const FaIcon(
//                     FontAwesomeIcons.google,
//                     color: Colors.yellowAccent,
//                   ),
//                   label: Text("  Login With Google")),
//               ElevatedButton.icon(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.white24),
//                   ),
//                   onPressed: () async {
//                     await FirebaseServices().faceBook(context);
//                   },
//                   icon: const FaIcon(
//                     FontAwesomeIcons.facebook,
//                     color: Colors.blue,
//                   ),
//                   label: Text("Login With Facebook")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Media_Login extends StatefulWidget {
  const Media_Login({Key? key}) : super(key: key);

  @override
  State<Media_Login> createState() => _Media_LoginState();
}

class _Media_LoginState extends State<Media_Login> {
  var loggedIn = false;
  var firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _buildSocialLogin());
  }

  _buildSocialLogin() {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(0, 207, 179, 1),
          child: Center(
            child: loggedIn
                ? Text("Logged In! :)",
                    style: TextStyle(color: Colors.white, fontSize: 40))
                : Stack(
                    children: <Widget>[
                      SizedBox.expand(
                        child: _buildSignUpText(),
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // wrap height
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // stretch across width of screen
                            children: <Widget>[
                              _buildFacebookLoginButton(),
                              _buildGoogleLoginButton(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
          )),
    );
  }

  Container _buildGoogleLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 0),
      child: ButtonTheme(
        height: 48,
        child: RaisedButton(
            onPressed: () {
              initiateSignIn("G");
            },
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textColor: Color.fromRGBO(122, 122, 122, 1),
            child: Text("Connect with Google",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ))),
      ),
    );
  }

  Container _buildFacebookLoginButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
      child: ButtonTheme(
        height: 48,
        child: RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onPressed: () {
              initiateSignIn("FB");
            },
            color: Color.fromRGBO(27, 76, 213, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textColor: Colors.white,
            child: Text(
              "Connect with Facebook",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
      ),
    );
  }

  Container _buildSignUpText() {
    return Container(
      margin: EdgeInsets.only(top: 76),
      child: Text(
        "Sign Up",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 42,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  void initiateSignIn(String type) {
    _handleSignIn(type).then((result) {
      if (result == 1) {
        setState(() {
          loggedIn = true;
        });
      } else {}
    });
  }

  Future<int> _handleSignIn(String type) async {
    switch (type) {
      case "FB":
        FacebookLoginResult facebookLoginResult = await _handleFBSignIn();
        final accessToken = facebookLoginResult.accessToken!.token;
        if (facebookLoginResult.status == FacebookLoginStatus.success) {
          final facebookAuthCred = FacebookAuthProvider.credential(accessToken);
          final user =
              await firebaseAuth.signInWithCredential(facebookAuthCred);
          print("User : " + user.additionalUserInfo!.username!);
          return 1;
        } else
          return 0;
        break;
      case "G":
        try {
          GoogleSignInAccount? googleSignInAccount =
              await _handleGoogleSignIn();
          final googleAuth = await googleSignInAccount!.authentication;
          final googleAuthCred = GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
          final user = await firebaseAuth.signInWithCredential(googleAuthCred);
          print("User : " + user.additionalUserInfo!.username!);
          return 1;
        } catch (error) {
          return 0;
        }
    }
    return 0;
  }

  Future<FacebookLoginResult> _handleFBSignIn() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(permissions: [FacebookPermission.email]);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.cancel:
        print("Cancelled");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.success:
        print("Logged In");
        break;
    }
    return facebookLoginResult;
  }

  Future<GoogleSignInAccount?> _handleGoogleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly']);
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    return googleSignInAccount;
  }
}
