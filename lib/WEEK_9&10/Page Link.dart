import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String _shortUrl = '';
final String DynamicLink = 'https://taskpro.page.link/XktS';
FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

class Page_Link extends StatefulWidget {
  const Page_Link({Key? key}) : super(key: key);

  @override
  State<Page_Link> createState() => _Page_LinkState();
}

class _Page_LinkState extends State<Page_Link> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this._initDynamicLinks();
  }

  Future<void> _createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://taskpro.page.link',
      link: Uri.parse(DynamicLink),
      androidParameters: AndroidParameters(
        packageName: 'com.example.taskproject.android',
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.taskproject.ios',
        minimumVersion: '1',
        appStoreId: '123',
      ),
    );

    final ShortDynamicLink shortDynamicLink =
        await dynamicLinks.buildShortLink(parameters);
    final Uri shortUrl = shortDynamicLink.shortUrl;

    setState(() {
      _shortUrl = shortUrl.toString();
    });
  }

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
                  ElevatedButton(
                    onPressed: () {
                      _createDynamicLink();
                      // setState(() {});
                    },
                    child: Text(
                      "Page Link",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (_shortUrl.isNotEmpty)
                    Center(
                      child: Column(
                        children: [
                          Text(_shortUrl),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: _shortUrl));
                            },
                            icon: Icon(Icons.copy),
                          ),
                        ],
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
}
