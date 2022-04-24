import 'package:flutter/material.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider/drawer'),
        backgroundColor: Colors.black45,

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundImage: AssetImage("Images/download.jpg"),
                ),
              ),
              accountName: Text('Abc'),
              accountEmail: Text("Abc@gmail.com"),
            ),
            const ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_sharp),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(Icons.person),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_sharp),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: const Text(
                'Second',
                style: TextStyle(fontSize: 20),
              ),
              trailing: Icon(Icons.arrow_forward_sharp),
              leading: Icon(Icons.favorite),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Level_2();
                  },
                ));
              },
            ),
            const Padding(
              padding:EdgeInsets.only(top: 50),
              child: Divider(
                color: Colors.amber,
                thickness: 5,
                height: 0,
              ),
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                'About',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.details_outlined),
              onTap: () {},
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/week2'));
                  },
                  child: const Text('Exit')),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child:  Center(
          child: Text(
            'afdhbhrf',
            style: TextStyle(fontSize: 30,color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//////////////////////
class Level_2 extends StatefulWidget {
  const Level_2({Key? key}) : super(key: key);

  @override
  State<Level_2> createState() => _Level_2State();
}

class _Level_2State extends State<Level_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 2'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
        child: const Center(
          child: Text('ABCDE',style: TextStyle(fontSize: 25, color: Colors.white),),
        ),
      ),
    );
  }
}

////////////////////////////

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
