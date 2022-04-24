import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Image1 extends StatefulWidget {
  const Image1({Key? key}) : super(key: key);

  @override
  State<Image1> createState() => _Image1State();
}

class _Image1State extends State<Image1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Demo'),
        backgroundColor: const Color(0xFF3F4EF6),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 30,left: 20,right: 20),
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  "Images/OIP.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.purple
                        ]),
                        shape: BoxShape.circle),
                    child: Padding(
                      //this padding will be you border size
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        // height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          foregroundImage: NetworkImage(
                              "https://i.ibb.co/rkG8cCs/112921315-gettyimages-876284806.jpg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
