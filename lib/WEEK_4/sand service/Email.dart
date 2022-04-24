import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';

import 'modal.dart';

class Email extends StatefulWidget {
  const Email({Key? key}) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tsubject = TextEditingController();
  TextEditingController tmessage = TextEditingController();

  bool namestatus = false;
  bool emailstatus = false;
  bool subjectstatus = false;
  bool messagesstatus = false;
  String emailerror = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email demo'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: tname,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        namestatus = false;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: namestatus ? 'Name Is required' : null,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: temail,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        emailstatus = false;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: emailstatus ? '$emailerror' : null,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: tsubject,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      setState(() {
                        subjectstatus = false;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter subject',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.subject_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: subjectstatus ? 'subject Is required' : null,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 50),
                  child: TextField(
                    controller: tmessage,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {
                        messagesstatus = false;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter Message',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 75),
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: messagesstatus ? 'Message Is required' : null,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      String name = tname.text;
                      String email = temail.text;
                      String subject = tsubject.text;
                      String message = tmessage.text;

                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(email);

                      if (name.isEmpty) {
                        namestatus = true;
                      } else if (email.isEmpty) {
                        emailstatus = true;
                        emailerror = 'Email Is required';
                      } else if (!emailValid) {
                        emailstatus = true;
                        emailerror = 'Enter Valid Email..';
                      } else if (subject.isEmpty) {
                        subjectstatus = true;
                      } else if (message.isEmpty) {
                        messagesstatus = true;
                      } else {
                        sandemail();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 200,
                    height: 50,
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
                      "Sand Dircet EMAIL",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         String name = tname.text;
                //         String email = temail.text;
                //         String subject = tsubject.text;
                //         String message = tmessage.text;
                //
                //         bool emailValid = RegExp(
                //                 r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                //             .hasMatch(email);
                //
                //         if (name.isEmpty) {
                //           namestatus = true;
                //         } else if (email.isEmpty) {
                //           emailstatus = true;
                //           emailerror = 'Email Is required';
                //         } else if (!emailValid) {
                //           emailstatus = true;
                //           emailerror = 'Enter Valid Email..';
                //         } else if (subject.isEmpty) {
                //           subjectstatus = true;
                //         } else if (message.isEmpty) {
                //           messagesstatus = true;
                //         } else {
                //           sandemail();
                //         }
                //       });
                //     },
                //     child: Text("Sand Dircet EMAIL")),
                InkWell(
                  onTap: () {
                    setState(() {
                      String name = tname.text;
                      String email = temail.text;
                      String subject = tsubject.text;
                      String message = tmessage.text;

                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(email);

                      if (name.isEmpty) {
                        namestatus = true;
                      } else if (email.isEmpty) {
                        emailstatus = true;
                        emailerror = 'Email Is required';
                      } else if (!emailValid) {
                        emailstatus = true;
                        emailerror = 'Enter Valid Email..';
                      } else if (subject.isEmpty) {
                        subjectstatus = true;
                      } else if (message.isEmpty) {
                        messagesstatus = true;
                      } else {
                        _launchURL(email, subject, message);
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 140,
                    height: 50,
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
                      "Sand EMAIL",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         String name = tname.text;
                //         String email = temail.text;
                //         String subject = tsubject.text;
                //         String message = tmessage.text;
                //
                //         bool emailValid = RegExp(
                //                 r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                //             .hasMatch(email);
                //
                //         if (name.isEmpty) {
                //           namestatus = true;
                //         } else if (email.isEmpty) {
                //           emailstatus = true;
                //           emailerror = 'Email Is required';
                //         } else if (!emailValid) {
                //           emailstatus = true;
                //           emailerror = 'Enter Valid Email..';
                //         } else if (subject.isEmpty) {
                //           subjectstatus = true;
                //         } else if (message.isEmpty) {
                //           messagesstatus = true;
                //         } else {
                //           _launchURL(email, subject, message);
                //         }
                //       });
                //     },
                //     child: Text("Sand EMAIL"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sandemail() async {
    final user = await GoogleAuthApi.signIn();

    if (user == null) return;
    final email = user.email;
    final auth = await user.authentication;
    final token = auth.accessToken!;

    print("Auth : $email");

    GoogleAuthApi.signout();

    final smtpServer = gmailSaslXoauth2(email, token);
    final message = Message()
      ..from = Address(email, 'KishanGajera@84')
      ..recipients = [temail.text]
      ..subject = tsubject.text
      ..text = tmessage.text;

    try {
      await send(message, smtpServer);
      Fluttertoast.showToast(msg: 'email send succesfully');
      tname.clear();
      temail.clear();
      tsubject.clear();
      tmessage.clear();
    } on MailerException catch (e) {
      print(e);
    }
  }

  void showSnakBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
