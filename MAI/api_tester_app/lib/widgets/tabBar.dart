import 'package:api_tester_app/screen/accueil.dart';
import 'package:api_tester_app/screen/new_item_page.dart';
import 'package:api_tester_app/screen/tabbar_one.dart';
import 'package:api_tester_app/screen/tabbar_two.dart';
import 'package:api_tester_app/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  final List<Widget> _children = [
       CategoryHomeScreen(),
      TabOne(),
      TabTwo()
  ];

  int selectIndex = 0;

  void functionSlectionned(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      drawer: DrawerMenu(),
      body: _children[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.amber,
        currentIndex: selectIndex,
        onTap: functionSlectionned,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
              icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
              icon: Icon(Icons.restaurant), label: "restaurant"),
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta), label: "Maquis"),
        ],
      ),
    );
  }
}
