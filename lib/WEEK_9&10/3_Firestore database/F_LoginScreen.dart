import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskproject/Widget/commonWidget.dart';

import 'F_ViewScreen.dart';

class F_LoginScreen extends StatefulWidget {
  const F_LoginScreen({Key? key}) : super(key: key);

  @override
  State<F_LoginScreen> createState() => _F_LoginScreenState();
}

class _F_LoginScreenState extends State<F_LoginScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  CollectionReference student =
      FirebaseFirestore.instance.collection("student");

  ///
  TextEditingController tTitle = TextEditingController();
  TextEditingController tenddate = TextEditingController();
  TextEditingController tstatus = TextEditingController();
  TextEditingController tdescription = TextEditingController();

  bool titleStatus = false;
  bool descriptionStatus = false;
  bool endDateStatus = false;
  bool statusStatus = false;
  String emailError = "";
  bool loding = false;

  DateTime selectdate = DateTime.now();
  String createDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    tenddate.text = '';
    tstatus.text = '';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "FireStore Database",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body: loding
            ? Center(
                child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent.shade700),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                        child: commonTextField(
                          controller: tTitle,
                          onchange: (value) {
                            setState(() {
                              titleStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Task Title',
                          errorText:
                              titleStatus ? 'Task Title Is required' : null,
                          prefixIcon: Icons.title,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                        child: commonTextField(
                          controller: tdescription,
                          keyboardType: TextInputType.text,
                          onchange: (value) {
                            setState(() {
                              descriptionStatus = false;
                            });
                          },
                          color: Colors.black54,
                          labelText: 'Task Description',
                          errorText: descriptionStatus
                              ? 'Description Is required'
                              : null,
                          prefixIcon: Icons.description,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                        child: TextField(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            );
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                tenddate.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          controller: tenddate,
                          onChanged: (value) {
                            setState(() {
                              endDateStatus = false;
                            });
                          },
                          readOnly: true,
                          style: TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Enter End_Date',
                            labelStyle: TextStyle(color: Colors.black54),
                            hintStyle: TextStyle(color: Colors.black54),
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.black54,
                              size: 30,
                            ),
                            errorText:
                                endDateStatus ? 'End_Date Is required' : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10,bottom: 10),
                        child: TextField(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: double.infinity,
                                    child: Wrap(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            setState(() {
                                              tstatus.text = 'Done';
                                              Navigator.pop(context);
                                            });
                                          },
                                          title: Center(child: Text("Done")),
                                        ),
                                        Divider(
                                          height: 2,
                                        ),
                                        ListTile(
                                          onTap: () {
                                            setState(() {
                                              tstatus.text = 'Pending';
                                              Navigator.pop(context);
                                            });
                                          },
                                          title: Center(child: Text("Pending")),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          controller: tstatus,
                          onChanged: (value) {
                            setState(() {
                              statusStatus = false;
                            });
                          },
                          readOnly: true,
                          style: TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Status',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            hintStyle: TextStyle(color: Colors.black54),
                            errorText:
                                statusStatus ? 'Status Is required' : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.30,
                            vertical:
                                MediaQuery.of(context).size.height * 0.030),
                        child: InkWell(
                          onTap: () async {
                            if (tTitle.text.isEmpty) {
                              titleStatus = true;
                            }
                            if (tdescription.text.isEmpty) {
                              descriptionStatus = true;
                            }
                            if (tenddate.text.isEmpty) {
                              endDateStatus = true;
                            }
                            if (tstatus.text.isEmpty) {
                              statusStatus = true;
                            } else {
                              setState(() {
                                loding = true;
                              });
                              adddata();
                              setState(() {
                                loding = false;
                              });
                            }

                            tTitle.clear();
                            tdescription.clear();
                            tenddate.clear();
                            tstatus.clear();
                            updateui();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurpleAccent.shade700,
                                  Colors.deepPurple.shade400,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Add Data",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.30,
                            right: MediaQuery.of(context).size.width * 0.30,
                            bottom: MediaQuery.of(context).size.height * 0.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return F_ViewScreen();
                              },
                            ));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.deepPurpleAccent.shade700,
                                  Colors.deepPurple.shade400,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "View Data",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> adddata() async {
    return await student
        .add({
          'title': tTitle.text,
          'Description': tdescription.text,
          'Create_Date': createDate,
          'End_Date': tenddate.text,
          'status': tstatus.text,
        })
        .then((value) => print("Add User"))
        .catchError((onError) => print("Failed to Add User"));
  }
}
