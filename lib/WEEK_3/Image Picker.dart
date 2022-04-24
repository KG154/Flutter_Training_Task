import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker1 extends StatefulWidget {
  const ImagePicker1({Key? key}) : super(key: key);

  @override
  State<ImagePicker1> createState() => _ImagePicker1State();
}

class _ImagePicker1State extends State<ImagePicker1> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isLoading = true;

  // FilePickerResult? result;
  // String? filename;
  // PlatformFile? pickedfile;
  // File? filetoDisplay;
  //
  // Future<void> pickfile() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });
  //
  //     result = await FilePicker.platform.pickFiles(
  //       type: FileType.any,
  //       allowMultiple: false,
  //     );
  //     if (result != null) {
  //       filename = result!.files.first.name;
  //       pickedfile = result!.files.first;
  //       filetoDisplay = File(pickedfile!.path.toString());
  //     }
  //
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        title: const Text('Image Picker & Image Capture'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: Column(
            children: [
              image != null
                  ? Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.only(top: 100, bottom: 70),
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
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.only(top: 100, bottom: 70),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("Images/profile.jpg"),
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
                    "Add photo",
                    style: TextStyle(
                      letterSpacing: 2,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Center(
      //       child: isLoading
      //           ? CircularProgressIndicator()
      //           : InkWell(
      //         onTap: () {
      //           pickfile();
      //         },
      //             child: Container(
      //                 width: 100,
      //                 height: 40,
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(
      //                   color: Colors.greenAccent,
      //                   borderRadius: BorderRadius.circular(10),
      //                   gradient: const LinearGradient(
      //                       colors: [Color(0xFFD62828), Color(0xFFF77F00)]),
      //                 ),
      //                 child: Text(
      //                   "Add photo",
      //                   style: TextStyle(
      //                     letterSpacing: 2,
      //                     color: const Color(0xFFFFFFFF),
      //                   ),
      //                 ),
      //               ),
      //           ),
      //     ),
      //     if (pickedfile != null)
      //       SizedBox(
      //         height: 150,
      //         width: 150,
      //         child: Image.file(filetoDisplay!),
      //       ),
      //   ],
      // ),
    );
  }
}

/*
* */
