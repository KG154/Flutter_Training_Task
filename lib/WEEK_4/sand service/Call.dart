import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  TextEditingController tcall = TextEditingController();
  bool callstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call demo'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 100, left: 20, right: 20, bottom: 50),
                  child: TextField(
                    controller: tcall,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        callstatus = false;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter mobile no.',
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: callstatus ? 'Call Is required' : null,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      String mobile = tcall.text;
                      if (mobile.isEmpty || mobile.length < 10) {
                        callstatus = true;
                      } else {
                        _makingPhoneCall(mobile);
                      }
                    });
                    // launch('tel:+91$mobile');
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
                      "Make Call",
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
          ],
        ),
      ),
    );
  }

  Future<void> _makingPhoneCall(String mobile) async {
    var url = 'tel:+91${mobile}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
