import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isFavoris = false;

  Product({this.id, this.title, this.price, this.imageUrl, this.isFavoris});

  void favorisFunction() {
    isFavoris = !isFavoris;
    //notifyListeners();
  }
}


