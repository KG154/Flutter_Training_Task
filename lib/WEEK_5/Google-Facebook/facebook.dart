import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Facebook extends StatefulWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  bool _isloggedIn = false;
  late Map user;
  final facebooklogin = FacebookLogin();

  _logonwithfb() async {
    print("facebook");
    try {
      final result = await FacebookAuth.i.login(permissions: ['email']);
      if (result.status == LoginStatus.success) {
        final userdata = await FacebookAuth.i.getUserData();
        print(userdata);
        setState(() {
          user = userdata;
          _isloggedIn = true;
        });
      } else if (result.status == LoginStatus.cancelled) {
        setState(() {
          _isloggedIn = false;
        });
      }
    } catch (error) {
      print(error);
      setState(() {
        _isloggedIn = false;
      });
    }
  }

  _logout() {
    facebooklogin.logOut();
    setState(() {
      _isloggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: _isloggedIn
              ?  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        user["picture"]["data"]["url"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Name:   ${user['name']}\nEmail:   ${user['email']}',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        _logout();
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
                    // RaisedButton(
                    //   child: Text("Logout"),
                    //   onPressed: () {
                    //     _logout();
                    //   },
                    // ),
                  ],
                )
              : Center(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        _logonwithfb();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.redAccent,
                      ),
                      label: Text("Login With Facebook")),
                ),
        ),
      )),
    );
  }
}
