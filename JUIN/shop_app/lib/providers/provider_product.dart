import 'package:flutter/material.dart';
import '../models/model_shop.dart';

class ProductData with ChangeNotifier {
  
  List<Product>_items = [

     Product(
      id: 'p1',
      title: 'white Shirt',
      description: 'A white  shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'asset/images/blank.png'
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
       imageUrl: 'asset/images/jeans.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'asset/images/poel.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'asset/images/pan.jpg',
    ),
      Product(
      id: 'p5',
      title: 'shoes',
      description: 'buy your shoes online its very easy.',
      price: 49.99,
      imageUrl: 'asset/images/shoes.png',
    ),
      Product(
      id: 'p6',
      title: 'yellow Scarf',
      description: 'buy your shoes online its very easy.',
      price: 49.99,
      imageUrl: 'asset/images/image1.jpg',
    ),
  ];

  
  
  List<Product> get items  => [..._items];

  List<Product> get favoriteItems  {
    return _items.where((element) => element.isFavorite).toList();
    
  } 
}