import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class allGestures extends StatefulWidget {
  const allGestures({Key? key}) : super(key: key);

  @override
  State<allGestures> createState() => _allGesturesState();
}

class _allGesturesState extends State<allGestures> {
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  double _scale = 1.0;
  double? _previousScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              _previousScale = _scale;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _scale = _previousScale! * details.scale;
              });
            },
            onScaleEnd: (ScaleEndDetails details) {
              _previousScale = null;
            },
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Center(
                    child: Text(
                  "onScale",
                  textScaleFactor: _scale,
                )),
              ),
            ),
          ),
          // child: LayoutBuilder(
          //   builder: (BuildContext context, BoxConstraints constraints) {
          //     Offset centerOfGestureDetector =
          //         Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);
          //     return GestureDetector(
          //
          //       onPanStart: (details) {
          //         final touchPositionFromCenter =
          //             details.localPosition - centerOfGestureDetector;
          //         upsetAngle = oldAngle - touchPositionFromCenter.direction;
          //       },
          //       onPanUpdate: (details) {
          //         final touchPositionFromCenter =
          //             details.localPosition - centerOfGestureDetector;
          //
          //         setState(() {
          //           finalAngle = touchPositionFromCenter.direction + upsetAngle;
          //         });
          //       },
          //       onPanEnd: (details) {
          //         setState(() {
          //           oldAngle = finalAngle;
          //         });
          //       },
          //       child: Transform.rotate(
          //
          //         angle: finalAngle,
          //         child: Container(
          //           height: 200,
          //           width: 200,
          //           color: Colors.red,
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
