import 'package:flutter/material.dart';

class Dribble extends StatefulWidget {
  @override
  _DribbleState createState() => _DribbleState();
}

class _DribbleState extends State<Dribble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f3ef),
      body: SingleChildScrollView(
              child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurant",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          width: 70,
                          height: 30,
                          child: Text(
                            "20-30mn",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("24km Restaurant"),
                      ],
                    ),
                    Text('"Orange sandwiches is delicious"',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ))
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "4.7",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
            SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0XFFf3bf4f),
                      ),
                      child: Text("Recommend"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Text("popular"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Text("Noodles"),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage("images/food2.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Orange sandwiches",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "N°1 in sales",
                            style:
                                TextStyle(fontSize: 18, color: Color(0XFFf8e1a4)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "4500 F",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_right, size: 30,)
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage("images/food3.jpg"),
                              fit: BoxFit.cover),
                              ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sai Ua Samun Phrail",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Highly recommended",
                            style:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "5200 F",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_right, size: 30,)
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage("images/food4.png"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Ratatouille Pasta",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Low tot",
                            style:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "6300 F",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_right, size: 30,)
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0XFFf6c753),
                child: Icon(Icons.pageview, color: Colors.black,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
