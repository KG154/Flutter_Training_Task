import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class animationsScreen extends StatefulWidget {
  const animationsScreen({Key? key}) : super(key: key);

  @override
  State<animationsScreen> createState() => _animationsScreenState();
}

class _animationsScreenState extends State<animationsScreen> {
  final Duration initialDelay = Duration(milliseconds: 500);
  TextEditingController temail = TextEditingController();
  TextEditingController tpass = TextEditingController();
  bool emailstatus = false;
  bool passstatus = false;
  bool showpass = true;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade400,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(300, 200),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.deepPurpleAccent.shade700,
                          Colors.deepPurple.shade400,
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: DelayedDisplay(
                            slidingBeginOffset: Offset(2, 0),
                            delay: Duration(
                                milliseconds:
                                    initialDelay.inMilliseconds + 100),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('Images/light-1.png'))),
                            ),
                          )),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: DelayedDisplay(
                            slidingBeginOffset: Offset(-2, 0),
                            delay: Duration(
                                milliseconds:
                                    initialDelay.inMilliseconds + 200),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('Images/light-2.png'))),
                            ),
                          )),
                      Positioned(
                        child: DelayedDisplay(
                          // slidingCurve: Curves.bounceOut,
                          slidingBeginOffset: Offset(0, -5),
                          delay: Duration(
                              milliseconds: initialDelay.inMilliseconds + 100),
                          child: Container(
                            margin: EdgeInsets.only(top: 130),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: DelayedDisplay(
                    // slidingCurve: Curves.bounceOut,
                    slidingBeginOffset: Offset(2, 0),
                    delay: Duration(
                        milliseconds: initialDelay.inMilliseconds + 200),
                    child: Container(
                      child: commonTextField(
                        enabled: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: temail,
                        color: Colors.black54,
                        onchange: (value) {
                          setState(() {
                            emailstatus = false;
                          });
                        },
                        labelText: 'Enter Email',
                        errorText: emailstatus ? 'Enter Email Id' : null,
                        prefixIcon: Icons.mail,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                  child: DelayedDisplay(
                    // slidingCurve: Curves.bounceOut,
                    slidingBeginOffset: Offset(-2, 0),
                    delay: Duration(
                        milliseconds: initialDelay.inMilliseconds + 200),
                    child: Container(
                      child: commonTextField(
                        enabled: false,
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
                          icon: Icon(showpass
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        errorText: passstatus ? 'Enter Password' : null,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: size.width * 0.3, right: size.width * 0.3),
                  child: DelayedDisplay(
                    // slidingCurve: Curves.bounceOut,
                    slidingBeginOffset: Offset(0, 5),
                    delay: Duration(
                        milliseconds: initialDelay.inMilliseconds + 300),
                    child: InkWell(
                      onTap: () {},
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
