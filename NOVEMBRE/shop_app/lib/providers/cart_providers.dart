import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final int price;
  final String image;
  final int quantity;

  Cart(
      {@required this.id,
       @required this.title,
       @required this.price,
       @required this.image,
       @required this.quantity});
}

class CartProviders with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItems {
    return {..._cartItems};
  }

  int get totalArticlePrice {
    var total = 00;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // ================= code use ===================
  
   
  bool checkProductAddedToCart(productId) {
    if (_cartItems.containsKey(productId)) {
      return true;
    } else {
      return false;
    }
  }

  int numberOfProductsInSingleItem(String productId) {
    var cartItem =
        _cartItems.values.firstWhere((cartItem) => cartItem.id == productId);
    return cartItem.quantity;
  }

   void increaseNumberOfProductsInCartItem(String productId) {
    _cartItems.update(
        productId,
        (existingCartItem) => Cart(
              id: existingCartItem.id,
              
              title: existingCartItem.title,
              price: existingCartItem.price,
              image: existingCartItem.image,
              quantity: existingCartItem.quantity + 1,
            ));
    notifyListeners();
  }

  void decreaseNumberOfProductsInCartItem(String productId) {
    _cartItems.update(
        productId,
        (existingCartItem) => Cart(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              image: existingCartItem.image,
              quantity: (existingCartItem.quantity == 0)
                  ? 0
                  : existingCartItem.quantity - 1,
            ));
    notifyListeners();
  }


  //================== FIN ========================= 

  void undoItem(String productID) {
    if (!_cartItems.containsKey(productID)) {
      return;
    }

    if (_cartItems[productID].quantity > 1) {
      _cartItems.update(
          productID,
          (isPresent) => Cart(
              id: isPresent.id,
              title: isPresent.title,
              price: isPresent.price,
              image: isPresent.image,
              quantity: isPresent.quantity - 1));
    } else {
      _cartItems.remove(productID);
    }
    notifyListeners();
  }

  void addInCart(
    String productId,
    String title,
    int price,
    String image,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (value) => Cart(
                id: value.id,
                title: value.title,
                price: value.price,
                image: value.image,
                quantity: value.quantity + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              image: image,
              quantity: 1));
    }
    notifyListeners();
  }

  void delete() {
    _cartItems = {};
    notifyListeners();
  }
}
