import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/provider_panier.dart';
import './providers/provider_product.dart';
import './screens/details_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProviders()),
        ChangeNotifierProvider(create: (context) => Articles()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => HomePage(),
          DetailScreenPage.routeName:(context) => DetailScreenPage(),
        },
      ),
    );
  }
}
