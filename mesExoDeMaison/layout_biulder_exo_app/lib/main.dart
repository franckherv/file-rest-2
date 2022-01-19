import 'package:flutter/material.dart';
import 'package:layout_biulder_exo_app/api_Simulator/simulator.dart';
import 'package:layout_biulder_exo_app/models/user_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilderPage(),
    );
  }
}

class LayoutBuilderPage extends StatefulWidget {
  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => Container());
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("images/map.jpg"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios, size: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {},
                      icon: Icon(Icons.add_call, size: 30),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 100,
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bike_scooter,
                          color: Colors.white,
                        ),
                        Text("4 min",
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
