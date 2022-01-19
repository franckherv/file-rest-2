import 'package:flutter/material.dart';
import 'package:project_battle/widgets/drawer.dart';
import 'package:project_battle/widgets/grid_view.dart';
import 'package:project_battle/constants/constant_style.dart';
import 'package:project_battle/widgets/stack_panier.dart';

enum FavorisOption {
  Product,
  Favorite,
}

class HomePageScreen extends StatefulWidget {
  static const routeName = "/detail";

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool sectedFariteItem = true;

 

  Widget colorsWiew(context, Color color, String child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Text(child, style: TextStyle(color: Colors.white),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Acceuil")),
      backgroundColor: Colors.grey[400],
      body: Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome", style: titleStyle),
            Row(
              children: [
                StackPanier(),
                PopupMenuButton(
                  onSelected: (FavorisOption select) {
                    setState(() {
                      if (FavorisOption.Product == select) {
                        sectedFariteItem = true;
                        print("product");
                      } else {
                        sectedFariteItem = false;
                      }
                    });
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text("Produits"),
                        value: FavorisOption.Product),
                    PopupMenuItem(
                        child: Text("Favoris"),
                        value: FavorisOption.Favorite),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              colorsWiew(context, Colors.teal, "Chaussures"),
              colorsWiew(context, Colors.teal, "sacs"),
              colorsWiew(context, Colors.teal, "trophés"),
              colorsWiew(context, Colors.teal, "ballon"),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text("Nos chaussures", style: titleStyle),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GridViewOverScreen(),
      ],
    ),
      ),
    );
  }
}
