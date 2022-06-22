import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class refreshScrenn extends StatefulWidget {
  const refreshScrenn({Key? key}) : super(key: key);

  @override
  State<refreshScrenn> createState() => _refreshScrennState();
}

class _refreshScrennState extends State<refreshScrenn> {
  List<dynamic> _list = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> _getData() async {
    setState(() {
      fetchUsers();
    });
  }

  void fetchUsers() async {
    var result =
        await http.get(Uri.parse("https://randomuser.me/api/?results=40"));
    setState(() {
      _list = json.decode(result.body)['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Pull To Refresh",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: _list.length != 0
          ? RefreshIndicator(
              onRefresh: _getData,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(_list[index]['name']['first'].toString()),
                          subtitle: Text(_list[index]['email']),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    );
                  }),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
