import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nan_info/screens/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>HomeScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFD1B1B),
                 Color(0xFF00CCFF),
              ]),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Akwaba", style: TextStyle(fontSize: 40, color: Colors.white))
                )),
            Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                   decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/new.png",), fit: BoxFit.fill)),
                )),
          ],
        ),
      ),
    );
  }
}