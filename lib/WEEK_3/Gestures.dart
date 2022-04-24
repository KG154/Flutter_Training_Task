import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// import 'package:vector_math/vector_math_64.dart';

class Gestures1 extends StatefulWidget {
  const Gestures1({Key? key}) : super(key: key);

  @override
  State<Gestures1> createState() => _Gestures1State();
}

class _Gestures1State extends State<Gestures1> {
  List urlImages = [
    'Images/OIP.jpg',
    'Images/OIP1.jpg',
    'Images/OIP2.jpg',
    'Images/R.jpg',
    'Images/Elephant.jpg',
    'Images/download1.jpg',
  ];
  bool isVerticle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gestures",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          setState(() {
            isVerticle = false;
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            isVerticle = true;
          });
        },
        child: Center(
          child: PhotoViewGallery.builder(
            scrollDirection: isVerticle ? Axis.vertical : Axis.horizontal,
            backgroundDecoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            // scrollPhysics: BouncingScrollPhysics(),
            itemCount: urlImages.length,
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(urlImages[index]),
                minScale: PhotoViewComputedScale.contained * 0.2,
                maxScale: PhotoViewComputedScale.covered * 5,
              );
            },
            enableRotation: true,
          ),
        ),
      ),
    );
  }
}
