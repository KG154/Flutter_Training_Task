import 'package:flutter/material.dart';

class ProPage extends StatefulWidget {
  const ProPage({Key? key}) : super(key: key);

  @override
  State<ProPage> createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pro'),
              Icon(Icons.whatshot),
            ],
          ),
        ),
      ),
    );
  }
}
