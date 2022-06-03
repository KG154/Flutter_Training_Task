import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../LoginScrenn.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              autofocus: true,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent.shade700,
      ),
      body: SafeArea(
        child: Center(
          child: Text("Welcome User"),
        ),
      ),
    );
  }
}
