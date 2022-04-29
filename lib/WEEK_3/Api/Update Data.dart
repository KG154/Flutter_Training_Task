import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Updatedata extends StatefulWidget {
  String uid;
  String Ename;
  String Eemail;
  String Images;

  Updatedata(this.uid, this.Ename, this.Eemail, this.Images);

  @override
  State<Updatedata> createState() => _UpdatedataState();
}

class _UpdatedataState extends State<Updatedata> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  String emailerror = "";
  bool namestatus = false;
  bool emailstatus = false;
  final ImagePicker _picker = ImagePicker();
  XFile? image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tname.text = widget.Ename;
    temail.text = widget.Eemail;
  }

  /*   */
  Future<void> EditData(String name, String email) async {
    var respons = await http.put(
        Uri.parse("http://192.168.1.38/Practical_Api/api/edit_user_details"),
        headers: {
          "Token":
              "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        },
        body: {
          "user_id": widget.uid,
          "name": name,
          "email": email,
        });
    if (respons.statusCode == 200) {
      if (image != null) {
        Map<String, String> bodyData = Map<String, String>();
        bodyData["user_id"] = widget.uid;
        await changeImage(
          image!.path,
          bodyData,
        );
      } else {
        Navigator.pop(context, true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid')),
      );
    }
  }

  /* */
  Future<void> changeImage(
    String path,
    Map<String, String> bodyDAta,
  ) async {
    final request = await http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.1.38/Practical_Api/api/change_profile_pic"),
    );
    var header = {
      "Token":
          "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
    };
    request.headers.addAll(header);
    request.fields.addAll(bodyDAta);
    request.files.add(await http.MultipartFile.fromPath('profile_pic', path));
    var res = await request.send();
    // final responseX = await res.stream.bytesToString();
    // print(responseX);

    if (res.statusCode == 200) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
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
          padding: EdgeInsets.only(top: 80, left: 10, right: 10),
          children: [
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
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 90,
                                        width: 70,
                                        margin: const EdgeInsets.only(
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
                                                  color: Colors.green.shade900,
                                                ),
                                                backgroundColor:
                                                    Colors.green.shade100,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Camera",
                                                style: TextStyle(fontSize: 15),
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
                                        setState(() {});
                                        Navigator.pop(context);
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
                                                  color: Colors.green.shade900,
                                                ),
                                                backgroundColor:
                                                    Colors.green.shade100,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Camera",
                                                style: TextStyle(fontSize: 15),
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
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    child: image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              File(image!.path),
                              width: 105,
                              height: 105,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  image: NetworkImage(widget.Images),
                                  fit: BoxFit.cover),
                            ),
                          ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
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
                  labelText: 'Name',
                  hintText: 'abc',
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
              padding: EdgeInsets.only(top: 15, bottom: 20),
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
                  hintText: 'abc@gmail.com',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
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
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String name = tname.text;
                      String email = temail.text;

                      bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(email);
                      if (name.isEmpty && email.isEmpty) {
                        namestatus = true;
                        emailstatus = true;
                        emailerror = 'Email Is required';
                      } else if (name.isEmpty && !emailValid) {
                        namestatus = true;
                        emailstatus = true;
                        emailerror = 'Enter Valid Email..';
                      } else if (name.isEmpty) {
                        namestatus = true;
                      } else if (email.isEmpty) {
                        emailstatus = true;
                        emailerror = 'Email Is required';
                      } else if (!emailValid) {
                        emailstatus = true;
                        emailerror = 'Enter Valid Email..';
                      } else {
                        // Map<String, String> bodyData = Map<String, String>();
                        // bodyData["user_id"] = widget.uid;
                        // changeImage(
                        //   image!.path,
                        //   bodyData,
                        // );
                        EditData(
                          name,
                          email,
                        );
                      }
                    });
                  },
                  child: Text('Save')),
            ),
          ],
        ),
      ),
    );
  }

// Future<void> EditData(
//   String name,
//   String email,
// ) async {
//   //   final request = await http.MultipartRequest(
//   //     'PUT',
//   //     Uri.parse("http://192.168.1.14/Practical_Api/api/edit_user_details"),
//   //   );
//   //   request.fields['name'] = name;
//   //   request.fields['email'] = email;
//   //   request.files.add(await http.MultipartFile.fromPath('profile_pic', path));
//   //
//   //   var header = {
//   //     "Token":
//   //         "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
//   //   };
//   //   request.headers.addAll(header);
//   //   var res = await request.send();
//   //   if (res.statusCode == 200) {
//   //     Navigator.pop(context);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Invalid')),
//   //     );
//   //   }
//   // }
//
//   if (tname.text.isNotEmpty && temail.text.isNotEmpty) {
//     var respons = await http.put(
//         Uri.parse("http://192.168.1.14/Practical_Api/api/edit_user_details"),
//         headers: {
//           "Token":
//               "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
//         },
//         body: {
//           "user_id": widget.uid,
//           "name": name,
//           "email": email,
//         });
//     if (respons.statusCode == 200) {
//       if (image != null) {
//         await ChangeImage(image!.path);
//       } else {
//         Navigator.pop(context, true);
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid')),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Black Field Not Allowed')),
//     );
//   }
// }
//
// Future<void> ChangeImage(String path) async {
//   final request = await http.MultipartRequest(
//     'POST',
//     Uri.parse("http://192.168.1.14/Practical_Api/api/change_profile_pic"),
//   );
//   var header = {
//     "Token":
//         "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
//   };
//   request.files.add(await http.MultipartFile.fromPath('profile_pic', path));
//   request.headers.addAll(header);
//   var res = await request.send();
//
//   if (res.statusCode == 200) {
//     Navigator.pop(context, true);
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Invalid')),
//     );
//   }
// }

}
