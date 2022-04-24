import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listv1 extends StatefulWidget {
  const Listv1({Key? key}) : super(key: key);

  @override
  State<Listv1> createState() => _Listv1State();
}

class _Listv1State extends State<Listv1> {
  List<String> list = [
    "one",
    "two",
    "tree",
    "foure",
    "five",
    "six",
    "seven",
    "Eight",
    "kishan",
    "jydeep",
    "tree",
    "foure",
    "five"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.3),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                                spreadRadius: 1)
                          ],
                          border: Border.all(color: Colors.blue)),
                      child: Center(
                        child: Text('Card No.${list[index]}',style: TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                      // color: Colors.green,
                    );
                  },
                ),
              ),
              Flexible(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    // height: 90,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87.withOpacity(0.3),
                              blurRadius: 1,
                              offset: Offset(0, 1),
                              spreadRadius: 1)
                        ],
                        border: Border.all(color: Colors.blue)),
                    child: ListTile(
                      title: Text(
                        list[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
