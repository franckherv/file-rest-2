import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_providers.dart';
import 'package:shop_app/providers/orders_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/cart_screnn.dart';
import 'package:shop_app/screens/detail_page.dart';
import 'package:shop_app/screens/product_edit_screen.dart';
import 'package:shop_app/screens/product_manage_screen.dart';
import 'package:shop_app/widgets/bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ChairProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProviders(),
        ),
        ChangeNotifierProvider.value(
          value: OrdersProviders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SharedBottomAppBar(),
        routes: {
          DetailPage.routeName: (_) => const DetailPage(),
          CartScreen.routeName: (_) => const CartScreen(),
          ProductManageScreen.routeName: (_) => const ProductManageScreen(),
          ProductEditScreen.routeName: (_) =>const ProductEditScreen()
        },
      ),
    );
  }
}
