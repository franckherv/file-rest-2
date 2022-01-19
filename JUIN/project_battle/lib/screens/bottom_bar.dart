import 'package:flutter/material.dart';
import 'package:project_battle/screens/home_page.dart';
import 'package:project_battle/screens/maillot_screen.dart';
import 'package:project_battle/screens/others_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = "/bottom";

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageScreen(),
    MaillotScreen(),
    OthersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Chaussures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_divider),
            label: 'Maillots',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Autres')
        ],
      ),
    );
  }
}
