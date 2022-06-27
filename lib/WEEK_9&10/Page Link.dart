import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskproject/main.dart';
import 'package:taskproject/week_3.dart';

class Page_Link extends StatefulWidget {
  const Page_Link({Key? key}) : super(key: key);

  @override
  State<Page_Link> createState() => _Page_LinkState();
}

class _Page_LinkState extends State<Page_Link> {
  String _shortUrl = '';
  final String DynamicLink = 'https://taskpro.page.link/XktS';
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this._initDynamicLinks();
    retrieveDynamicLink(context);
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen(
        (PendingDynamicLinkData dynamicLink) async {
      final Uri? deepLink = dynamicLink.link;

      if (deepLink != null) {
        Navigator.popUntil(context, ModalRoute.withName('/Week3'));
      }
    }, onError: (e) async {
      Navigator.pushNamed(context, '/week1');
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        // Navigator.popUntil(context, ModalRoute.withName('week3'));

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Week3(),
        ));
      }

      FirebaseDynamicLinks.instance.onLink
          .listen((PendingDynamicLinkData dynamicLink) async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Week3()));
        // Navigator.popUntil(context, ModalRoute.withName('week3'));
      });
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
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
