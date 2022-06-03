import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:taskproject/WEEK_5/G_F_Login/G_F_Controller.dart';

class G_F_Screen extends StatefulWidget {
  const G_F_Screen({Key? key}) : super(key: key);

  @override
  State<G_F_Screen> createState() => _G_F_ScreenState();
}

class _G_F_ScreenState extends State<G_F_Screen> {
  FGAuthControler _auth = Get.put(FGAuthControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  _auth.googleAuth();
                },
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text("Login With Google")),
            ElevatedButton.icon(
                onPressed: () {
                  _auth.facebookAuth();
                },
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                label: Text("Login With Facebook")),
          ],
        ),
      ),
    );
  }
}
