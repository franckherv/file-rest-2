import 'package:flutter/material.dart';
import '../providers/commande_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/shop_orders";
  @override
  Widget build(BuildContext context) {
    final articleCart = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Commandes"),
      ),
      body: ListView.builder(
          itemCount: articleCart.orders.length,
          itemBuilder: (cxt, i) => Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("${articleCart.orders[i].total}"),
                      subtitle: Text(DateFormat("dd MM yyyy hh:mm")
                          .format(articleCart.orders[i].date)),
                      trailing: IconButton(
                          icon: Icon(Icons.expand_more), onPressed: () {}),
                    )
                  ],
                ),
              )),
    );
  }
}
