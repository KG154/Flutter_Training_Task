import 'dart:io';

import 'package:flutter/material.dart';

import 'Image&Video Show Screen.dart';


class AllImageScreen extends StatefulWidget {
  List<File> fileList;

  AllImageScreen(
      {required this.fileList}); // const AllImageScreen({Key? key}) : super(key: key);

  @override
  State<AllImageScreen> createState() => _AllImageScreenState();
}

class _AllImageScreenState extends State<AllImageScreen> {
  List<File> fileList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fileList = widget.fileList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  for (File imageFile in widget.fileList)
                    // for (File videoFile in widget.fileList)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => imageVideo_Show_Screen(
                                fileList: widget.fileList,
                                imageFile: imageFile,
                                // videoFile: videoFile,
                              ),
                            ),
                          );
                        },
                        // child: Image.file(
                        //   imageFile,
                        //   fit: BoxFit.cover,
                        // ),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
