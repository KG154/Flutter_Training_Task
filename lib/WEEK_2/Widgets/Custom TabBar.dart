import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  int currentindex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tab Bar'),
        backgroundColor: const Color(0xFF3F4EF6),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    margin: EdgeInsets.only(left: 15, right: 20),
                    alignment: Alignment.center,
                    decoration: (currentindex == 0)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "One",
                      style: (currentindex == 0)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 40,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: (currentindex == 1)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "Two",
                      style: (currentindex == 1)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: (currentindex == 2)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "Three",
                      style: (currentindex == 2)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: (currentindex == 3)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "Foure",
                      style: (currentindex == 3)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(4,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: (currentindex == 4)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "Five",
                      style: (currentindex == 4)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _pageController!.animateToPage(5,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    decoration: (currentindex == 5)
                        ? BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "Six",
                      style: (currentindex == 5)
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 518,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.white),
            child: PageView(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "First Page",
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Second Page",
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Third Page",
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Foure Page",
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Five Page",
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Six Page",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
