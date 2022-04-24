import 'package:flutter/material.dart';
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
                      context, MaterialPageRoute(builder: (context) => Call()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: 120,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black54,
                            Color.fromRGBO(0, 41, 102, 1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.3),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: Colors.blue)),
                  child: Text(
                    "Call",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SendSMS()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),

                  width: 120,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black54,
                            Color.fromRGBO(0, 41, 102, 1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.3),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: Colors.blue)),
                  child: Text(
                    "SMS",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Email()));
                },
                child: Container(
                  width: 120,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black54,
                            Color.fromRGBO(0, 41, 102, 1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.3),
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: Colors.blue)),
                  child: Text(
                    "EMAIL",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      color: const Color(0xFFFFFFFF),
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
