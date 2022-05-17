import 'package:flutter/material.dart';
import 'package:taskproject/Widget/commonWidget.dart';
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
                  child: commonTextField(
                    controller: tmobile,
                    keyboardType: TextInputType.number,
                    onchange: (value) {
                      setState(() {
                        mobilestatus = false;
                      });
                    },
                    labelText: 'Enter mobile no.',
                    errorText: mobilestatus ? 'Call Is required' : null,
                    prefixIcon: Icons.phone,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 50),
                  child: commonTextField(
                    controller: tsms,
                    maxLines: 5,
                    onchange: (value) {
                      setState(() {
                        smsstatus = false;
                      });
                    },
                    labelText: 'Enter Message',
                    errorText: smsstatus ? 'text Is required' : null,
                    prefixIcon: Icons.message,
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
                  child: commonButton(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 120,
                    height: 50,
                    title: "Sand SMS",
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
