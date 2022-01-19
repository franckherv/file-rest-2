import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Climat"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
             children: [
               Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img.jpg"),
              fit: BoxFit.cover
            )
          ),
          
          ),
          
             ], 
      ),
    );
  }
}