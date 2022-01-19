import 'package:flutter/foundation.dart';
import 'package:shop_app/providers/cart_providers.dart';

class Orders {
  final String id;
  final int amount;
  final List<Cart> productItem;
  final DateTime date;
  Orders({
    @required this.id,
    @required this.amount,
    @required this.productItem,
    @required this.date,
  });
}

class OrdersProviders with ChangeNotifier {
  final List<Orders> _orders = [];

  List<Orders> get orders {
    return [..._orders];
  }

  void orderProduct(List<Cart> product, int mnt) {
    _orders.insert(0, Orders(
      id: DateTime.now().toString(), 
      amount: mnt, 
      productItem: product,
      date: DateTime.now()
      ));
    notifyListeners();
  }
}
