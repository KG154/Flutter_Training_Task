import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:camera/camera.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taskproject/WEEK_9&10/Page%20Link.dart';
import 'package:taskproject/week_11.dart';
import 'package:taskproject/week_12.dart';
import 'package:taskproject/week_5.dart';
import 'package:taskproject/week_6.dart';
import 'package:taskproject/week_7.dart';
import 'package:taskproject/week_8.dart';
import 'package:taskproject/week_9.dart';
import 'Ticket Booking.dart';
import 'Timer Task.dart';
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
  print("mesagw = = ${message.data}");

  // flutterLocalNotificationsPlugin.show(
  //     message.data.hashCode,
  //     message.data['title'],
  //     message.data['body'],
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         channel.id,
  //         channel.name,
  //       ),
  //     ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseForegroundMessage(RemoteMessage message) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          //with image from URL
          id: 1,
          channelKey: 'basic_channel',
          //channel configuration key
          title: message.notification!.title,
          body: message.notification!.body,
          bigPicture: message.notification!.android!.imageUrl != null
              ? message.notification!.android!.imageUrl.toString()
              : null,
          notificationLayout: message.notification!.android!.imageUrl != null
              ? NotificationLayout.BigPicture
              : null,
          payload: {"name": "flutter"}));
  print(message.notification!.body);
  print(message.notification!.android!.imageUrl.toString());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  cameras = await availableCameras();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  FirebaseCrashlytics.instance.setUserIdentifier("12345");

  /// payment gateways
  // Stripe.publishableKey =
  //     "pk_test_51Kxk6qSCa4VaXPSqbWdqnGukVeJknMcampX2gG2HNYktsuJQWswbcCMgZ6x4sCiKdWzrQb1PNikUk8hJlQILJciV00TUsT9hrw";
  // Stripe.instance.applySettings();
  FirebaseMessaging.onMessage.listen(firebaseForegroundMessage);
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            // defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
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
        // '/Page_Link': (context) => Page_Link(),
      },
    ),
  );
}

// void main() async {
//   runZonedGuarded<Future<void>>(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//     // The following lines are the same as previously explained in "Handling uncaught errors"
//
//     await MobileAds.instance.initialize();
//     cameras = await availableCameras();
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
//     FirebaseCrashlytics.instance.setUserIdentifier("12345");
//
//     /// payment gateways
//     // Stripe.publishableKey =
//     //     "pk_test_51Kxk6qSCa4VaXPSqbWdqnGukVeJknMcampX2gG2HNYktsuJQWswbcCMgZ6x4sCiKdWzrQb1PNikUk8hJlQILJciV00TUsT9hrw";
//     // Stripe.instance.applySettings();
//     FirebaseMessaging.onMessage.listen(firebaseForegroundMessage);
//     AwesomeNotifications().initialize(
//         // set the icon to null if you want to use the default app icon
//         null,
//         [
//           NotificationChannel(
//               channelGroupKey: 'basic_channel_group',
//               channelKey: 'basic_channel',
//               channelName: 'Basic notifications',
//               channelDescription: 'Notification channel for basic tests',
//               // defaultColor: Color(0xFF9D50DD),
//               ledColor: Colors.white)
//         ],
//         // Channel groups are only visual and are not required
//         channelGroups: [
//           NotificationChannelGroup(
//               channelGroupkey: 'basic_channel_group',
//               channelGroupName: 'Basic group')
//         ],
//         debug: true);
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//     runApp(
//       GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MyApp(),
//         navigatorObservers: [
//           FirebaseAnalyticsObserver(analytics: analytics),
//         ],
//         initialRoute: '/',
//         routes: {
//           '/week1': (context) => Week1(),
//           '/week2': (context) => Week2(),
//           '/Week3': (context) => Week3(),
//           '/Social_Media_Login': (context) => googlelogine1(),
//           '/ViewPage': (context) => ViewPage(),
//           '/SqfLite': (context) => SqfLite(),
//           '/widget': (context) => MainScreen(),
//           '/Alert': (context) => alert1(),
//           '/Drawer': (context) => Drawerr(),
//           '/pag1': (context) => Seven(),
//           '/pag2': (context) => Page1(),
//           '/pag3': (context) => Page2(),
//           '/pag4': (context) => Page3(),
//         },
//       ),
//     );
//   }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    FirebaseAnalytics.instance.setUserId(id: token);
    // DyanmicLink.retrieveDynamicLink(context);

    //
    // var initialzationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettings =
    //     InitializationSettings(android: initialzationSettingsAndroid);
    //
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: android.smallIcon,
    //             // largeIcon: DrawableResourceAndroidBitmap("ic_launcher"),
    //           ),
    //         ));
    //   }
    // });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });

    getToken();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      this.retrieveDynamicLink(context);
    }
  }

  void retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Page_Link(),
        ));
        // Navigator.popUntil(context, ModalRoute.withName('Page_Link'));
      }

         FirebaseDynamicLinks.instance.onLink
          .listen((PendingDynamicLinkData dynamicLink) async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Page_Link()));
        // Navigator.popUntil(context, ModalRoute.withName('Page_Link'));
      });
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  String? token;

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    print("Token : - ${token}");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;

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
                child: commonContainer(
                    width: 500, height: 100, title: "WEEK 2", textSize: 25),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Week4();
                      },
                      settings: RouteSettings(name: 'week4'),
                    ),
                  );
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
                child: commonContainer(
                    height: 100, title: "WEEK 9 & 10", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week11();
                    },
                  ));
                },
                child: commonContainer(
                    height: 100, title: "WEEK 11", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Week12();
                    },
                  ));
                },
                child: commonContainer(
                    height: 100, title: "WEEK 12", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Time_Task();
                    },
                  ));
                },
                child: commonContainer(
                    height: 100, title: "Time Task", textSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ));
                },
                child: commonContainer(
                    height: 100, title: "Ticket Booking", textSize: 25),
              ),
              Text(
                'devicePixelRatio: $devicePixelRatio',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
