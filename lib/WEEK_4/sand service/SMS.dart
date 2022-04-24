import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SendSMS extends StatefulWidget {
  const SendSMS({Key? key}) : super(key: key);

  @override
  State<SendSMS> createState() => _SendSMSState();
}

class _SendSMSState extends State<SendSMS> {
  TextEditingController tmobile = TextEditingController();
  bool mobilestatus = false;
  TextEditingController tsms = TextEditingController();
  bool smsstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS demo'),
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
                      top: 100, left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: tmobile,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        mobilestatus = false;
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
                      errorText: mobilestatus ? 'Call Is required' : null,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 50),
                  child: TextField(
                    controller: tsms,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {
                        smsstatus = false;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Enter Message',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 75),
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      errorText: smsstatus ? 'text Is required' : null,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      String mobile = tmobile.text;
                      String sms = tsms.text;
                      if (mobile.isEmpty || mobile.length < 10) {
                        mobilestatus = true;
                      } else if (sms.isEmpty) {
                        smsstatus = true;
                      } else {
                        _sendingsms(mobile, sms);
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
                      "Sand SMS",
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

  Future<void> _sendingsms(String mobile, String sms) async {
    var url = 'sms:+91${mobile}?body=$sms';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
