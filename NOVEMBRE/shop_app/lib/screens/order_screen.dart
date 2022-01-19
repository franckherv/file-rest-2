import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/widgets/drawer_menu.dart';
import 'package:shop_app/widgets/order_widget.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = "/orders-screnn";
  const OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF98DDFF),
        elevation: 0,
        title: const Text("Mes commandes"),
      ),
      drawer: const DrawerMenu(),
      body:  Consumer<OrdersProviders>(
      builder: (context, product, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: product.orders.length,
          itemBuilder: (context, i) =>  OrdersItems(
            productOrder: product.orders[i],
          )
          );
      },
    ),
    );
  }
}
