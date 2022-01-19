import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          
          ),
      debugShowCheckedModeBanner: false,
      home: HommeO(),
    );
  }
}

class HommeO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          width: 10,
          height: 10,
          padding: EdgeInsets.only(left: 7, top: 5, bottom: 5),
          child: ElevatedButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 18,
            ),
            onPressed: () => print("it's pressed"),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              //onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 60,
            padding: EdgeInsets.only(right: 7, top: 5, bottom: 5),
            child: ElevatedButton(
              child: Icon(
                Icons.favorite_sharp,
                color: Colors.grey,
                size: 18,
              ),
              onPressed: () => print("APPUYEZ"),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('images/img1.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Text(
              "Duplex Apartment",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Text(
                  "Abidjan, Yopougon ananeraie",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Icon(Icons.star, color: Colors.amber),
              Text(
                "4.8",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                "(256 Reviews)",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.dock_outlined, color: Colors.grey),
              ),
              Text("5"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.time_to_leave, color: Colors.grey),
              ),
              Text("2"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.pages, color: Colors.grey),
              ),
              Text("1"),
            ],
          ),
          //SizedBox(height: ,),
          Padding(
            padding: const EdgeInsets.only(right: 230),
            child: Text("1495 F/mo",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              "Description",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 12),
            child: Text(
                "Nous mettons à votre disposition des maisons toutes neuves kkdkdkdkdkdk, dear vjrty, ckortuyypoc,kfkfo. Vous pouvez payez selon vos avoirs",
                style: TextStyle(fontSize: 20)),
          ),

          SizedBox(height: 10),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage("images/img2.jpg"),
                ),
              ),

//********************** */

              Text("Franck Hervé",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),

              SizedBox(
                width: 90,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.sms,
                    size: 20,
                    color: Colors.grey,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                ),
              ),
//====================================================>
              Container(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.white,
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Divider(
              color: Colors.grey,
            ),
          ),

          Container(
            height: 45,
            width: 250,
            //padding: EdgeInsets.only(right: 7, top: 5, bottom: 5),
            child: ElevatedButton(
              child: Text(
                "Visiter",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              onPressed: () => print("APPUYEZ"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
