import 'dart:io';

import 'package:flutter/material.dart';

import 'AllImageScreen.dart';

class imageVideo_Show_Screen extends StatefulWidget {
   File imageFile;
   List<File> fileList;

  imageVideo_Show_Screen(
      {required this.imageFile,
      required this.fileList}); // const imageVideo_Show_Screen({Key? key}) : super(key: key);

  @override
  State<imageVideo_Show_Screen> createState() => _imageVideo_Show_ScreenState();
}

class _imageVideo_Show_ScreenState extends State<imageVideo_Show_Screen> {
  // var fileList;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fileList = widget.fileList;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.file(widget.imageFile),
          ),
          Positioned(
            top: size.height * 0.9,
            left: size.width * 0.75,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AllImageScreen(
                      FileList: widget.fileList,
                    ),
                  ),
                );
              },
              child: Text('All Images'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
