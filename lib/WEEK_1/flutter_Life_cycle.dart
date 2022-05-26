import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Six extends StatefulWidget {
  const Six({Key? key}) : super(key: key);

  @override
  State<Six> createState() => _SixState();
}

class _SixState extends State<Six> with WidgetsBindingObserver {
  var lifecycle;

  @override
  void initState() {
    super.initState();
    initStates();
    WidgetsBinding.instance!.addObserver(this);
    print("initState");
  }

  void initStates() {
    Fluttertoast.showToast(
        msg: "initstate",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black54);
  }

  @override
  void dispose() {
    super.dispose();
    dispos();
    WidgetsBinding.instance!.addObserver(this);
    print("Dispose");
  }

  void dispos() {
    Fluttertoast.showToast(
        msg: "Dispose",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black54);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
    // deactive();
  }

  void deactive() {
    Fluttertoast.showToast(
        msg: "deactivate",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black54);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print('$state');
    switch (state) {
      case AppLifecycleState.paused:
        {
          lifecycle = "paused";
          showInSnackBar(lifecycle);
        }

        break;
      case AppLifecycleState.resumed:
        {
          lifecycle = "resumed";
          showInSnackBar(lifecycle);
        }

        break;
      case AppLifecycleState.inactive:
        {
          lifecycle = "inactive";
          showInSnackBar(lifecycle);

          // Fluttertoast.showToast(
          //     msg: "$lifecycle",
          //     toastLength: Toast.LENGTH_LONG,
          //     backgroundColor: Colors.green);
        }

        break;
      case AppLifecycleState.detached:
        {
          lifecycle = "detached";
          print("detached");
          showInSnackBar(lifecycle);
        }

        break;
      default:
    }
  }

  showInSnackBar(String value) {
    Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle'),
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
          // child: Center(
          //   child: Text("$_counter"),
          // ),
        ),
      ),
    );
  }
}
