import 'package:flutter/material.dart';

class TAB_BAR extends StatefulWidget {
  const TAB_BAR({Key? key}) : super(key: key);

  @override
  State<TAB_BAR> createState() => _TAB_BARState();
}

class _TAB_BARState extends State<TAB_BAR> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar'),
          backgroundColor: Colors.black45,
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.amberAccent,
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Creates border
              border: Border.all(width: 1.0, color: Colors.blue),
              boxShadow: [
                BoxShadow(
                    color: Colors.black87.withOpacity(0.3),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                    spreadRadius: 1)
              ],
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.home_filled, size: 20),
                text: "Home",
              ),
              Tab(
                  icon: Icon(
                    Icons.list_rounded,
                    size: 20,
                  ),
                  text: "CATEGORY"),
              Tab(icon: Icon(Icons.email, size: 20), text: "Email"),

              Tab(icon: Icon(Icons.favorite, size: 20), text: "favorite Item"),
              Tab(icon: Icon(Icons.image, size: 20), text: "Upload Your Item Image"),
              Tab(
                  icon: Icon(Icons.more_horiz_outlined, size: 20),
                  text: "MORE"),
              Tab(icon: Icon(Icons.warning_rounded, size: 20), text: "About"),
              Tab(icon: Icon(Icons.settings, size: 20), text: "Setting"),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          child: const TabBarView(
            children: [
              First(),
              Second(),
              Third(),
              Fourth(),
              Five(),
              Six(),
              Seven(),
              Eight(),
            ],
          ),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 1',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}


///////
class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 2',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}


/////
class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 3',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}


////
class Fourth extends StatelessWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 4',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}


////
class Five extends StatelessWidget {
  const Five({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}

////
class Six extends StatelessWidget {
  const Six({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 6',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}

/////
class Seven extends StatelessWidget {
  const Seven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}

//////

class Eight extends StatelessWidget {
  const Eight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tab 5',style: TextStyle(fontSize: 25, color: Colors.white),),
    );
  }
}
