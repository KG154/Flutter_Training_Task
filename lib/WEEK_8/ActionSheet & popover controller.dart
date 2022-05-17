import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:popover/popover.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class ActionSheet_popover extends StatefulWidget {
  const ActionSheet_popover({Key? key}) : super(key: key);

  @override
  State<ActionSheet_popover> createState() => _ActionSheet_popoverState();
}

class _ActionSheet_popoverState extends State<ActionSheet_popover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ActionSheet_popover",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Button(),
          SizedBox(
            height: 200,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,


              children: [
                InkWell(
                  onTap: () {
                    showAdaptiveActionSheet(
                      context: context,
                      title: const Text('Android ActionSheet'),
                      actions: <BottomSheetAction>[
                        BottomSheetAction(
                          title: const Text('Item 1'),
                          onPressed: () {
                            showInToast("i1");
                          },
                        ),
                        BottomSheetAction(
                          title: const Text('Item 2'),
                          onPressed: () {
                            showInToast("i2");
                          },
                        ),
                        BottomSheetAction(
                          title: const Text('Item 3'),
                          onPressed: () {
                            showInToast("i3");
                          },
                        ),
                        BottomSheetAction(
                          title: const Text('Item 4'),
                          onPressed: () {
                            showInToast("i4");
                          },
                        ),
                        BottomSheetAction(
                          title: const Text('Item 5'),
                          onPressed: () {
                            showInToast("i5");
                          },
                        ),
                      ],
                      cancelAction: CancelAction(title: const Text('Cancel')),
                    );
                  },
                  child: commonButton(
                    title: "Android ActionSheet",
                    height: 50,
                    width: 200,
                  ),
                ),
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoActionSheet(
                            title: Text("Ios ActionSheet"),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  showInToast("List 1");
                                },
                                child: Text("List 1"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  showInToast("List 2");
                                },
                                child: Text("List 2"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  showInToast("List 3");
                                },
                                child: Text("List 3"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  showInToast("List 4");
                                },
                                child: Text("List 4"),
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              // isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"),
                            ),
                          );
                        });
                  },
                  child: commonButton(
                    title: "Ios ActionSheet",
                    height: 40,
                    width: 200,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                  ),
                ),
                Button(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showInToast(String value) {
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      // timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)]),
          boxShadow: [
            BoxShadow(
                color: Colors.black87.withOpacity(0.3),
                blurRadius: 1,
                offset: Offset(0, 1),
                spreadRadius: 1)
          ],
          border: Border.all(color: Colors.blue)),
      child: GestureDetector(
        child: const Center(
          child: Text(
            'Popover',
            textAlign: TextAlign.center,
            style:
                TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 20),
          ),
        ),
        onTap: () {
          showPopover(
            context: context,
            transitionDuration: const Duration(milliseconds: 150),
            bodyBuilder: (context) => const ListItems(),
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.bottom,
            width: 200,
            height: 300,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<SecondRoute>(
                      builder: (context) => SecondRoute(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: Colors.red[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[300],
              child: const Center(child: Text('Entry C')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[400],
              child: const Center(child: Text('Entry D')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[500],
              child: const Center(child: Text('Entry E')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.red[600],
              child: const Center(child: Text('Entry F')),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
