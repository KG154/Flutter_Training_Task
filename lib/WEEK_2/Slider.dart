import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sliders extends StatefulWidget {
  const sliders({Key? key}) : super(key: key);

  @override
  State<sliders> createState() => _slidersState();
}

class _slidersState extends State<sliders> {
  double _lowerValue = 1;
  double _upperValue = 100;
  double _currentSliderValue = 10;

  RangeValues _values = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter slider tutorial'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Padding(
          padding: const EdgeInsets.only(top: 170, left: 20, right: 20),
          child: Column(
            children: [
              FlutterSlider(
                values: [0],
                max: 100,
                min: 0,
                jump: true,
                handler: FlutterSliderHandler(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Images/im2.jpg"), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 3.0,
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                  // thumbColor: Colors.purple,
                  // activeColor: Colors.red,
                  // inactiveColor: Colors.blueAccent,
                  value: _currentSliderValue,
                  min: 1,
                  max: 100,
                  onChanged: (double valu) {
                    setState(() {
                      _currentSliderValue = valu;
                      // _currentSliderValue.toInt();
                    });
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'CurrentSliderValue : \n ${_currentSliderValue.toInt()}',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              RangeSlider(
                values: _values,
                activeColor: Colors.red,
                inactiveColor: Colors.blueAccent,
                min: 1,
                max: 100,
                onChanged: (valu) {
                  print("Start : ${_values.start}, End : ${_values.end}");
                  setState(() {
                    _values = valu;
                  });
                },
              ),
              Text(
                "Range between : \n${_values.start.toInt()} to ${_values.end.toInt()} ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
