import 'package:flutter/foundation.dart';

class Chair with ChangeNotifier {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final int price;
  bool isFavorite;

  Chair({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.description,
    @required this.price,
    this.isFavorite = false,
  });

  void toggleproductStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
