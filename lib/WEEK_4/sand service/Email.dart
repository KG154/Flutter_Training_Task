import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:taskproject/Widget/commonWidget.dart';
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

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email demo'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: isLoading
          ? Container(
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
                        margin: EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 10),
                        child: commonTextField(
                          controller: tname,
                          onchange: (value) {
                            setState(() {
                              namestatus = false;
                            });
                          },
                          labelText: 'Enter Name',
                          errorText: namestatus ? 'Name Is required' : null,
                          prefixIcon: Icons.person,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        child: commonTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: temail,
                          onchange: (value) {
                            setState(() {
                              emailstatus = false;
                            });
                          },
                          labelText: 'Enter Email',
                          errorText: emailstatus ? '$emailerror' : null,
                          prefixIcon: Icons.mail,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        child: commonTextField(
                          controller: tsubject,
                          onchange: (value) {
                            setState(() {
                              subjectstatus = false;
                            });
                          },
                          labelText: 'Enter subject',
                          errorText:
                              subjectstatus ? 'subject Is required' : null,
                          prefixIcon: Icons.subject_outlined,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 50),
                        child: commonTextField(
                          maxLines: 5,
                          controller: tmessage,
                          onchange: (value) {
                            setState(() {
                              messagesstatus = false;
                            });
                          },
                          labelText: 'Enter Message',
                          errorText:
                              messagesstatus ? 'Message Is required' : null,
                          prefixIcon: Icons.message,
                        ),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(
                      //       top: 10, left: 20, right: 20, bottom: 50),
                      //   child: TextField(
                      //     controller: tmessage,
                      //     keyboardType: TextInputType.text,
                      //     maxLines: 5,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         messagesstatus = false;
                      //       });
                      //     },
                      //     style: const TextStyle(color: Colors.white),
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(16),
                      //       ),
                      //       labelText: 'Enter Message',
                      //       labelStyle: TextStyle(color: Colors.white),
                      //       prefixIcon: const Padding(
                      //         padding: EdgeInsets.only(
                      //             left: 20, right: 20, bottom: 75),
                      //         child: Icon(
                      //           Icons.message,
                      //           color: Colors.white,
                      //           size: 30,
                      //         ),
                      //       ),
                      //       errorText:
                      //           messagesstatus ? 'Message Is required' : null,
                      //     ),
                      //   ),
                      // ),

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
                        child: commonButton(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 200,
                          height: 50,
                          title: "Sand Dircet EMAIL",
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
                        child: commonButton(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: 140,
                          height: 50,
                          title: "Sand EMAIL",
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
            )
          : Center(
              child: CircularProgressIndicator(),
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
    setState(() {
      isLoading = false;
    });
    final user = await GoogleAuthApi.signIn();
    setState(() {
      isLoading = true;
    });

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
      setState(() {
        isLoading = false;
      });
      await send(message, smtpServer);
      setState(() {
        isLoading = true;
      });
      Fluttertoast.showToast(msg: 'email send successfully');
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
