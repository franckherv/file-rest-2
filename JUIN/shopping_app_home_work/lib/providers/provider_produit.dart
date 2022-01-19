import 'package:flutter/material.dart';
import '../models/model_produit.dart';

class ProductProviders with ChangeNotifier {
  List<Produit> _items = [
    Produit(
      id: "1",
      name: "Plat de riz",
      palmares: 3.5,
      pays: "Mali",
      couleur: Color(0XFFffcc7e),
      icon: Icons.restaurant_menu,
      imagesUrl: "images/plats/platderiz.jpg",
    ),
    Produit(
      id: "2",
      name: "Petit poids choco",
      palmares: 6.5,
      pays: "Sénégal",
      couleur: Color(0XFFe8d9db),
      icon: Icons.restaurant,
      imagesUrl: "images/plats/platdepetitplat.jpg",
    ),
    Produit(
      id: "3",
      name: "Sauce gombo",
      palmares: 8.5,
      pays: "Côte d'Ivoire",
      couleur: Color(0XFFd9e8e5),
      icon: Icons.restaurant_menu_sharp,
      imagesUrl: "images/plats/platgombo.jpg",
    ),
      Produit(
      id: "4",
      name: "Spaghetti de Diallo",
      palmares: 5,
      pays: "Guinée",
      couleur: Color(0XFFc5a4a9),
      icon: Icons.flight,
      imagesUrl: "images/plats/platspaguetti.jpg",
    ),
  ];
  List<Produit> get items => [..._items];
}
