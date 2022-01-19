import 'package:flutter/material.dart';
import 'package:pro1_simplon/models/order_model.dart';

class OrderScreenWidget extends StatelessWidget {
  final Orders ord;

  const OrderScreenWidget(this.ord);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        title: Text("${ord.amount} Fcfa")
        ),
    );
  }
}
