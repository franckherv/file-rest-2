import 'package:flutter/material.dart';
import 'package:shopping_app_home_work/models/model_produit.dart';

class DisplayProduitWidget extends StatefulWidget {
  Produit produit;
   DisplayProduitWidget({this.produit});

  @override
  _DisplayProduitWidgetState createState() => _DisplayProduitWidgetState();
}

class _DisplayProduitWidgetState extends State<DisplayProduitWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Trailing"),
        SizedBox(height: 20),
        Container(
          width: 100,
          height: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.produit.couleur,
            
          ),
          child: Text(widget.produit.name)
        ),
      ],
    );
  }
}
