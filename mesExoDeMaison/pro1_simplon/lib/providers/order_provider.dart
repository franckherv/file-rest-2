import 'package:flutter/foundation.dart';
import '../models/cart_model.dart';
import '../models/order_model.dart';

class OrdersPro with ChangeNotifier {
  List<Orders> _order = [];

  List<Orders> get orders {
    return [..._order];
  }

  void addInTheOrdersScreen(List<Cart>product, total) {
    _order.insert(
        0,
        Orders(
            id: DateTime.now().toString(),
            amount: total,
            productList: product,
            dateTime: DateTime.now(),
            ));

    notifyListeners();
  }
}
