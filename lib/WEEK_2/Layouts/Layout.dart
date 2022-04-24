import 'package:flutter/material.dart';


import 'DonatePage.dart';
import 'Go Out Page.dart';
import 'NatritionPage.dart';
import 'Pro Page.dart';
import 'orderpage.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int CurrentIndex = 0;

  List page = [
    orderpage(),
    GooutPage(),
    ProPage(),
    NatritionPage(),
    DonatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            page.elementAt(CurrentIndex),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.black54,
          // unselectedLabelStyle: TextStyle(color: Colors.black54),
          // selectedLabelStyle: TextStyle(color: Colors.black87),
          currentIndex: CurrentIndex,
          onTap: (value) {
            setState(() {
              CurrentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Order',
              // backgroundColor: Colors.white70,
              icon: Icon(
                Icons.shopping_bag_outlined,
                // color: Colors.black,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Go Out',
              icon: Icon(Icons.directions_walk_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Pro',
              icon: Icon(Icons.whatshot),
            ),
            BottomNavigationBarItem(
              label: 'Nutrition',
              icon: Icon(Icons.broken_image),
            ),
            BottomNavigationBarItem(
              label: 'Donate',
              icon: Icon(Icons.clean_hands_sharp),
            ),
          ],
        ));
  }
}
