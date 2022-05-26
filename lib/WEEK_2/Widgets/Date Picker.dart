import 'package:flutter/material.dart';

class Datepicker1 extends StatefulWidget {
  const Datepicker1({Key? key}) : super(key: key);

  @override
  State<Datepicker1> createState() => _Datepicker1State();
}

class _Datepicker1State extends State<Datepicker1> {
  DateTime selectdate = DateTime.now();

  DateTimeRange _dateTimeRange =
      DateTimeRange(start: DateTime(2022), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    final start = _dateTimeRange.start;
    final end = _dateTimeRange.end;

    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker'),
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
                  _selectdate(context);
                },
                child: Text('Select Date'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                '${selectdate.day}/${selectdate.month}/${selectdate.year}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Center(
            //   child: Column(
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {
            //           _daterang(context);
            //         },
            //         child: Text('Select Start Date - End Date'),
            //       ),
            //       Text(
            //           '${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}'),
            //     ],
            //   ),
            // ),
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

  _daterang(BuildContext context) async {
    final DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      initialDateRange: _dateTimeRange,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.input,
    );
    setState(() {
      _dateTimeRange = dateRange ?? _dateTimeRange;
    });
    // if (dateRange != null) {
    //   setState(() {
    //     _dateTimeRange = dateRange;
    //   });
    // }
  }
}
