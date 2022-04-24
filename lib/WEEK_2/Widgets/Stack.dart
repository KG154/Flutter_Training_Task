import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stack1 extends StatefulWidget {
  const stack1({Key? key}) : super(key: key);

  @override
  State<stack1> createState() => _stack1State();
}

class _stack1State extends State<stack1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Demo'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              // color: Colors.deepOrange,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Images/OIP.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        left: 40,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/OIP2.jpg"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            left: 80,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("Images/OIP1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Positioned(
                                left: 130,
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("Images/Elephant.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300,
              left: 200,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.deepPurple,
                child: const Text(
                  'Image in stack',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
