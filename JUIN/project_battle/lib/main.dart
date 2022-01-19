
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:project_battle/providers/article_provider.dart';
import 'package:project_battle/providers/cart_provider.dart';
import 'package:project_battle/providers/commande_provider.dart';
import 'package:project_battle/providers/shoes_provider.dart';
import 'package:project_battle/screens/bottom_bar.dart';
import 'package:project_battle/screens/detail_article_screen.dart';
import 'package:project_battle/screens/home_page.dart';
import 'package:project_battle/screens/orders_article_screen.dart';
import 'package:project_battle/screens/product_cart_screen.dart';
import 'package:project_battle/widgets/caroussel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (cxt) =>ShoesProvider()),
        ChangeNotifierProvider(create: (cxt) => CartProvider()),
        ChangeNotifierProvider(create: (cxt) => OrdersProvider()),
        ChangeNotifierProvider(create: (cxt) => MaillotProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
       initialRoute: "/",
       routes: {
         "/": (cxt) => HopePage(),
         HomePageScreen.routeName: (cxt) => HomePageScreen(),
         DetailArticleScreen.routeName: (cxt) => DetailArticleScreen(),
         ProductCartScreen.routeName : (cxt) => ProductCartScreen(),
         OrdersScreen.routeName : (cxt) => OrdersScreen(),
         BottomBarScreen.routeName : (cxt) => BottomBarScreen(),
       },
      ),
    );
  }
}


