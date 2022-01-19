import 'package:flutter/material.dart';
import 'package:shopping_app_home_work/models/model_ingredient.dart';

class IngredientProvider with ChangeNotifier {
  List<Ingredient> _inList = [
    Ingredient(
        id: "1",
        categorie:[
          "images/ingredients/ail.jpg",
          "images/ingredients/arachide.jpg",
          "images/ingredients/ail.jpg",
        ],
         couleur: Color(0XFFffcc7e), 
         palmares: 3.5, 
        ),
        
  ];
}
