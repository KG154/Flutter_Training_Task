import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskproject/Widget/commonWidget.dart';

class F_UpdateScreen extends StatefulWidget {
  String Title;
  String Description;

  // String Create_Date;
  String End_Date;
  String status;
  String UId;

  F_UpdateScreen({
    Key? key,
    required this.Title,
    required this.Description,
    // required this.Create_Date,
    required this.End_Date,
    required this.status,
    required this.UId,
  }) : super(key: key);

  @override
  State<F_UpdateScreen> createState() => _F_UpdateScreenState();
}

class _F_UpdateScreenState extends State<F_UpdateScreen> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  CollectionReference student =
      FirebaseFirestore.instance.collection("student");

  ///
  TextEditingController tTitle = TextEditingController();
  TextEditingController tdescription = TextEditingController();
  TextEditingController tenddate = TextEditingController();
  TextEditingController tstatus = TextEditingController();

  bool titleStatus = false;
  bool descriptionStatus = false;
  bool endDateStatus = false;
  bool statusStatus = false;
  String emailError = "";

  bool loding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tTitle.text = widget.Title;
    tdescription.text = widget.Description;
    tenddate.text = widget.End_Date;
    tstatus.text = widget.status;
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
            "Update Datab",
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
                          color: Colors.black,
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
                          color: Colors.black,
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Enter End_Date',
                            labelStyle: TextStyle(color: Colors.black),
                            hintStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Colors.black,
                              size: 30,
                            ),
                            errorText:
                                endDateStatus ? 'End_Date Is required' : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, left: 10, right: 10),
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
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Status',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintStyle: TextStyle(color: Colors.black),
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
                          onTap: () {
                            if (tTitle.text.isEmpty &&
                                tdescription.text.isEmpty &&
                                tenddate.text.isEmpty &&
                                tstatus.text.isEmpty) {
                              titleStatus = true;
                              descriptionStatus = true;
                              endDateStatus = true;
                              statusStatus = true;
                            } else {
                              if (tTitle.text.isEmpty) {
                                titleStatus = true;
                              } else if (tdescription.text.isEmpty) {
                                descriptionStatus = true;
                              } else if (tenddate.text.isEmpty) {
                                endDateStatus = true;
                              } else if (tstatus.text.isEmpty) {
                                statusStatus = true;
                              } else {
                                setState(() {
                                  loding = true;
                                });
                                updatedata();
                                setState(() {
                                  loding = false;
                                });
                                Navigator.pop(context);
                              }
                            }

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
                                "Update Data",
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

  Future<void> updatedata() async {
    return await student
        .doc(widget.UId)
        .update({
          'title': tTitle.text,
          'Description': tdescription.text,
          // 'Create_Date': createDate,
          'End_Date': tenddate.text,
          'status': tstatus.text,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
