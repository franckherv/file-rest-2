import 'package:flutter/material.dart';
import 'package:project_battle/constants/constant_style.dart';
import 'package:project_battle/widgets/maillot_grid_widget.dart';
import 'package:project_battle/widgets/stack_panier.dart';

enum FavorisOption {
  Product,
  Favorite,
}

class MaillotScreen extends StatefulWidget {
  @override
  _MaillotScreenState createState() => _MaillotScreenState();
}

class _MaillotScreenState extends State<MaillotScreen> {
  bool sectedFarite = true;
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
        child: Text(
          child,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maillot"), centerTitle: true),
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
                            sectedFarite = true;
                            print("product");
                          } else {
                            sectedFarite = false;
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
                Text("Nos Maillots", style: titleStyle),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ViewMaillotOverScreen(),
          ],
        ),
      ),
    );
  }
}
