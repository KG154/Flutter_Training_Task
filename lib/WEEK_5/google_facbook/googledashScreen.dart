import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Social Media Login.dart';
import 'fbpage.dart';

class dasScreen extends StatefulWidget {
  const dasScreen({Key? key}) : super(key: key);

  @override
  State<dasScreen> createState() => _dasScreenState();
}

class _dasScreenState extends State<dasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () async {
                await FirebaseServices().googleSignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Media_Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  faceBook(context) async {
    try {
      final result = await FacebookAuth.i.login(permissions: ['email']);
      if (result.status == LoginStatus.success) {
        final userdata = await FacebookAuth.i.getUserData();
        print(userdata);

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return fbpage(userdata);
          },
        ));
        print(userdata['name']);
      }
    } catch (e) {
      print(e);
    }
  }

  fblogout(BuildContext context) async {
    await FacebookAuth.i.logOut();
    Navigator.pop(context);
  }
}
