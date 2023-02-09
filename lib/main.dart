import 'package:flutter/material.dart';
import 'package:climate/screens/loading_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffbce6ff),
        fontFamily: "roboto",
      ),
      home: Live_locaation(),
    );
  }
}
