import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? offset;

  String contain = "Page one";

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController!, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Custom Drawer"),
          backgroundColor: Colors.black45,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              switch (_animationController!.status) {
                case AnimationStatus.completed:
                  _animationController!.reverse();
                  break;
                case AnimationStatus.dismissed:
                  _animationController!.forward();
                  break;
                default:
              }
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            switch (_animationController!.status) {
              case AnimationStatus.completed:
                _animationController!.reverse();
                break;
              default:
            }
          },
          child: Container(
            height: 800,
            width: 500,
            // color: Colors.white,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    contain,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                _drawer(context),
              ],
            ),
          ),
        ));
  }

  Widget _drawer(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SlideTransition(
            position: offset!,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                height: 800,
                width: 230,
                color: Color(0xFFF0F0F0),
                child: Column(
                  children: [
                    Container(
                      color: Color(0xFF3F4EF6),
                      height: 180,
                      width: 230,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            top: 30,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("Images/profile.jpg"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            top: 120,
                            child: Text(
                              "Abc",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            top: 150,
                            child: Text(
                              "Abc@gmail.com",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          contain = "Home";
                          switch (_animationController!.status) {
                            case AnimationStatus.completed:
                              _animationController!.reverse();
                              break;

                            default:
                          }
                        });
                      },
                      child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Home"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          contain = "Profile";
                          switch (_animationController!.status) {
                            case AnimationStatus.completed:
                              _animationController!.reverse();
                              break;

                            default:
                          }
                        });
                      },
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Profile"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          contain = "Abouts";
                          switch (_animationController!.status) {
                            case AnimationStatus.completed:
                              _animationController!.reverse();
                              break;

                            default:
                          }
                        });
                      },
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Abouts"),
                      ),
                    ),
                    Divider(
                      height: 150,
                      color: Colors.black87,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Exit')),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
