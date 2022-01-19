import '../providers/cart_provider.dart';
import 'package:flutter/foundation.dart';

class Orders {
  final String id;
  final double total;
  final List<Cart> cartArticle;
  final DateTime date;

  Orders(
      {required this.id,
      required this.total,
      required this.cartArticle,
      required this.date});
}

class OrdersProvider with ChangeNotifier {
  List<Orders> _orders = [];

  List<Orders> get orders => [..._orders];

  void addOrder(List<Cart> cartProduct, double amount) {
    _orders.insert(
      0,
      Orders(
          id: DateTime.now().toString(),
          total: amount,
          cartArticle: cartProduct,
          date: DateTime.now()),
    );
    notifyListeners();
  }
}
