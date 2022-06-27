// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var fromValue;
//   List from = [
//     'Location 1',
//     'Location 2',
//     'Location 3',
//     'Location 4',
//   ];
//   var toValue;
//   List to = [
//     'Location 1',
//     'Location 2',
//     'Location 3',
//     'Location 4',
//   ];
//   var planeValue;
//   List plane = [
//     'Plane 1',
//     'Plane 2',
//     'Plane 3',
//   ];
//
//   var fromDest = 0;
//   var toDest = 0;
//   var planeDest = 0;
//   var finalDest = 0;
//   int sPlan = 0;
//   String? doneDate;
//   String? enddate;
//
//   DateTime selectDate = DateTime.now();
//   DateTime end = DateTime.now();
//   DateTime now = DateTime.now();
//
//   bool showDate = false;
//   bool _showDatePicker = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bookings"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "From : ",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton(
//                         alignment: Alignment.centerRight,
//                         isDense: true,
//                         iconSize: 0.0,
//                         hint: Text(
//                           'Select Location',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         value: fromValue,
//                         items: from.map((e) {
//                           return DropdownMenuItem(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }).toList(),
//                         onChanged: (value1) {
//                           setState(() {
//                             fromValue = value1.toString();
//                             if (value1.toString() == "Location 1") {
//                               fromDest = 1;
//                             } else if (value1.toString() == "Location 2") {
//                               fromDest = 2;
//                             } else if (value1.toString() == "Location 3") {
//                               fromDest = 3;
//                             } else {
//                               fromDest = 4;
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "To : ",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton(
//                         alignment: Alignment.centerRight,
//                         isDense: true,
//                         iconSize: 0.0,
//                         hint: Text(
//                           'Select Location',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         value: toValue,
//                         items: to.map((e) {
//                           return DropdownMenuItem(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }).toList(),
//                         onChanged: (value2) {
//                           toValue = value2.toString();
//                           if (value2.toString() == "Location 1") {
//                             toDest = 1;
//                             finalDest = fromDest - toDest;
//                             if (finalDest == 0) {
//                               finalDest = 1;
//                             }
//                           } else if (value2.toString() == "Location 2") {
//                             toDest = 2;
//                             finalDest = fromDest - toDest;
//                             if (finalDest == 0) {
//                               finalDest = 1;
//                             }
//                           } else if (value2.toString() == "Location 3") {
//                             toDest = 3;
//                             finalDest = fromDest - toDest;
//                             if (finalDest == 0) {
//                               finalDest = 1;
//                             }
//                           } else {
//                             toDest = 4;
//                             finalDest = fromDest - toDest;
//                             if (finalDest == 0) {
//                               finalDest = 1;
//                             }
//                           }
//                           setState(() {});
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Plane : ",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton(
//                         alignment: Alignment.centerRight,
//                         isDense: true,
//                         iconSize: 0.0,
//                         hint: Text(
//                           'Select Plane',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         value: planeValue,
//                         items: plane.map((e) {
//                           return DropdownMenuItem(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }).toList(),
//                         onChanged: (value3) {
//                           planeValue = value3.toString();
//                           if (value3.toString() == "Plane 1") {
//                             planeDest = (finalDest.abs()) * 1.abs();
//                             sPlan = 1;
//                           } else if (value3.toString() == "Plane 2") {
//                             planeDest = (finalDest.abs()) * 2.abs();
//                             sPlan = 2;
//                           } else {
//                             planeDest = (finalDest.abs()) * 3.abs();
//                             sPlan = 3;
//                           }
//                           setState(() {});
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size.fromHeight(35), // NEW
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     if (fromValue == null ||
//                         toValue == null ||
//                         planeValue == null) {
//                       Fluttertoast.showToast(
//                         msg: "Please select all Details",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.BOTTOM,
//                         backgroundColor: Colors.black45,
//                         textColor: Colors.white,
//                         fontSize: 13.0,
//                       );
//                     } else {
//                       showDate = true;
//                       if (finalDest == 0 || finalDest == 1) {
//                         planeDest = 1;
//                         sPlan = 1;
//                         end = DateTime.now();
//                       } else {
//                         end =
//                             DateTime.now().add(Duration(days: planeDest.abs()));
//                         print(finalDest.abs());
//                         print(planeDest.abs());
//                       }
//                     }
//                     enddate = DateFormat('dd-MMMM-yyyy').format(end);
//                     doneDate = DateFormat('dd-MMMM-yyyy').format(now);
//                   });
//                 },
//                 child: Text(
//                   "Check Bookings",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//               showDate
//                   ? Padding(
//                       padding: EdgeInsets.only(top: 10.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Start Date : ",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 '$doneDate',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "End Date : ",
//                                 style: TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 '$enddate',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: Size.fromHeight(35), // NEW
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 if (finalDest == 1) {
//                                   end = DateTime.now();
//                                 } else {
//                                   _showDatePicker = true;
//                                 }
//                               });
//                             },
//                             child: Text(
//                               "Book Date",
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : Container(),
//               _showDatePicker
//                   ? CalendarDatePicker(
//                       initialDate: selectDate,
//                       firstDate: now,
//                       lastDate: DateTime.now().add(
//                           Duration(days: planeDest.abs() - finalDest.abs())),
//                       onDateChanged: (newDate) {
//                         setState(() {
//                           selectDate = newDate;
//                         });
//                       })
//                   : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? fromValue;
  String? toValue;
  String? planValue;
  int fromDest = 0;
  int toDest = 0;
  int finalDest = 0;
  int planDest = 0;
  DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime end = DateTime.now();
  String? doneDate;
  String? endDate;
  String? select;
  bool show = false;
  bool _showDatePicker = false;
  int sPlan = 0;

  Future<void> _selectDate(BuildContext context) async {
    if (finalDest == 1) {
      end = DateTime.now();
    } else {
      end =
          DateTime.now().add(Duration(days: planDest.abs() - finalDest.abs()));
    }
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: now,
      lastDate: end,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        select = DateFormat('dd-MMMM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        isDense: true,
                        iconSize: 0.0,
                        hint: Text(
                          'Select Location',
                          style: TextStyle(color: Colors.black),
                        ),
                        value: fromValue,
                        items: <String>[
                          "Location 1",
                          "Location 2",
                          "Location 3",
                          "Location 4",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            fromValue = value!;
                            if (value == "Location 1") {
                              fromDest = 1;
                            } else if (value == "Location 2") {
                              fromDest = 2;
                            } else if (value == "Location 3") {
                              fromDest = 3;
                            } else {
                              fromDest = 4;
                            }
                          });
                        },
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
                    "To : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        isDense: true,
                        iconSize: 0.0,
                        hint: Text(
                          'Select Location',
                          style: TextStyle(color: Colors.black),
                        ),
                        value: toValue,
                        // elevation: 15,
                        items: <String>[
                          "Location 1",
                          "Location 2",
                          "Location 3",
                          "Location 4",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                        onChanged: (String? value) {
                          setState(() {
                            toValue = value!;
                            if (value == "Location 1") {
                              toDest = 1;
                              finalDest = fromDest - toDest;

                              if (finalDest == 0) {
                                finalDest = 1;
                              }
                            } else if (value == "Location 2") {
                              toDest = 2;
                              finalDest = fromDest - toDest;
                              if (finalDest == 0) {
                                finalDest = 1;
                              }
                            } else if (value == "Location 3") {
                              toDest = 3;
                              finalDest = fromDest - toDest;
                              if (finalDest == 0) {
                                finalDest = 1;
                              }
                            } else {
                              toDest = 4;
                              finalDest = fromDest - toDest;
                              if (finalDest == 0) {
                                finalDest = 1;
                              }
                            }

                            print(finalDest.abs());
                          });
                        },
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
                    "Plane : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        isDense: true,
                        iconSize: 0.0,
                        hint: Text(
                          'Select Plan',
                          style: TextStyle(color: Colors.black),
                        ),
                        value: planValue,
                        items: <String>[
                          "Plan 1",
                          "Plan 2",
                          "Plan 3",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            planValue = value!;
                            if (value == "Plan 1") {
                              planDest = (finalDest.abs()) * 1.abs();
                              sPlan = 1;
                            } else if (value == "Plan 2") {
                              planDest = (finalDest.abs()) * 2.abs();
                              sPlan = 2;
                            } else {
                              print("------${(finalDest.abs())}");
                              planDest = (finalDest.abs()) * 3.abs();
                              sPlan = 3;
                            }
                            print(planDest.abs());
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(35), // NEW
                ),
                onPressed: () {
                  setState(() {
                    if (fromValue == null ||
                        toValue == null ||
                        planValue == null) {
                      Fluttertoast.showToast(
                        msg: "Please select all Details",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black45,
                        textColor: Colors.white,
                        fontSize: 13.0,
                      );
                    } else {
                      show = true;

                      end = DateTime.now().add(Duration(days: planDest.abs()));
                    }
                    endDate = DateFormat('dd-MMMM-yyyy').format(end);
                    doneDate = DateFormat('dd-MMMM-yyyy').format(now);
                  });
                },
                child: Text(
                  "Check Bookings",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              show
                  ? Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Start Date : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text("$doneDate")
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("End Date : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text("$endDate")
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(35), // NEW
                ),
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  "Book Date",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              select == null ? Container() : Text("${select}".split(' ')[0])
            ],
          ),
        ),
      ),
    );
  }
}
