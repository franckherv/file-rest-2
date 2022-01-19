import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/accueil.dart';
import 'package:shop_app/screens/detail_screen.dart';
import 'package:shop_app/widget/product_view_screens.dart';
import './providers/provider_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
       initialRoute: "/",
       routes: {
         "/" : (context) => ProductsViewScreen(),
         DetailShoping.routeName: (context) => DetailShoping(),
       },
      ),
    );
  }
}

