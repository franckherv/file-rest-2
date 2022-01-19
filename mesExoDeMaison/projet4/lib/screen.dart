import 'package:flutter/material.dart';


class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATRICE", style: TextStyle(color: Colors.white),),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Text("Calchj")
        ],
      ),
    );
  }
}

