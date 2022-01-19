import '../models/cart_model.dart';

class Orders {
  final String id;
  final double amount;
  final List<Cart> productList;
  final DateTime dateTime;
  Orders({
    required this.id,
    required this.amount,
    required this.productList,
    required this.dateTime,
  });
}
