import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Add User.dart';
import 'Update Data.dart';
import 'userdata.dart';
import 'usermodal.dart';

class WebColling extends StatefulWidget {
  const WebColling({Key? key}) : super(key: key);

  @override
  State<WebColling> createState() => _WebCollingState();
}

class _WebCollingState extends State<WebColling> {

  Future<Usermodal> getPostApi() async {
    final respons = await http.get(
        Uri.parse("http://192.168.1.42/Practical_Api/api/get_user_list"),
        headers: {
          "Token":
          "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        });
    var datass = jsonDecode(respons.body.toString());
    if (respons.statusCode == 200) {
      return Usermodal.fromJson(datass);
    } else {
      return Usermodal.fromJson(datass);
    }
  }

  Future delete(String user_id, AsyncSnapshot snapshot, int index) async {
    var delrespo = await http.delete(
        Uri.parse("http://192.168.1.42/Practical_Api/api/delete_user"),
        headers: {
          "Token":
          "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        },
        body: {
          "user_id": user_id
        });
    print(delrespo.body);
    // if (jsonDecode(delrespo.body)["statusCode"] == "3") {
    //
    // }
    if (delrespo.statusCode == 200) {
      setState(() {
        getPostApi();
      });
      return true;

    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
          backgroundColor: Colors.black45,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var add =  await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return AddUser();
              },
            ));
            if(add == true){
              setState(() {
                getPostApi();
              });
            }
          },
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: FutureBuilder<Usermodal>(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      height: 65,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                          BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.3),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                                spreadRadius: 1)
                          ],
                          border: Border.all(color: Colors.blue)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return userdata(
                                snapshot.data!.data![index].userId.toString(),
                                snapshot.data!.data![index].name.toString(),
                                snapshot.data!.data![index].email.toString(),
                                snapshot.data!.data![index].profilePic.toString(),
                              );
                            },
                          ));
                        },
                        title: Text(snapshot.data!.data![index].name.toString(),style: TextStyle(color: Colors.white),),
                        subtitle:
                        Text(snapshot.data!.data![index].email.toString(),style: TextStyle(color: Colors.white)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                var edit  =  await Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Updatedata(
                                      snapshot.data!.data![index].userId
                                          .toString(),
                                      snapshot.data!.data![index].name.toString(),
                                      snapshot.data!.data![index].email
                                          .toString(),
                                      snapshot.data!.data![index].profilePic
                                          .toString(),
                                    );
                                  },
                                ));
                                if(edit == true){
                                  setState(() {
                                    getPostApi();
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Delete Data"),
                                          content: const Text(
                                            "Are You Sure You Want To Delete this Data",
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Cancel")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  var user_id = snapshot
                                                      .data!.data![index].userId
                                                      .toString();
                                                  delete(
                                                      user_id, snapshot, index);
                                                  setState(() {
                                                  });
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
                return Center(
                    child: CircularProgressIndicator(color: Colors.indigo));
              }
            },
          ),
        ));
  }
}
