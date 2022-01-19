import 'package:flutter/material.dart';

import 'package:pro1_simplon/screens/order_screen.dart';

class DrawerAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children: [
          AppBar(
            title: Text("OlAsHoP"),
            
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Commande"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
    
        ],
      ),
    );
  }
}
