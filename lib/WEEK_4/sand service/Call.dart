import 'package:flutter/material.dart';
import 'package:taskproject/Widget/commonWidget.dart';
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
                  child: commonTextField(
                    controller: tcall,
                    keyboardType: TextInputType.number,
                    onchange: (value) {
                      setState(() {
                        callstatus = false;
                      });
                    },
                    labelText: 'Enter mobile no.',
                    errorText: callstatus ? 'Call Is required' : null,
                    prefixIcon: Icons.phone,
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
                  child: commonButton(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 120,
                    height: 50,
                    title: "Make Call",
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
