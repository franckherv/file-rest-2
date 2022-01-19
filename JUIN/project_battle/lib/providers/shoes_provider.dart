import 'package:flutter/material.dart';
import 'package:project_battle/models/shoes_model.dart';

class ShoesProvider with ChangeNotifier {
  List<Shoes> _items = [
    Shoes(
      id: "1",
      name: "Nike",
      price: 3000,
      image: "images/shoes1.webp",
      size: 40,
      detail: [
        "1 pair à 3000 F",
        "10 pairs à 29000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "2",
      name: "Adidas",
      price: 3500,
      image: "images/shoes2.webp",
      size: 40,
      detail: [
        "1 pair à 3500 F",
        "10 pairs à 33000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "3",
      name: "chaussure",
      price: 2500,
      image: "assets/chaussure1.jpeg",
      size: 40,
      detail: [
        "1 pair à 2500 F",
        "10 pairs à 23000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "4",
      name: "chaussure",
      price: 2500,
      image: "assets/chaussure2.jpeg",
      size: 40,
      detail: [
        "1 pair à 2500 F",
        "10 pairs à 24000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "5",
      name: "chaussure",
      price: 4000,
      image: "assets/chaussure3.jpeg",
      size: 40,
      detail: [
        "1 pair à 4000 F",
        "10 pairs à 40000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "6",
      name: "chaussure",
      price: 8500,
      image: "assets/chaussure4.jpg",
      size: 40,
      detail: [
        "1 pair à 8500 F",
        "10 pairs à 85000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "7",
      name: "chaussure",
      price: 8500,
      image: "assets/chaussure5.jpeg",
      size: 40,
      detail: [
        "1 pair à 8500 F",
        "10 pairs à 85000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
    Shoes(
      id: "7",
      name: "chaussure.jpg",
      price: 8500,
      image: "assets/chaussure6.jpeg",
      size: 40,
      detail: [
        "1 pair à 8500 F",
        "10 pairs à 85000 F",
        "1 pair offerte après 10 achetées",
      ],
    ),
  ];

  List<Shoes> _favoris = [];

  List<Shoes> get favoris => [..._favoris];

  List<Shoes> get items {
    return [..._items];
  }
  
  void toggleIsFavoris(Shoes like) {
    var showMe = _favoris.indexOf(like);
    if (showMe >= 0) {
      _favoris.removeAt(showMe);
    } else {
      _favoris.add(like);
    }
    notifyListeners();
  }
}
