import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Local_NotificationScreen extends StatefulWidget {
  const Local_NotificationScreen({Key? key}) : super(key: key);

  @override
  State<Local_NotificationScreen> createState() =>
      _Local_NotificationScreenState();
}

class _Local_NotificationScreenState extends State<Local_NotificationScreen> {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialisation();
  }

  Future<void> initialisation() async {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin!
        .initialize(initSettings, onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      print(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Local Notification",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  showNotification();
                },
                child: Text("Local Notification"),
              ),
              ElevatedButton(
                onPressed: () {
                  showNotificationWithSound();
                },
                child: Text("Local Notification With Sound"),
              ),
              ElevatedButton(
                onPressed: () {
                  showNotificationWithProgress();
                },
                child: Text("Progress Notification"),
              ),
              ElevatedButton(
                onPressed: () {
                  scheduleNotification();
                },
                child: Text("Schedule Notification"),
              ),
              ElevatedButton(
                onPressed: () {
                  showNotificationWithImage();
                },
                child: Text("BigPicture Notification"),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     repeatNotification();
              //   },
              //   child: Text("repeated Notification"),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// show Notification
  Future<void> showNotification() async {
    var android = new AndroidNotificationDetails(
      'id',
      'channel',
      styleInformation: BigTextStyleInformation(''),
      playSound: false,
      priority: Priority.high,
      showWhen: false,
      importance: Importance.max,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin!.show(
        0, 'New Tutorial', 'Local Notification', platform,
        payload: 'Welcome to the Local Notification demo');
  }

  /// show Notification With Sound
  Future<void> showNotificationWithSound() async {
    var android = AndroidNotificationDetails(
      'id',
      'channel',
      styleInformation: BigTextStyleInformation(''),
      playSound: true,
      priority: Priority.high,
      showWhen: false,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin!.show(
        0, 'New Tutorial', 'Local Notification With Sound', platform,
        payload: 'Welcome to the Local Notification demo');
  }

  /// show Notification With Image
  Future<void> showNotificationWithImage() async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("img"),
        largeIcon: DrawableResourceAndroidBitmap("img"),
        contentTitle: 'Image Notification',
        htmlFormatContentTitle: true,
        summaryText: 'big image notifications',
        htmlFormatSummaryText: true);

    var android = AndroidNotificationDetails(
      'id',
      'channel',
      styleInformation: bigPictureStyleInformation,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin!.show(
        0, 'Image', 'Local Notification With Image', platform,
        payload: 'big image notifications');
  }

  /// show Notification With Progress
  Future<void> showNotificationWithProgress() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'indeterminate progress channel',
      'indeterminate progress channel',
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      showProgress: true,
      indeterminate: true,
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!.show(
        0,
        'indeterminate progress notification title',
        'indeterminate progress notification body',
        platformChannelSpecifics,
        payload: 'item x');
  }

  /// schedule Notification
  Future<void> scheduleNotification() async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'id',
      'name',
      largeIcon: DrawableResourceAndroidBitmap('img'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin!.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  /// repeat Notification
  Future<void> repeatNotification() async {
    var androidChannelSpecifics = AndroidNotificationDetails(
      'id',
      'name',
      importance: Importance.min,
      priority: Priority.high,
      styleInformation: DefaultStyleInformation(true, true),
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidChannelSpecifics, iOS: iosChannelSpecifics);
    await flutterLocalNotificationsPlugin!.periodicallyShow(
      0,
      'Repeating Test Title',
      'Repeating Test Body',
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
      payload: 'Test Payload',
    );
  }
}
