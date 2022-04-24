import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class Bottom1 extends StatefulWidget {
  const Bottom1({Key? key}) : super(key: key);

  @override
  State<Bottom1> createState() => _Bottom1State();
}

class _Bottom1State extends State<Bottom1> {
  int Index = 0;

  List Pages = [
    First(),
    Second(),
    Third(),
    Fourth(),
    Five(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Bar'),
          centerTitle: true,
          backgroundColor:Colors.black45,
        ),
        body: Pages[Index],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: Index,
          onItemSelected: (val) {
            setState(() {
              Index = val;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('HOME'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.list_rounded),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
                title: Text('CATEGORY')),
            BottomNavyBarItem(
                icon: Icon(Icons.shopping_cart),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
                title: Text('CART')),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
                title: Text('FAVORITE')),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('SETTING'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 250),
                alignment: Alignment.center,
                child: Icon(
                  Icons.home_filled,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Home Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
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
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 250),
                alignment: Alignment.center,
                child: Icon(
                  Icons.list_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Category Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
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
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 250),
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Cart Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
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
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 250),
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Favorite Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
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
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 250),
                alignment: Alignment.center,
                child: Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Text(
                'Settings Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////
class Six extends StatelessWidget {
  const Six({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 6'),
    );
  }
}

/////
class Seven extends StatelessWidget {
  const Seven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5'),
    );
  }
}

//////

class Eight extends StatelessWidget {
  const Eight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5'),
    );
  }
}
