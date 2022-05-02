import 'package:flutter/material.dart';
import '../../Widget/commonWidget.dart';
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
              child: commonContainer(
                title: "Stack Demo",
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
              child: commonContainer(
                title: "Image Demo",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/Alert');
              },
              child: commonContainer(
                title: "Alert Dialog Demo",
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
              child: commonContainer(
                title: "Bottom Navigation Bar Demo",
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
              child: commonContainer(
                title: "Custom BottomBar Demo",
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
              child: commonContainer(
                title: "Gridview Demo",
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
              child: commonContainer(
                title: "Search Bar Demo",
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
              child: commonContainer(
                title: "ListView Demo",
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
              child: commonContainer(
                title: "DropDownMenu Demo",
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
              child: commonContainer(
                title: "Check Box Demo",
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
              child: commonContainer(
                title: "Radio Box Demo",
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
              child: commonContainer(
                title: "Time Picker Demo",
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
              child: commonContainer(
                title: "Date Picker Demo",
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
              child: commonContainer(
                title: "Date & Time Picker Demo",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
