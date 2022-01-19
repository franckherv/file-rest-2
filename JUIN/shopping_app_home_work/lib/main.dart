import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_home_work/screens/listviewReview.dart';
import './providers/provider_produit.dart';
import './screens/detail_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProviders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple,
      ),
      initialRoute: "/",
      routes: {
        "/" : (cxt) => HomeScreen(),
        DetailScreen.routeName: (cxt) => DetailScreen(),
        DetailBookingScreen.routeName: (cxt) => DetailBookingScreen(),
      },
      ),
    );
  }
}