import 'package:flutter/material.dart';
import 'package:taskproject/Widget/commonWidget.dart';
import 'Call.dart';
import 'Email.dart';
import 'SMS.dart';

class Sand_Service extends StatefulWidget {
  const Sand_Service({Key? key}) : super(key: key);

  @override
  State<Sand_Service> createState() => _Sand_ServiceState();
}

class _Sand_ServiceState extends State<Sand_Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sand email/sms/coll demo'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Call(),
                    ),
                  );
                },
                child: commonButton(
                  width: 120,
                  height: 50,
                  title: "Call",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendSMS(),
                    ),
                  );
                },
                child: commonButton(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 120,
                  height: 50,
                  title: "SMS",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Email(),
                    ),
                  );
                },
                child: commonButton(
                  // margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: 120,
                  height: 50,
                  title: "EMAIL",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
