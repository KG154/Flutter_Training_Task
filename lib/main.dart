import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taskproject/week_5.dart';
import 'package:taskproject/week_6.dart';
import 'package:taskproject/week_7.dart';

import 'WEEK_1/Navigator.dart';
import 'WEEK_1/NavigatorPage/Page3.dart';
import 'WEEK_1/NavigatorPage/page1.dart';
import 'WEEK_1/NavigatorPage/page2.dart';
import 'WEEK_2/Widgets/Alert Dialog.dart';
import 'WEEK_2/Widgets/1_mainScreen.dart';
import 'WEEK_2/drawer.dart';
import 'WEEK_3/SqfLite/View Page.dart';
import 'WEEK_3/SqfLite/sqflite.dart';
import 'WEEK_5/Google-Facebook/googlelogin.dart';
import 'Widget/commonWidget.dart';
import 'week_1.dart';
import 'week_2.dart';
import 'week_3.dart';
import 'week_4.dart';


List<CameraDescription> cameras = [];


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  cameras = await availableCameras();

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
      '/Week7': (context) => Week7(),
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
                child:
                    commonContainer(height: 100, title: "WEEK 1", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/week2');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 2", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week3');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 3", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week4');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 4", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week5');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 5", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week6');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 6", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Week7');
                },
                child:
                    commonContainer(height: 100, title: "WEEK 7", textSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
