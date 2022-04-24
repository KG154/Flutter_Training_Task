import 'package:flutter/material.dart';

class GooutPage extends StatefulWidget {
  const GooutPage({Key? key}) : super(key: key);

  @override
  State<GooutPage> createState() => _GooutPageState();
}

class _GooutPageState extends State<GooutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Go Out'),
              Icon(Icons.directions_walk_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
