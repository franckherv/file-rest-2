import 'package:flutter/material.dart';
import 'textStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFeff3f5),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.13;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFeff3f5),
        leading: Icon(Icons.camera_alt, color: Colors.grey),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(Icons.email, color: Colors.grey),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Color(0xFFeff3f5),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.add, color: Colors.red, size: 35),
                      ),
                      Text(
                        "Me",
                        style: stylegrasme,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/f1.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                      ),
                      Text("Eliane", style: stylegras),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/h2.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                      ),
                      Text("Paul", style: stylePasgras),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/h1.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                      ),
                      Text("Eric", style: stylegras)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/h3.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                      ),
                      Text("Delapin", style: stylePasgras)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(7),
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/f3.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.pink, width: 2),
                        ),
                      ),
                      Text("Roseline", style: stylegras),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/f2.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Text(
                    "Louise Martinez",
                    style: kstylegras,
                  ),
                  subtitle: Text("Central park, NYC"),
                ),
                Container(
                  
                  margin: EdgeInsets.all(10),
                  width: 350,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/f2.jpg"), fit: BoxFit.cover),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border_outlined, size: 25),
                    SizedBox(width: 7 ),
                    Icon(Icons.comment_outlined),
                    SizedBox(width: 7 ),
                    Icon(Icons.send_outlined),
                      ],
                    ),
                    SizedBox(width: 280),
                    Container(
                      child: Icon(Icons.bookmark_border_outlined),
                      ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Color(0xFFeff3f5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        //fit: StackFit.loose,
                          textDirection: TextDirection.rtl,
                        children: [
                           Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/f4.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            ), 
                            
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              width: 100,
                              height: 40,
                             decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/h7.jpg"),
                                  fit: BoxFit.cover
                                  ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            ), 
                            Container(
                               margin: EdgeInsets.only(left: 25),
                              height: 40,
                              width: 80,
                                 decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/h6.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            ),
                             Container(
                              
                              height: 40,
                              width: 50,
                                 decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/f4.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            ),
                        ],
                      ),
                      SizedBox(width: 35 ),
                      Text("liked yanna_summer and 12k more"),
                    ],
                    ),
                    Text("Lana_Smith let me know what you thing #cringey? #awesome? Should I make more? my honor and haven wanted this so bad it's their favorite thind", textAlign: TextAlign.start, style: stylegras,),
         
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
