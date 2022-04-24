import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Gridview1 extends StatefulWidget {
  const Gridview1({Key? key}) : super(key: key);

  @override
  State<Gridview1> createState() => _Gridview1State();
}

class _Gridview1State extends State<Gridview1> {
  List imag = [
    'Images/OIP.jpg',
    'Images/OIP1.jpg',
    'Images/OIP2.jpg',
    'Images/R.jpg',
    'Images/Elephant.jpg',
    'Images/download1.jpg',
    'Images/OIP1.jpg',
    'Images/R.jpg',
    'Images/OIP.jpg',
    'Images/Elephant.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Demo'),
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
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Horizontal GridView',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                height: 150,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: imag.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 100,
                        child: Card(
                          child: Image.asset(
                            imag[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Vertical GridView',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                // height: double.infinity,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: imag.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Image.asset(
                          imag[index],
                          fit: BoxFit.cover,
                        ),
                        footer: GridTileBar(
                          title: Text('Wallpaper'),
                          backgroundColor: Colors.black87,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
