import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'googledashScreen.dart';

class Media_Login extends StatefulWidget {
  const Media_Login({Key? key}) : super(key: key);

  @override
  State<Media_Login> createState() => _Media_LoginState();
}

class _Media_LoginState extends State<Media_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Social Media Login",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white24),
                  ),
                  onPressed: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const dasScreen();
                      },
                    ));
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.yellowAccent,
                  ),
                  label: Text("  Login With Google")),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white24),
                  ),
                  onPressed: () async {
                    await FirebaseServices().faceBook(context);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  label: Text("Login With Facebook")),
            ],
          ),
        ),
      ),
    );
  }
}
