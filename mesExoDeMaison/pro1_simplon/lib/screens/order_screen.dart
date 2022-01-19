import 'package:flutter/material.dart';
import '../widgets/app_drawer_widget.dart';
import '../widgets/order_screen_widget.dart';
import '../providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/order-screen";
  @override
  Widget build(BuildContext context) {
    final productOrder = Provider.of<OrdersPro>(context, listen: false).orders;
    return Scaffold(
      drawer: DrawerAppWidget(),
      appBar: AppBar(
        title: Text("Vos commandes"),
      ),
      body: ListView.builder(
          itemCount: productOrder.length,
          itemBuilder: (cxt, i) => OrderScreenWidget(
                productOrder[i],
              )),
    );
  }
}
