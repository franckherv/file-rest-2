import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  Cart({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItem = {};

  Map<String, Cart> get cartItem => {..._cartItem};

  void addPanier(String productId, String nom, String image, double prix) {
    bool cartKey = _cartItem.containsKey(productId);
    if (cartKey) {
      _cartItem.update(
          productId,
          (value) => Cart(
              id: value.id,
              name: value.name,
              imageUrl: value.imageUrl,
              price: value.price,
              quantity: value.quantity + 1));
    } else {
      _cartItem.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              name: nom,
              imageUrl: image,
              price: prix,
              quantity: 1));
    }
    notifyListeners();
  }

  double get totalCount {
    var total = 0.0;

    _cartItem.forEach((key, productTotal) {
      total += productTotal.price * productTotal.quantity;
    });

    return total;
  }

  void removeItem(String productID) {
    _cartItem.remove(productID);
    notifyListeners();
  }

  void clear() {
    _cartItem = {};
    notifyListeners();
  }
}
