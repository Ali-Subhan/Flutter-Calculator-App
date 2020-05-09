import 'package:flutter/material.dart';
import 'package:calculatorassignmentdesign/sceens/claculator-screen.dart';
import 'package:calculatorassignmentdesign/sceens/splash-screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

