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
  Database? _database;
  DatabaseHandler _databaseHandler = DatabaseHandler();
  List<Map> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getalldata();
    _list = [];
  }

  Future<List<Map>> getalldata() async {
    await _databaseHandler.CreateDataBase().then((value) async {
      _database = value;
      await _databaseHandler.viewdata(_database!).then((value1) {
        _list = value1;
        print('list =  $_list');
      });
    });
    return _list;
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: FutureBuilder(
          future: getalldata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "${_list[index]['tname'].split(" ")[0][0]}",
                            style: TextStyle(color: Colors.white),
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
                                // Navigator.pushNamed(context, '/Updatepage',arguments: _list[index]);

                                var dd = await Navigator.push(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Updatepage(_list[index]);
                                  },
                                ));
                                if (dd == true) {
                                  setState(() {
                                    getalldata();
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                      // barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text("${_list[index]['tname']}"),
                                          content: Text(
                                            "Are You Sure You Want To Delete this Data",
                                            style: TextStyle(
                                                color: Colors.redAccent),
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
                                                  int userid =
                                                      _list[index]['id'];
                                                  await DatabaseHandler
                                                      .deleteUser(
                                                          _database!, userid);
                                                  setState(() {});
                                                },
                                                child: Text("YES")),
                                          ],
                                        );
                                      });
                                });
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
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(fontSize: 50, color: Colors.black87),
                    ),
                  ),
                );
              }
            } else {
              return SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(color: Colors.indigo),
              );
            }
          },
        ),
      ),
    );
  }
}
