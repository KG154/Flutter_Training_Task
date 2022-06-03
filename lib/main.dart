import 'package:camera/camera.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taskproject/week_5.dart';
import 'package:taskproject/week_6.dart';
import 'package:taskproject/week_7.dart';
import 'package:taskproject/week_8.dart';
import 'package:taskproject/week_9.dart';

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

List<CameraDescription>? cameras;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
        ),
      ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  cameras = await availableCameras();

  /// payment gateways
  // Stripe.publishableKey =
  //     "pk_test_51Kxk6qSCa4VaXPSqbWdqnGukVeJknMcampX2gG2HNYktsuJQWswbcCMgZ6x4sCiKdWzrQb1PNikUk8hJlQILJciV00TUsT9hrw";
  // Stripe.instance.applySettings();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: '/',
      routes: {
        '/week1': (context) => Week1(),
        '/week2': (context) => Week2(),
        '/Week3': (context) => Week3(),
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
    ),
  );
}

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();

    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android.smallIcon,
                // largeIcon: DrawableResourceAndroidBitmap("img"),
              ),
            ));
      }
    });
    getToken();
  }

  String? token;

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    print(token);
  }

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
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week4();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 4", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week5();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 5", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week6();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 6", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week7();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 7", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week8();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 8", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week9();
                    },
                  ));
                },
                child:
                    commonContainer(height: 100, title: "WEEK 9", textSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
