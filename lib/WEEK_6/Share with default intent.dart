import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class share_with_default_intent extends StatefulWidget {
  const share_with_default_intent({Key? key}) : super(key: key);

  @override
  State<share_with_default_intent> createState() =>
      _share_with_default_intentState();
}

class _share_with_default_intentState extends State<share_with_default_intent> {
  TextEditingController tname = TextEditingController();
  bool namestatus = false;

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('share With Default Intent'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [
            Column(
              children: [
                image != null
                    ? Container(
                        height: 170,
                        width: 170,
                        margin: EdgeInsets.only(top: 50, bottom: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: FileImage(
                              File(image!.path),
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 170,
                        height: 170,
                        margin: EdgeInsets.only(top: 50, bottom: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("Images/download.jpg"),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: tname,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter Message',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: Container(
                    width: size.width * 0.3,
                    height: size.width * 0.12,
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
                      "Add photo",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (image != null) {
                      await Share.shareFiles([image!.path], text: tname.text);
                    } else if (tname.value.text.isNotEmpty) {
                      await Share.share(tname.text);
                    } else {
                      showInSnackBar("required Images & Message");
                    }
                  },
                  child: Container(
                    width: size.width * 0.45,
                    height: size.width * 0.12,
                    margin: EdgeInsets.only(
                        top: size.width * 0.08, bottom: size.width * 0.08),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        Text(
                          "Share With Default",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        onButtonTap(ShareSocial.facebook);
                      },
                      child: Container(
                        width: 50,
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
                        child: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onButtonTap(ShareSocial.whatsapp);
                      },
                      child: Container(
                        width: 50,
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
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onButtonTap(ShareSocial.instagram);
                      },
                      child: Container(
                        width: 50,
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
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onButtonTap(ShareSocial share) async {
    String url =
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case ShareSocial.facebook:
        if (tname.text.isNotEmpty) {
          response = await flutterShareMe.shareToFacebook(
            url: url,
            msg: tname.text,
          );
        } else {
          showInSnackBar("Required Message");
        }

        break;
      case ShareSocial.whatsapp:
        if (image != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: image!.path, msg: tname.text);
        } else if (tname.value.text.isNotEmpty) {
          response = await flutterShareMe.shareToWhatsApp(
            msg: tname.text,
          );
        } else {
          showInSnackBar("Required Images or Message");
        }
        break;
      case ShareSocial.instagram:
        if (image != null) {
          response =
              await flutterShareMe.shareToInstagram(filePath: image!.path);
        } else {
          showInSnackBar("Required Images");
        }
        break;
    }
    debugPrint(response);
  }

  showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black54,
        behavior: SnackBarBehavior.fixed,
        content: Text(value),
      ),
    );
  }
}

enum ShareSocial { facebook, whatsapp, twitter, instagram }
