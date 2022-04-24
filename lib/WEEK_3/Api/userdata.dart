import 'package:flutter/material.dart';

class userdata extends StatefulWidget {
  String uid;
  String Ename;
  String Eemail;
  String Images;

  userdata(this.uid, this.Ename, this.Eemail, this.Images);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.Images == null
                ? Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 30, left: 100, right: 100),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage("Images/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 30, left: 100, right: 100),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(widget.Images),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Text("User Id :- ${widget.uid}",                style: const TextStyle(color: Colors.white),
            ),
            Text("Name    :- ${widget.Ename}",                style: const TextStyle(color: Colors.white),
            ),
            Text("Email   :- ${widget.Eemail}",                style: const TextStyle(color: Colors.white),
            ),
            // Text("Create  :- ${widget.createdAt}"),
          ],
        ),
      ),
    );
  }
}
