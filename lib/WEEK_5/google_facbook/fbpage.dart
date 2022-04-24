import 'package:flutter/material.dart';

import 'googledashScreen.dart';

class fbpage extends StatefulWidget {
  Map userdata;

  fbpage(this.userdata);

  // const fbpage({Key? key}) : super(key: key);

  @override
  State<fbpage> createState() => _fbpageState();
}

class _fbpageState extends State<fbpage> {
  var name = '';
  var email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.userdata['name'];
    email = widget.userdata['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            // Text(email),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().fblogout(context);
                },
                child: Text("log out"))
          ],
        ),
      ),
    );
  }
}
