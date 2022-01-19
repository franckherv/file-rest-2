import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'application BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI calculator',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  
                  child: ReusableCard(
                    couleur: Colors.pink),
                ),
                Expanded(
                  child: ReusableCard(couleur: Colors.amber),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(couleur: Colors.amber),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(couleur: Colors.amber),
                  ),
                  Expanded(
                    child: ReusableCard(),
                  ),
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: bottomContainerHeight,

            ),
          ],
        ),
        );
  }
}

class ReusableCard extends StatelessWidget {
  Color couleur;
  ReusableCard({this.couleur});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: couleur,
      ),
      margin: EdgeInsets.all(15),
      width: 170,
      height: 200,
    );
  }
}
