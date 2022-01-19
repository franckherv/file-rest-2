import 'package:flutter/material.dart';
import 'package:shop_app/screens/costum_bottom_bar.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/screens/profil.dart';

class SharedBottomAppBar extends StatefulWidget {
  @override
  _SharedBottomAppBarState createState() => _SharedBottomAppBarState();
}

class _SharedBottomAppBarState extends State<SharedBottomAppBar> {
  Widget _lastSelected = const ProductsOverviewScreen();

  String _title = 'Accueil';
  List<Widget> pages = [


    const ProfilScreen(),
        const OrderScreen(),
        const ProductsOverviewScreen(),
  ];

  List<String> titles = ['Profil', 'Commandes', 'Accueil'];

  void _selectedTab(int index) {
    setState(() {
      print(index);
      _lastSelected = pages[index];
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lastSelected,
      bottomNavigationBar: CustomBottomAppBar(
        color: Colors.grey,
        selectedColor: const Color(0xFF98DDFF),
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          BottomAppBarItem(iconData: Icons.person, text: 'Profil'),
          BottomAppBarItem(iconData: Icons.shopping_cart, text: 'Commandes'),
          BottomAppBarItem(iconData: Icons.home, text: 'Accueil'),
        ],
      ),
    );
  }
}
