 import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class Firebase_Crashlytics extends StatefulWidget {
  const Firebase_Crashlytics({Key? key}) : super(key: key);

  @override
  State<Firebase_Crashlytics> createState() => _Firebase_CrashlyticsState();
}

class _Firebase_CrashlyticsState extends State<Firebase_Crashlytics> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseCrashlytics.instance.setCustomKey('userUID', 'kishan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firebase Crashlytics",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseCrashlytics.instance.log('This is a log example');
            FirebaseCrashlytics.instance.recordError(
              "error",
              null,
              reason: 'a fatal error',
              fatal: true,
            );
            FirebaseCrashlytics.instance.crash();
          },
          child: Text("Crash"),
        ),
      ),
    );
  }
}
