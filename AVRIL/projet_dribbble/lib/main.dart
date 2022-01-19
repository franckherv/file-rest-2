import 'package:flutter/material.dart';
import 'package:projet_dribbble/card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dribble(),
    );
  }
}

