import 'package:flutter/material.dart';
import 'package:pro1_simplon/screens/order_screen.dart';
import '../providers/order_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../screens/product_dtail_screen.dart';
import './screens/product_over_view_screen.dart';
import 'package:provider/provider.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (cxt) => ProductPro()),
        ChangeNotifierProvider(create: (cxt) => CartPro()),
        ChangeNotifierProvider(create: (cxt) => OrdersPro()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
          fontFamily: "Raleway"
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (cxt) => ProductDetailScreen(),
          CartScreen.routeName: (cxt) => CartScreen(),
          OrderScreen.routeName: (cxt) => OrderScreen(),
          

        },
      ),
    );
  }
}
