import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class ProductPro with ChangeNotifier {
  List<Products> _items = [
    Products(
        id: 'p1',
        title: 'Peugeot',
        description: 'Oli vherc gtret oljt',
        price: 29.99,
        imageUrl: "images/1.jpg"
        //imageUrl: 'https://cdn.pixabay.com/photo/2015/09/02/12/25/bmw-918408__480.jpg'
        ),
    Products(
        id: 'p2',
        title: 'Mercedes',
        description: 'For good healthy use this cardio velo.',
        price: 59.99,
        imageUrl: "images/2.webp"
        //imageUrl: 'https://cdn.pixabay.com/photo/2017/03/05/15/29/aston-martin-2118857__480.jpg',
        ),
    Products(
      id: 'p3',
      title: 'ford',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: "images/3.jpg",
    ),
    Products(
        id: 'p4',
        title: 'djeep',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl: "images/4.webp"
        // imageUrl: 'https://cdn.pixabay.com/photo/2013/07/13/11/50/car-158795__480.png',
        ),
    Products(
        id: 'p5',
        title: 'huDaï',
        description: 'buy your tenis online its very easy.',
        price: 49.99,
        imageUrl: "images/5.webp"
        //imageUrl: 'https://cdn.pixabay.com/photo/2016/12/03/18/57/car-1880381__480.jpg',
        ),
  ];

  // get addFavoris {
  //   _items.where((element) => element.isFavorite).toList();
  // }

  void addProduct(Products productID) {
    // _items.add(value)
    notifyListeners();
  }

  List<Products> get items {
    return [..._items];
  }
}
