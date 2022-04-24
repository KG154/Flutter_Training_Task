import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  // int selectedIndex = 0;
  // List<IconData> data = [
  //   Icons.home_outlined,
  //   Icons.search,
  //   Icons.add_box_outlined,
  //   Icons.favorite_outline_sharp,
  //   Icons.person_outline_sharp
  // ];

  List Pages = [
    First(),
    Second(),
    Third(),
    Fourth(),
    Five(),
  ];

  int currentselction = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Bar'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            height: 538,
            child: Pages[currentselction],
          ),
          Container(
            height: 60,
            // color: Colors.deepOrange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(25),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 60,
                        // margin: EdgeInsets.only(bottom: 12, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(width: 12),
                            InkWell(
                              // key: key1,
                              onTap: () {
                                setState(() {
                                  currentselction = 0;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 40,
                                child: Icon(
                                  Icons.home_outlined,
                                  color: currentselction == 0
                                      ? Colors.indigo
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            // SizedBox(width: 12),
                            InkWell(
                              // key: key2,
                              onTap: () {
                                setState(() {
                                  currentselction = 1;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 40,
                                child: Icon(
                                  Icons.search,
                                  color: currentselction == 1
                                      ? Colors.indigo
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            // SizedBox(width: 12),
                            InkWell(
                              // key: key3,
                              onTap: () {
                                setState(() {
                                  currentselction = 2;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 40,
                                child: Icon(
                                  Icons.add_box_outlined,
                                  color: currentselction == 2
                                      ? Colors.indigo
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            // SizedBox(width: 12),
                            InkWell(
                              // key: key4,
                              onTap: () {
                                setState(() {
                                  currentselction = 3;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 40,
                                child: Icon(
                                  Icons.favorite_outline_sharp,
                                  color: currentselction == 3
                                      ? Colors.indigo
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            // SizedBox(width: 12),
                            InkWell(
                              // key: key5,
                              onTap: () {
                                setState(() {
                                  currentselction = 4;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 40,
                                child: Icon(
                                  Icons.person_outline_sharp,
                                  color: currentselction == 4
                                      ? Colors.indigo
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

/**/

/**/
/* Stack(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 250),
                                  width: 35,
                                  decoration: BoxDecoration(
                                    border: index == selectedIndex
                                        ? Border(
                                            top: BorderSide(
                                                width: 3.0,
                                                color: Colors.white))
                                        : null,
                                  ),
                                  child: Icon(
                                    data[index],
                                    size: 35,
                                    color: index == selectedIndex
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),*/

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Home Page')),
      ),
    );
  }
}

///////
class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Search Page')),
      ),
    );
  }
}

/////
class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('CART Page')),
      ),
    );
  }
}

////
class Fourth extends StatelessWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('FAVORITE Page')),
      ),
    );
  }
}

////
class Five extends StatelessWidget {
  const Five({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Profile Page')),
      ),
    );
  }
}
