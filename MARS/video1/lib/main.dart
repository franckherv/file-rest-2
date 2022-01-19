import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notre application",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
     CircleAvatar(
        radius: 70.0,
        backgroundImage: AssetImage("images/img2.jpg"),
        ),
 Container(
   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
   child: Text("Franck", style: TextStyle(fontFamily: 'Pacifico', color: Colors.white, fontSize: 25)),
   ),
 Text("Developpeur flutter"),
 Card(
   child: ListTile(
     leading: Icon(Icons.phone),
     title: Text("+454 47557290"),
   ),
 ),
  Card(
   child: ListTile(
     leading: Icon(Icons.email),
     title: Text("franckhervetehoua@gmail.com"),
   ),
 ),
        ],
            ),
      ),
    );
  }
}

