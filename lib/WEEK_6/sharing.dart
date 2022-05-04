import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class sharingScreen extends StatefulWidget {
  const sharingScreen({Key? key}) : super(key: key);

  @override
  State<sharingScreen> createState() => _sharingScreenState();
}

class _sharingScreenState extends State<sharingScreen> {
  TextEditingController tname = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool namestatus = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
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
            Center(
              child: Column(
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

                  ///textfild
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
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
                        errorText: namestatus ? 'message Is required' : null,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: 170,
                                color: Colors.white,
                                child: Wrap(
                                  children: [
                                    const ListTile(
                                      title: Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          'Select Your Image',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            image = await _picker.pickImage(
                                                source: ImageSource.camera);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 90,
                                            width: 70,
                                            margin: EdgeInsets.only(
                                                top: 5,
                                                left: 25,
                                                right: 25,
                                                bottom: 5),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    child: Icon(
                                                      Icons.camera_alt_rounded,
                                                      size: 40,
                                                      color:
                                                          Colors.green.shade900,
                                                    ),
                                                    backgroundColor:
                                                        Colors.green.shade100,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    "Camera",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            image = await _picker.pickImage(
                                                source: ImageSource.gallery);
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 90,
                                            width: 70,
                                            margin: EdgeInsets.only(
                                                top: 5,
                                                left: 25,
                                                right: 25,
                                                bottom: 5),
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    child: Icon(
                                                      Icons.photo,
                                                      size: 40,
                                                      color:
                                                          Colors.green.shade900,
                                                    ),
                                                    backgroundColor:
                                                        Colors.green.shade100,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    "Camera",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      });
                    },
                    child: commonButton(
                      width: size.width * 0.4,
                      height: size.height * 0.06,
                      title: "Add photo",
                    ),
                  ),
                ],
              ),
            ),

            // Spacer(),
            Container(
                margin: EdgeInsets.only(
                    top: size.width * 0.3, bottom: size.width * 0.05),
                alignment: Alignment.center,
                child: Text(
                  "Share with.... ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => onButtonTap(ShareSocial.facebook),
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
                  onTap: () => onButtonTap(ShareSocial.whatsapp),
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
                  onTap: () => onButtonTap(ShareSocial.twitter),
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
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onButtonTap(ShareSocial.instagram),
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
            )
          ],
        ),
      ),
    );
  }

  Future<void> onButtonTap(ShareSocial share) async {
    String url =
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw3FvJd3Q6U8kRm4fbyM1z1K&ust=1651753537991000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCNjl5MvrxfcCFQAAAAAdAAAAABAJ';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();

    switch (share) {
      case ShareSocial.facebook:
        response = await flutterShareMe.shareToFacebook(
          url: url,
          msg: tname.text,
        );
        // if (image != null) {
        //   response = await flutterShareMe.shareToFacebook(
        //       url: image!.path, msg: tname.text);
        // } else if (tname.value.text.isNotEmpty) {
        //   response = await flutterShareMe.shareToFacebook(
        //     msg: tname.text,
        //   );
        // } else {
        //   showInSnackBar("Required Images or Message");
        // }
        break;
      case ShareSocial.twitter:
        if (image != null) {
          response = await flutterShareMe.shareToTwitter(
              url: image!.path, msg: tname.text);
        } else if (tname.value.text.isNotEmpty) {
          response = await flutterShareMe.shareToTwitter(
            msg: tname.text,
          );
        } else {
          showInSnackBar("Required Images or Message");
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
