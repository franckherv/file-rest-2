import 'package:api_tester_app/screen/accueil.dart';
import 'package:api_tester_app/widgets/tabBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyTabBar(),
    );
  }
}

