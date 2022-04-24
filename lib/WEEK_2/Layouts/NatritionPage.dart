import 'package:flutter/material.dart';

class NatritionPage extends StatefulWidget {
  const NatritionPage({Key? key}) : super(key: key);

  @override
  State<NatritionPage> createState() => _NatritionPageState();
}

class _NatritionPageState extends State<NatritionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pro'),
              Icon(Icons.broken_image),
            ],
          ),
        ),
      ),
    );
  }
}
