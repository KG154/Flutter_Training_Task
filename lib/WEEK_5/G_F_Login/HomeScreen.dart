import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskproject/WEEK_5/G_F_Login/G_F_Controller.dart';

class Sigin_In_Screnn extends StatefulWidget {
  @override
  State<Sigin_In_Screnn> createState() => _Sigin_In_ScrennState();
}

class _Sigin_In_ScrennState extends State<Sigin_In_Screnn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedpref();
  }

  sharedpref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data = prefs.getString("providerId").toString();
    email = prefs.getString("email").toString();
    name = prefs.getString("name").toString();
    image = prefs.getString("photoURL").toString();
    setState(() {});
  }

  String data = "";
  String name = "";
  String email = "";
  String image = "";

  FGAuthControler _con = Get.put(FGAuthControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  // ignore: unnecessary_null_comparison
                  backgroundImage: image != null ? NetworkImage(image) : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Name    :   ${name}\nEmail Id :  ${email}",
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  _con.signout();
                },
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black54,
                            Color.fromRGBO(0, 41, 102, 1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.3),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: Colors.blue)),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      color: const Color(0xFFFFFFFF),
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
}
