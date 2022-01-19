import 'package:flutter/material.dart';
import '../widgets/app_drawer_widget.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_badge_widget.dart';
import '../widgets/product_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartLength = Provider.of<CartPro>(context).cartItem;
    return Scaffold(
      drawer: DrawerAppWidget(),
      appBar: AppBar(
        title: Text("Boutique en ligne"),
        actions: [
          CartBadgeWidget(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              text: cartLength.length.toString())
        ],
      ),
      body: ProductGrid(),
    );
  }
}
