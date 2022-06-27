import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time_Task extends StatefulWidget {
  const Time_Task({Key? key}) : super(key: key);

  @override
  State<Time_Task> createState() => _Time_TaskState();
}

class _Time_TaskState extends State<Time_Task> {
  TextEditingController tEntries = TextEditingController();
  TextEditingController tRange = TextEditingController();
  TextEditingController tto = TextEditingController();

  bool EntriesStatus = false;
  bool RangeStatus = false;
  bool ToStatus = false;

  String Entries = '';
  String? Range;
  String? To;
  int? ran;

  List<int> numbers = [];

  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Entries :",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: tEntries,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          EntriesStatus = false;
                        });
                      },
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Number of Rows',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Range  :",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: tRange,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        RangeStatus = false;
                      });
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Minimum',
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "to",
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: tto,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        ToStatus = false;
                      });
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Maximum',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                numbers.clear();
                setState(() {
                  Entries = tEntries.text;
                  Range = tRange.text;
                  To = tto.text;
                  for (int i = 0; i < int.parse(tEntries.text); i++) {
                    ran = int.parse(tRange.text) +
                        _random.nextInt(
                            int.parse(tto.text) - int.parse(tRange.text));
                    numbers.add(ran!);
                  }
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SecondPage(numList: numbers);
                      },
                    ),
                  );
                  print(ran);
                  print(numbers);
                });
              },
              child: Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  List<int> numList;

  SecondPage({required this.numList});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Timer? _timer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  void initState() {
    // T   ODO: implement initState
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        for (int i = 0; i < widget.numList.length; i++) {
          if (widget.numList[i] == 0) {
            print("complete");
          } else {
            widget.numList[i]--;
            print(widget.numList);
            setState(() {});
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.numList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: widget.numList[index] == 0 ? Colors.green : null,
                title: widget.numList[index] == 0
                    ? Text("Complete")
                    : Text("Time Left"),
                trailing: Text(widget.numList[index].toString()),
              ),
            );
          }),
    );
  }
}
