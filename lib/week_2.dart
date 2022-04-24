import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'WEEK_2/Layouts/Layout.dart';
import 'WEEK_2/Slider.dart';
import 'WEEK_2/Tabbar.dart';
import 'WEEK_2/View Controller/First.dart';
import 'WEEK_2/Widgets/Custom TabBar.dart';
import 'WEEK_2/custom controls properties/properties.dart';
import 'WEEK_2/custom drawer.dart';

class Week2 extends StatefulWidget {
  const Week2({Key? key}) : super(key: key);

  @override
  State<Week2> createState() => _Week2State();
}

class _Week2State extends State<Week2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Week 2",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: ListView(
            padding: EdgeInsets.only(top: 5),
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TAB_BAR();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "TAB BAR",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CustomTabbar();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Custom Tab Bar",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Drawer');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Drawer",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CustomDrawer();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Custom Drawer",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const sliders();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Slider",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const First1();
                    },
                  ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Pass Data",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/widget');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Widgets",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LayoutPage();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "Layouts/Controls",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const propertis();
                    },
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.elliptical(70, 70),
                      bottomLeft: Radius.elliptical(70, 70),
                      // bottomRight: Radius.elliptical(100, 100)
                    ),
                    // gradient: const LinearGradient(
                    //   colors: [Color(0xFF0D22EC), Color(0xFF428EC1)],
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    // ),
                    border: Border.all(width: 1.0, color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ],
                  ),
                  height: 75,
                  child: const Center(
                    child: Text(
                      "custom properties",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
