import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskproject/WEEK_12/provider/Movies_Provider.dart';
import 'package:taskproject/WEEK_12/provider/Screen/homeProviderScreen.dart';

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
      create: (_) => MovieProvider(),
      child: HomeScreen1(),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Provider',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeScreen(),
    );
  }
}
