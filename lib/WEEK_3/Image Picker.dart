import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePicker1 extends StatefulWidget {
  const ImagePicker1({Key? key}) : super(key: key);

  @override
  State<ImagePicker1> createState() => _ImagePicker1State();
}

class _ImagePicker1State extends State<ImagePicker1> {
  File? _image;

  File? _video;

  ImagePicker picker = ImagePicker();

  VideoPlayerController? _videoPlayerController;

  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile!.path);

    setState(() {
      _image = image;
    });
  }

  _pickImageFromCamera() async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile!.path);

    setState(() {
      _image = image;
    });
  }

  _pickVideo() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.camera);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        title: Text('Image Picker  '),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                _image != null
                    ? Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: FileImage(
                              File(_image!.path),
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
                        // child: Image.file(_image!),
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(top: 30, bottom: 30),
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
                                        onTap: () {
                                          _pickImageFromCamera();
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
                                                margin: EdgeInsets.only(top: 5),
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
                                        onTap: () {
                                          _pickImageFromGallery();
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
                                                margin: EdgeInsets.only(top: 5),
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
                  child: Container(
                    width: 100,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 50),
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
                      "Tack photo",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),

                _video != null
                    ? _videoPlayerController!.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                          )
                        : Container()
                    : Container(),

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
                                        'Select Your Video',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _pickVideoFromCamera();
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
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "Video",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _pickVideo();
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
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "Video",
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
                  child: Container(
                    width: 100,
                    height: 40,
                    margin: EdgeInsets.only(top: 10),
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
                      "Tack Video",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                // if (_video != null)
                //   _videoPlayerController!.value.isInitialized
                //       ? AspectRatio(
                //           aspectRatio:
                //               _videoPlayerController!.value.aspectRatio,
                //           child: VideoPlayer(_videoPlayerController!),
                //         )
                //       : Container()
                // else
                //   Text(
                //     "Click on Pick Video to select video",
                //     style: TextStyle(fontSize: 18.0),
                //   ),
                // RaisedButton(
                //   onPressed: () {
                //     _pickVideo();
                //   },
                //   child: Text("Pick Video From Gallery"),
                // ),
                // if (_cameraVideo != null)
                //   _cameraVideoPlayerController!.value.isInitialized
                //       ? AspectRatio(
                //           aspectRatio:
                //               _cameraVideoPlayerController!.value.aspectRatio,
                //           child: VideoPlayer(_cameraVideoPlayerController!),
                //         )
                //       : Container()
                // else
                //   Text(
                //     "Click on Pick Video to select video",
                //     style: TextStyle(fontSize: 18.0),
                //   ),
                // RaisedButton(
                //   onPressed: () {
                //     _pickVideoFromCamera();
                //   },
                //   child: Text("Pick Video From Camera"),
                // )
              ],
            ),
          ),
        ),
      ),

      // Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topRight,
      //           end: Alignment.bottomLeft,
      //           colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
      //   child: Center(
      //     child: Column(
      //       children: [
      //         video != null
      //             ? Expanded(
      //                 child: Container(
      //                   width: double.infinity,
      //                   height: 200,
      //                   decoration: BoxDecoration(
      //                     image: DecorationImage(
      //                       image: FileImage(
      //                         File(video!.path),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               )
      //             : Container(),
      //
      //         ElevatedButton(
      //           onPressed: () async {
      //             video = await _picker.pickVideo(source: ImageSource.camera);
      //
      //             setState(() {});
      //           },
      //           child: Text("Video"),
      //         ),
      //         // image != null
      //         //     ? Container(
      //         //         height: 150,
      //         //         width: 150,
      //         //         margin: EdgeInsets.only(top: 100, bottom: 70),
      //         //         decoration: BoxDecoration(
      //         //           color: Color(0xFFFFFFFF),
      //         //           borderRadius: BorderRadius.circular(20),
      //         //           image: DecorationImage(
      //         //             image: FileImage(
      //         //               File(image!.path),
      //         //             ),
      //         //             fit: BoxFit.cover,
      //         //           ),
      //         //           boxShadow: [
      //         //             BoxShadow(
      //         //               color: Colors.black12,
      //         //               blurRadius: 10,
      //         //             ),
      //         //           ],
      //         //         ),
      //         //       )
      //             : Container(
      //                 width: 150,
      //                 height: 150,
      //                 margin: EdgeInsets.only(top: 100, bottom: 70),
      //                 decoration: BoxDecoration(
      //                   color: const Color(0xFFFFFFFF),
      //                   borderRadius: BorderRadius.circular(20),
      //                   image: DecorationImage(
      //                     image: AssetImage("Images/profile.jpg"),
      //                     fit: BoxFit.cover,
      //                   ),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.black12,
      //                       blurRadius: 10,
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //         InkWell(
      //           onTap: () {
      //             setState(() {
      //               showModalBottomSheet(
      //                   barrierColor: Colors.transparent,
      //                   context: context,
      //                   builder: (context) {
      //                     return Container(
      //                       width: double.infinity,
      //                       height: 170,
      //                       color: Colors.white,
      //                       child: Wrap(
      //                         children: [
      //                           const ListTile(
      //                             title: Padding(
      //                               padding: EdgeInsets.only(left: 20.0),
      //                               child: Text(
      //                                 'Select Your Image',
      //                                 style: TextStyle(fontSize: 20),
      //                               ),
      //                             ),
      //                           ),
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               InkWell(
      //                                 onTap: () async {
      //                                   image = await _picker.pickImage(
      //                                       source: ImageSource.camera);
      //                                   Navigator.pop(context);
      //                                   setState(() {});
      //                                 },
      //                                 child: Container(
      //                                   height: 90,
      //                                   width: 70,
      //                                   margin: EdgeInsets.only(
      //                                       top: 5,
      //                                       left: 25,
      //                                       right: 25,
      //                                       bottom: 5),
      //                                   child: Column(
      //                                     children: [
      //                                       Container(
      //                                         child: CircleAvatar(
      //                                           radius: 30,
      //                                           child: Icon(
      //                                             Icons.camera_alt_rounded,
      //                                             size: 40,
      //                                             color: Colors.green.shade900,
      //                                           ),
      //                                           backgroundColor:
      //                                               Colors.green.shade100,
      //                                         ),
      //                                       ),
      //                                       Container(
      //                                         margin: EdgeInsets.only(top: 5),
      //                                         child: Text(
      //                                           "Camera",
      //                                           style: TextStyle(fontSize: 15),
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                               InkWell(
      //                                 onTap: () async {
      //                                   image = await _picker.pickImage(
      //                                       source: ImageSource.gallery);
      //                                   Navigator.pop(context);
      //                                   setState(() {});
      //                                 },
      //                                 child: Container(
      //                                   height: 90,
      //                                   width: 70,
      //                                   margin: EdgeInsets.only(
      //                                       top: 5,
      //                                       left: 25,
      //                                       right: 25,
      //                                       bottom: 5),
      //                                   child: Column(
      //                                     children: [
      //                                       Container(
      //                                         child: CircleAvatar(
      //                                           radius: 30,
      //                                           child: Icon(
      //                                             Icons.photo,
      //                                             size: 40,
      //                                             color: Colors.green.shade900,
      //                                           ),
      //                                           backgroundColor:
      //                                               Colors.green.shade100,
      //                                         ),
      //                                       ),
      //                                       Container(
      //                                         margin: EdgeInsets.only(top: 5),
      //                                         child: Text(
      //                                           "Camera",
      //                                           style: TextStyle(fontSize: 15),
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     );
      //                   });
      //             });
      //           },
      //           child: Container(
      //             width: 100,
      //             height: 40,
      //             alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //                 // color: Colors.black54,
      //                 borderRadius: BorderRadius.circular(10),
      //                 gradient: LinearGradient(
      //                     begin: Alignment.topRight,
      //                     end: Alignment.bottomLeft,
      //                     colors: [
      //                       Colors.black54,
      //                       Color.fromRGBO(0, 41, 102, 1)
      //                     ]),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       color: Colors.black87.withOpacity(0.3),
      //                       blurRadius: 1,
      //                       offset: Offset(0, 1),
      //                       spreadRadius: 1)
      //                 ],
      //                 border: Border.all(color: Colors.blue)),
      //             child: Text(
      //               "Add photo",
      //               style: TextStyle(
      //                 letterSpacing: 2,
      //                 color: const Color(0xFFFFFFFF),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
