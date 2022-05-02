import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'WEEK_2/Layouts/Layout.dart';
import 'WEEK_2/Slider.dart';
import 'WEEK_2/Tabbar.dart';
import 'WEEK_2/View Controller/First.dart';
import 'WEEK_2/Widgets/Custom TabBar.dart';
import 'WEEK_2/custom controls properties/properties.dart';
import 'WEEK_2/custom drawer.dart';
import 'Widget/commonWidget.dart';

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
                      return TAB_BAR();
                    },
                  ));
                },
                child: commonContainer(
                  title: "TAB BAR",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CustomTabbar();
                    },
                  ));
                },
                child: commonContainer(
                  title: "Custom Tab Bar",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Drawer');
                },
                child: commonContainer(
                  title: "Drawer",
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
                child: commonContainer(
                  title: "Custom Drawer",
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
                child: commonContainer(
                  title: "Slider",
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
                child: commonContainer(
                  title: "Pass Data",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/widget');

                },
                child: commonContainer(
                  title: "Widgets",
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
                child: commonContainer(
                  title: "Layouts/Controls",
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
                child: commonContainer(
                  title: "custom properties",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
