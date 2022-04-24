import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class datetime extends StatefulWidget {
  const datetime({Key? key}) : super(key: key);

  @override
  State<datetime> createState() => _datetimeState();
}

class _datetimeState extends State<datetime> {
  DateTime selectdate = DateTime.now();
  TimeOfDay selecttime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date & Time Picker'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text('Date And Time',style: TextStyle(color: Colors.white),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectdate(context);
                  },
                  child: Text(
                      "${selectdate.day}/${selectdate.month}/${selectdate.year}",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    child: Text("${selecttime.hour} : ${selecttime.minute}",style: TextStyle(color: Colors.white),))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _selectdate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectdate,
        fieldHintText: "DATE/MONTH/YEAR",
        firstDate: DateTime(1800),
        lastDate: DateTime.now());
    if (selected != null && selected != selectdate)
      setState(() {
        selectdate = selected;
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selecttime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selecttime) {
      setState(() {
        selecttime = timeOfDay;
      });
    }
  }
}
