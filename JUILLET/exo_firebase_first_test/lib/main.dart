import 'package:exo_firebase_first_test/screen/profil_screen.dart';

import './screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
      routes: {
        FormScreen.routeName: (cxt) => FormScreen(),
      },
    );
  }
}

