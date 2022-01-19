import 'package:flutter/foundation.dart';
import '../models/cart_model.dart';

class CartPro with ChangeNotifier {
  Map<String, Cart> _cartItem = {};

  Map<String, Cart> get cartItem {
    return {..._cartItem};
  }

  void addInCart(
      String prodId, String proTitle, String imageUrl, double price) {
    if (_cartItem.containsKey(prodId)) {
      _cartItem.update(
          prodId,
          (aqs) => Cart(
              aqs.id, aqs.title, aqs.imageUrl, aqs.price, aqs.quantity + 1));
    } else {
      _cartItem.putIfAbsent(prodId,
          () => Cart(DateTime.now().toString(), proTitle, imageUrl, price, 1));
    }
    notifyListeners();
  }

  void snackVerify(String productID) {
    if (!_cartItem.containsKey(productID)) {
      return;
    }
    if (_cartItem[productID]!.quantity > 1) {
      _cartItem.update(
          productID,
          (existing) => Cart(existing.id, existing.title, existing.imageUrl,
              existing.price, existing.quantity - 1));
    } else {
      _cartItem.remove(productID);
    }
    notifyListeners();
  }

  double get totalPrice {
    var total = 0.0;
    _cartItem.forEach((key, value) {
      total = total + (value.price * value.quantity);
    });
    return total;
  }

  void removeItemtotheCartList(String productID) {
    _cartItem.remove(productID);
    notifyListeners();
  }

  void cleanCart() {
    _cartItem = {};
    notifyListeners();
  }
}
