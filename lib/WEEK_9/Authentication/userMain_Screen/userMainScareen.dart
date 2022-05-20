import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_9/Authentication/userMain_Screen/ProfilePage.dart';
import 'package:taskproject/WEEK_9/Authentication/userMain_Screen/change%20password.dart';

import 'home page.dart';

class userMainScareen extends StatefulWidget {
  const userMainScareen({Key? key}) : super(key: key);

  @override
  State<userMainScareen> createState() => _userMainScareenState();
}

class _userMainScareenState extends State<userMainScareen> {
  int CurrentIndex = 0;

  List page = [
    UserHomeScreen(),
    Profile_Screen(),
    Change_Password_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black54,
        currentIndex: CurrentIndex,
        onTap: (value) {
          setState(() {
            CurrentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Change Password',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: PageView(
        children: [
          page.elementAt(CurrentIndex),
        ],
      ),
    );
  }
}
