import 'package:flutter/material.dart';
import 'Bottom Navigation Bar.dart';
import 'CheckBox.dart';
import 'Custom Bottom Bar.dart';
import 'Date & Time Picker.dart';
import 'Date Picker.dart';
import 'DeopDown.dart';
import 'Gridview.dart';
import 'Image.dart';
import 'ListView Demo.dart';
import 'Radio Box.dart';
import 'Search.dart';
import 'Stack.dart';
import 'Time Picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Demo'),
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return stack1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                  // gradient: const LinearGradient(colors: [
                  //   Color(0xFF0D22EC),
                  //   Color(0xFF428EC1),
                  // ], begin: Alignment.topLeft, end: Alignment.topRight),
                ),
                child: const Center(
                    child: Text(
                  'Stack Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Image1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],),
                child: const Center(
                    child: Text(
                  'Image Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/Alert');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Alert Dialog Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Bottom1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Bottom Navigation Bar Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CustomBottomBar();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Custom BottomBar Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Gridview1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Gridview Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Search1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Search Bar Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Listv1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'ListView Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Drop1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'DropDownMenu Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Chechbox1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Check Box Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Radio1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Radio Box Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Time1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Time Picker Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Datepicker1();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Date Picker Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const datetime();
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(70, 70),
                    bottomLeft: Radius.elliptical(70, 70),
                    // bottomRight: Radius.elliptical(100, 100)
                  ),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87.withOpacity(0.3),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                        spreadRadius: 1)
                  ],
                ),
                child: const Center(
                    child: Text(
                  'Date & Time Picker Demo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
