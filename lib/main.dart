import 'package:flutter/material.dart';
import 'package:project1/AddPage.dart';
import 'package:project1/EditPage.dart';
import 'package:project1/HomePage.dart';
import 'package:project1/TodayPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/add': (context) => AddPage(),
        '/edit': (context) => EditPage(),
        '/today': (context) => TodayPage(),
      },
    );
  }
}
