import 'package:flutter/material.dart';
import './screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      home: Accueil(),
    );
  }
}