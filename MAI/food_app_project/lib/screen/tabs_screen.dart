import 'package:flutter/material.dart';
import '../screen/drawer_menu.dart';
import '../screen/favorite_screen.dart';
import 'category_meals_screen.dart';

class TabsCreen extends StatefulWidget {
  @override
  _TabsCreenState createState() => _TabsCreenState();
}

class _TabsCreenState extends State<TabsCreen> {
  int _currentIndex = 0;
  final List<Map<String, Object>> _page = [
    {
    "page" : CategoryScreen(),
    "title" : "Categories"
    },
    {
    "page":  FavoritesScreen(),
    "title" : "Favoris"
      },
  ];

  void selectedPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( _page[_currentIndex]["title"]),
      ),
      drawer: DrawerMenu(),
      body: _page[_currentIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        onTap:  selectedPage,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.home),
              label: "Accueil"),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.star),
              label: "Favoris"),
        ],
      ),
    );
  }
}
