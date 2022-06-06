import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Metho_Screen extends StatefulWidget {
  const Metho_Screen({Key? key}) : super(key: key);

  @override
  State<Metho_Screen> createState() => _Metho_ScreenState();
}

class _Metho_ScreenState extends State<Metho_Screen> {
  static const platform = MethodChannel('com.example.taskproject/battery');

// Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
