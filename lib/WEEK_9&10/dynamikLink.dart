import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dynamic_Link extends StatefulWidget {
  const dynamic_Link({Key? key}) : super(key: key);

  @override
  State<dynamic_Link> createState() => _dynamic_LinkState();
}

class _dynamic_LinkState extends State<dynamic_Link> {
  String Dynamicurl = "";

  final String DynamicLinkApp = 'https://taskpro.page.link/XktS';
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dynamic_Link",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  if (Dynamicurl.isNotEmpty)
                    Center(
                      child: Column(
                        children: [
                          Text(Dynamicurl),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: Dynamicurl));
                            },
                            icon: Icon(Icons.copy),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      buildDynamicLink(true);
                    },
                    child: Text(
                      "App Dynamic Link",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> buildDynamicLink(bool short) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse(DynamicLinkApp),
      uriPrefix: "https://taskpro.page.link",
      androidParameters: AndroidParameters(
        packageName: "com.example.taskproject.android",
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: "com.example.taskproject.ios",
        minimumVersion: '0',
      ),
    );
    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    setState(() {
      Dynamicurl = url.toString();
    });
  }
}
