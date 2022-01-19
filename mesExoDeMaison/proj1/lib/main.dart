import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "Koffi Yao Olivier";
  String city = "Abidjan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("User Profil",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              height: 20,
              color: Colors.blueGrey,
              child: Divider(),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img2.jpg"), fit: BoxFit.cover),
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(150)),
            ),
            Center(
                child: Column(
              children: [
                Text("Name : $name",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text("City : $city",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text("Username : Oliver",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text("Number :07 47 55 72 90",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text("Email : franckjvsd@gmail.com",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
                ),
              ],
            )),
            Divider(color: Colors.blueGrey),
            Container(
              width: 300,
              color: Colors.blueGrey,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                child: Text("RETOUR", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  print("===Ok====");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
