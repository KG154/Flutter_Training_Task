import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class alert1 extends StatefulWidget {
  const alert1({Key? key}) : super(key: key);

  @override
  State<alert1> createState() => _alert1State();
}

class _alert1State extends State<alert1> {
  List ll = [
    'one',
    'Two',
    'Three',
    'Foure',
    'Five',
    'one',
    'Two',
    'Three',
    'Foure',
    'Five',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog Demo'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              elevation: 20,
                              title: Text(
                                'Log Out?',
                                style: TextStyle(color: Colors.red),
                              ),
                              content: SingleChildScrollView(
                                child: SizedBox(
                                  height: 150,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: ll.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 50,
                                        child: ListTile(
                                          title: Text(
                                            ll[index],
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.black87),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              alignment: Alignment.center,
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.popUntil(context,
                                          ModalRoute.withName('/widget'));
                                    },
                                    child: Text('OK')),
                              ],
                            );
                          });
                    });
                  },
                  child: Text('Alert Box With List View')),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Log Out?',
                                style: TextStyle(color: Colors.red),
                              ),
                              content: const Text(
                                'Are you sure you want to log out?',
                                style: TextStyle(color: Colors.red, fontSize: 20),
                              ),
                              alignment: Alignment.center,
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.popUntil(
                                          context, ModalRoute.withName('/widget'));
                                    },
                                    child: Text('OK')),
                              ],
                            );
                          });
                    });
                  },
                  child: Text('Alert Box')),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Log Out?"),
                            content: Text("Are you sure you want to log out?"),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                isDefaultAction: true,
                                child: Text('Cancel'),
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/widget'));
                                },
                                child: Text('Exit'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  child: Text('IOS Alert Box')),
            ),
          ],
        ),
      ),
    );
  }
}
