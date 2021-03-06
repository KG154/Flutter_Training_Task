import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  bool isvertical = true;

  // double? startPositionV;
  // double? startPositionH;
  // double? endPositionV;
  // double? endPositionH;
  // int inx = 0;
  // int? selectinx;
  //
  // Axis axisDirection = Axis.horizontal;
  //
  // bool horizontal = true;
  // bool vertical = false;
  // double visibilityHorizontal = 1.0;
  // double visibilityVertical = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onHorizontalDragEnd: (val) {
          setState(() {
            isvertical = false;
            // endPositionV = val.globalPosition.dy;
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            isvertical = true;
          });
        },
        child: CarouselSlider.builder(
          itemCount: urlImages.length,
          options: CarouselOptions(
            viewportFraction: 1,
            // enlargeCenterPage: false,
            scrollDirection: isvertical ? Axis.vertical : Axis.horizontal,
            height: MediaQuery.of(context).size.height,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 1),
            reverse: false,
            // aspectRatio: 5.0,
          ),
          itemBuilder: (context, i, id) {
            return Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: PhotoViewGallery.builder(
                  scrollDirection: isvertical ? Axis.vertical : Axis.horizontal,
                  itemCount: urlImages.length,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  builder: (context, index) {
                    final imagelist = urlImages[i];

                    return PhotoViewGalleryPageOptions(
                        onTapUp: (context, details, controllerValue) {
                          print("${details} ${controllerValue.position}");
                        },
                        onScaleEnd: (context, details, controllerValue) {
                          print("sdff");
                        },
                        imageProvider: AssetImage(urlImages[i]),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.contained * 4);
                  }),
            );
          },
        ),
      ),
    );
  }

//   Scaffold(
//   appBar: AppBar(
//     title: const Text(
//       "Gestures",
//       style: TextStyle(fontSize: 25),
//     ),
//     centerTitle: true,
//     backgroundColor: Colors.black45,
//   ),
//   body: GestureDetector(
//     onVerticalDragUpdate: (val) {
//       setState(() {
//         axisDirection = Axis.vertical;
//         endPositionV = val.globalPosition.dy;
//       });
//     },
//     onVerticalDragStart: (val) {
//       setState(() {
//         axisDirection = Axis.vertical;
//         startPositionV = val.globalPosition.dy;
//       });
//     },
//     onVerticalDragEnd: (val) {
//       setState(() {
//         axisDirection = Axis.vertical;
//       });
//       if (startPositionV! > endPositionV!) {
//         print("up");
//         if (inx != (urlImages.length - 1)) {
//           setState(() {
//             inx = inx + 1;
//           });
//         }
//       } else {
//         print("down");
//         if (inx != 0) {
//           setState(() {
//             inx = inx - 1;
//           });
//         }
//       }
//     },
//     onHorizontalDragStart: (val) {
//       setState(() {
//         axisDirection = Axis.horizontal;
//         startPositionH = val.globalPosition.dx;
//       });
//     },
//     onHorizontalDragEnd: (val) {
//       setState(() {
//         axisDirection = Axis.horizontal;
//       });
//       if (inx != urlImages.length) {
//         if (startPositionH! > endPositionH!) {
//           print("right");
//           if (inx != (urlImages.length - 1)) {
//             print("s");
//             setState(() {
//               inx = inx + 1;
//             });
//           }
//         } else {
//           print("left");
//           setState(() {
//             axisDirection = Axis.horizontal;
//             if (inx != 0) {
//               inx = inx - 1;
//             }
//           });
//         }
//       }
//     },
//     onHorizontalDragUpdate: (val) {
//       setState(() {
//         endPositionH = val.globalPosition.dx;
//       });
//     },
//     child: horizontal
//         ? Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Visibility(
//               visible: horizontal,
//               child: PhotoViewGallery.builder(
//                 scrollDirection: axisDirection,
//                 itemCount: urlImages.length,
//                 builder: (context, index) {
//                   inx = index;
//                   return PhotoViewGalleryPageOptions(
//                     imageProvider: AssetImage(
//                       urlImages[index],
//                     ),
//                     minScale: PhotoViewComputedScale.contained * 0.8,
//                     maxScale: PhotoViewComputedScale.covered * 2,
//                   );
//                 },
//                 backgroundDecoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   color: Theme.of(context).canvasColor,
//                 ),
//                 enableRotation: true,
//               ),
//             ),
//           )
//         : Visibility(
//             visible: vertical,
//             child: PhotoView(
//               imageProvider: AssetImage(urlImages[inx]),
//               minScale: 1.0,
//               maxScale: 5.0,
//               enableRotation: true,
//             )),
//   ),
// );
// }
}
