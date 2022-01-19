import 'package:flutter/material.dart';
import 'package:project_battle/models/maillot_model.dart';

class MaillotProvider with ChangeNotifier {
  List<Artiles> _items = [
    Artiles(
      id: "1",
      name: "Côte d'ivoire",
      price: 3000,
      image: "images/ci1.webp",
      detail: [
        "1 maillot à 3000 F",
        "10 maillots à 29000 F",
        "1 maillot offerte après 10 achetés",
      ],
    ),
    Artiles(
      id: "2",
      name: "Côte d'ivoire",
      price: 3000,
      image: "images/ci2.webp",
      detail: [
        "1 maillot à 3000 F",
        "10 maillots à 29000 F",
        "1 maillot offerte après 10 achetés",
      ],
    ),
      Artiles(
      id: "3",
      name: "Barcelone",
      price: 3000,
      image: "images/bc2.webp",
      detail: [
        "1 maillot à 3000 F",
        "10 maillots à 29000 F",
        "1 maillot offerte après 10 achetés",
      ],
    ),
          Artiles(
      id: "4",
      name: "Barcelone",
      price: 3000,
      image: "images/bc3.webp",
      detail: [
        "1 maillot à 3000 F",
        "10 maillots à 29000 F",
        "1 maillot offerte après 10 achetés",
      ],
    ),

     Artiles(
      id: "5",
      name: "France",
      price: 3000,
      image: "images/france.jpeg",
      detail: [
        "1 maillot à 3000 F",
        "10 maillots à 29000 F",
        "1 maillot offerte après 10 achetés",
      ],
    ),
  ];

  List<Artiles> get items => [..._items];
}
