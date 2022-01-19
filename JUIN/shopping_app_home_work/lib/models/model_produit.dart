import 'package:flutter/material.dart';
import 'package:shopping_app_home_work/models/model_ingredient.dart';

class Produit {
  final String id;
  final String name;
  final double palmares;
  final String pays;
  Color couleur;
  List<Ingredient> ingredients;
  IconData icon;
  final String imagesUrl;
  Produit(
      {this.id,
      this.name,
      this.palmares,
      this.pays,
      this.ingredients,
      this.couleur,
      this.icon,
      this.imagesUrl});
}
