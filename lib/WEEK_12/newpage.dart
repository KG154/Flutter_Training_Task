import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:taskproject/WEEK_12/newSecondScreen.dart';

import '../WEEK_4/lazy loading/users.dart';

class newPage extends StatefulWidget {
  const newPage({Key? key}) : super(key: key);

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  List<Users> _list = [];

  Future<void> fetchUsers() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var jsonResponse = json.decode(response.body);
    for (var i = 0; i < jsonResponse.length; i++) {
      _list.add(Users.fromJson(jsonResponse[i]));
    }
    print("list $_list");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return newSecondScreen();
                },
              ));
              fetchUsers();
            },
            icon: Icon(Icons.navigate_next_outlined),
          ),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  dense: true,
                  title: Text("${_list[index].name.toString()}"),
                  subtitle: Text(_list[index].email.toString()),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            );
          }),
    );
  }
}
