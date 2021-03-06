import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import 'Databasehelper.dart';
import 'UpdatePage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  updateui() {
    if (mounted) {
      setState(() {});
    }
  }

  Database? _database;
  DatabaseHandler _databaseHandler = DatabaseHandler();
  List<Map> _list = [];

  Future<List<Map>> getalldata() async {
    await _databaseHandler.CreateDataBase().then((value) async {
      _database = value;
      await _databaseHandler.viewdata(_database!).then((value1) {
        _list = value1;
        print('list =  $_list');
      });
    });
    print("listall = {$_list}");
    return _list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Data",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)],
          ),
        ),
        child: FutureBuilder(
          future: getalldata(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: ListTile(
                      leading: _list[index]['tname'] != null
                          ? Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(
                                    base64Decode(_list[index]['image']),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Text(
                                _list[index]['tname'].toString().split(" ")[0]
                                    [0],
                              ),
                            ),
                      title: Text("${_list[index]['tname']}",
                          style: TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_list[index]['temail']}",
                              style: TextStyle(color: Colors.white)),
                          Text("${_list[index]['tpass']}",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              var dd = await Navigator.push(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return Updatepage(_list[index]);
                                },
                              ));
                              if (dd == true) {
                                getalldata();
                                updateui();
                              }
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("${_list[index]['tname']}"),
                                      content: Text(
                                        "Are You Sure You Want To Delete this Data",
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Cancel")),
                                        ElevatedButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              int userid = _list[index]['id'];
                                              delete(_database!, userid);

                                              setState(() {});
                                            },
                                            child: Text("YES")),
                                      ],
                                    );
                                  });
                              // setState(() {});
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // } else {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
          },
        ),
      ),
    );
  }

  Future<void> delete(Database database, int userid) async {
    await DatabaseHandler.deleteUser(_database!, userid);
    setState(() {
      getalldata();
    });
  }
}
