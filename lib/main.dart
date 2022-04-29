import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taskproject/week_5.dart';
import 'package:taskproject/week_6.dart';

import 'WEEK_1/Navigator.dart';
import 'WEEK_1/NavigatorPage/Page3.dart';
import 'WEEK_1/NavigatorPage/page1.dart';
import 'WEEK_1/NavigatorPage/page2.dart';
import 'WEEK_2/Widgets/Alert Dialog.dart';
import 'WEEK_2/Widgets/mainScreen.dart';
import 'WEEK_2/drawer.dart';
import 'WEEK_3/SqfLite/View Page.dart';
import 'WEEK_3/SqfLite/sqflite.dart';
import 'WEEK_5/google_facbook/Social Media Login.dart';
import 'WEEK_5/Google-Facebook/googlelogin.dart';
import 'week_1.dart';
import 'week_2.dart';
import 'week_3.dart';
import 'week_4.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    initialRoute: '/',
    routes: {
      '/week1': (context) => Week1(),
      '/week2': (context) => Week2(),
      '/Week3': (context) => Week3(),
      '/Week4': (context) => Week4(),
      '/Week5': (context) => Week5(),
      '/Week6': (context) => Week6(),
      '/Social_Media_Login': (context) => googlelogine1(),
      '/ViewPage': (context) => ViewPage(),
      '/SqfLite': (context) => SqfLite(),
      '/widget': (context) => MainScreen(),
      '/Alert': (context) => alert1(),
      '/Drawer': (context) => Drawerr(),
      '/pag1': (context) => Seven(),
      '/pag2': (context) => Page1(),
      '/pag3': (context) => Page2(),
      '/pag4': (context) => Page3(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Week",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/week1');
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
                    //   colors: [Color(0xFFD62828), Color(0xFFF77F00)],
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
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 1",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/week2');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                          spreadRadius: 1),
                    ],
                  ),
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 2",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week3');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 3",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week4');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 4",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week5');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 5",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week6');
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                  height: 100,
                  child: const Center(
                    child: Text(
                      "WEEK 6",
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
