import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'AllImageScreen.dart';

class imageVideo_Show_Screen extends StatefulWidget {
  File imageFile;
  List<File> fileList;

  imageVideo_Show_Screen({required this.imageFile, required this.fileList});

  @override
  State<imageVideo_Show_Screen> createState() => _imageVideo_Show_ScreenState();
}

class _imageVideo_Show_ScreenState extends State<imageVideo_Show_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: PhotoView(
            imageProvider: FileImage(widget.imageFile),
          ),
        ),

        // InteractiveViewer(
        //   panEnabled: false,
        //   boundaryMargin: EdgeInsets.all(100),
        //   minScale: 0.5,
        //   maxScale: 2,
        //   child: Container(
        //     width: double.infinity,
        //     height: double.infinity,
        //     child: Image.file(
        //       widget.imageFile,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
