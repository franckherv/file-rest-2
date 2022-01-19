import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_manage_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            color: const Color(0xFF98DDFF),
            child: const Text("Espace administrateur"),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Accueil"),
              onTap: () {
                 Navigator.pushReplacementNamed(
                  context, "/");
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Gestion de produits"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ProductManageScreen.routeName);
            },
          ),
          const Divider(),
        ]),
      ),
    );
  }
}
