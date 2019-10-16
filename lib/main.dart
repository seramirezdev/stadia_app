import 'package:flutter/material.dart';
import 'package:stadia_app/src/pages/home/landing_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Stadia App Concept',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.white,
          primarySwatch: Colors.blue,
          fontFamily: 'Oxygen'),
      home: LandingPage(),
    );
  }
}
