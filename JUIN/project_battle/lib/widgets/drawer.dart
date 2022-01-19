import 'package:flutter/material.dart';
import 'package:project_battle/screens/home_page.dart';
import 'package:project_battle/screens/orders_article_screen.dart';



class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            title: Text("Bienvenue"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
            }
          ),
          Divider(),
           ListTile(
            leading: Icon(Icons.shop),
            title: Text("Commandes"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}
