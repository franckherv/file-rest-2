import 'package:flutter/material.dart';
import 'package:food_app_project/screen/filter_screen.dart';

class DrawerMenu extends StatelessWidget {
  Widget buildDrawer(String title, IconData icon, Function tap) {
    return ListTile(
      onTap: tap,
      title: Text(title),
      leading: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.amber,
              child: Text("Cuisine",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(height: 20),
          buildDrawer("Restaurant", Icons.restaurant_menu, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildDrawer("Filtrage", Icons.shopping_cart, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
          buildDrawer("Favoris", Icons.favorite, () {}),
        ],
      ),
    );
  }
}
