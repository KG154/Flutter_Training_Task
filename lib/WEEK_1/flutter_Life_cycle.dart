import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Six extends StatefulWidget {
  const Six({Key? key}) : super(key: key);

  @override
  State<Six> createState() => _SixState();
}

class _SixState extends State<Six> with WidgetsBindingObserver {

  String lifecycle = '';

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    print("initState");

    // Fluttertoast.showToast(
    //     msg: "initState",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    print("Dispose");
    // Fluttertoast.showToast(
    //     msg: "Dispose",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print('resumed');
      setState(() {
        lifecycle = showInSnackBar('resumed');
      });
    } else if (state == AppLifecycleState.inactive) {
      print('inactive');
      setState(() {
        lifecycle = showInSnackBar('inactive');
      });
    } else if (state == AppLifecycleState.paused) {
      print('paused');
      setState(() {
        lifecycle = showInSnackBar('paused');
      });
    } else if (state == AppLifecycleState.detached) {
      print('detached');
      setState(() {
        lifecycle = showInSnackBar('detached');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Controller'),
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
          child: Center(
            child: Text(lifecycle),
          ),
        ),
      ),
    );
  }




  // showInSnackBar(String value) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       duration: const Duration(milliseconds: 200),
  //       backgroundColor: Colors.black54,
  //       behavior: SnackBarBehavior.fixed,
  //       content: Text(value),
  //     ),
  //   );
  // }
  showInSnackBar(String value) {
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
