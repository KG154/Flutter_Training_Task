
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time1 extends StatefulWidget {
  const Time1({Key? key}) : super(key: key);

  @override
  State<Time1> createState() => _Time1State();
}

class _Time1State extends State<Time1> {
  TimeOfDay selecttime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker'),
        centerTitle: true,
        backgroundColor:  Colors.black45,
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
                   _selectTime(context);
                  },
                  child: Text('Select Time')),
            ),
            Text("${selecttime.hour} : ${selecttime.minute}",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selecttime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selecttime)
    {
      setState(() {
        selecttime = timeOfDay;
      });
    }
  }
}
