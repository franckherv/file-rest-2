import 'package:flutter/material.dart';
import 'screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double slider = 170.0;

  int weight = 10;
  int age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI calculator"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("========= OK MALE ========");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33),
                      //color: Color(0xFF1D1E33),
                    ),
                    width: 170,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 80, color: Colors.white),
                        SizedBox(
                          height: 15,
                        ),
                        Text("HOMME",
                            style: TextStyle(color: Colors.grey, fontSize: 23)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("====== OK FEMELLE ======");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1D1E33),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add_rounded,
                            size: 80, color: Colors.white),
                        SizedBox(
                          height: 15,
                        ),
                        Text("FEMME",
                            style: TextStyle(color: Colors.grey, fontSize: 23)),
                      ],
                    ),
                    width: 170,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF1D1E33),
              ),
              width: double.infinity,
              height: 200,
              child: Column(
                children: [
                  Text("Taille",
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${slider.toInt()}',
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      Text("Cm",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    ],
                  ),
                  Slider(
                      min: 90,
                      max: 220,
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.white,
                      value: slider,
                      onChanged: (double b) {
                        setState(() {
                          slider = b;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("Poids",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$weight ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.remove, size: 40),
                          ),
                          SizedBox(width: 15),
                          FloatingActionButton(
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add, size: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 170,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text("Age",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "29",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.grey,
                            onPressed: () {},
                            child: Icon(Icons.remove, size: 40),
                          ),
                          SizedBox(width: 15),
                          FloatingActionButton(
                            backgroundColor: Colors.grey,
                            onPressed: () {},
                            child: Icon(Icons.add, size: 40),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 15, bottom: 20),
              width: double.infinity,
              height: 60,
              color: Colors.lightGreen,
              child: Center(
                child: Text("Calculer",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
