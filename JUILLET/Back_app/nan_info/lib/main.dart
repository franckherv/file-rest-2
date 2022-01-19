import 'package:flutter/material.dart';
import 'package:nan_info/providers/new_provider.dart';
import 'package:nan_info/screens/new_detail_screen.dart';
import 'package:nan_info/screens/new_screen.dart';
import 'package:nan_info/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import 'providers/provider_category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 

  @override
  Widget build(BuildContext context) {
  

    return MultiProvider(
      // ignore: prefer_const_literals_to_create_immutables
      providers: [
        ChangeNotifierProvider(
          create: (_) => CatProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewProvider(),
        ),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData( 
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Lato',
           primaryColor: Colors.purple,
        ),
        // ignore: prefer_const_constructors
        home: TabsScreen(),
        routes: {
          NewScreen.routeName: (cxt) =>  NewScreen(),
          NewDetailScreen.routeName : (cxt) => NewDetailScreen(),
        },
      ),
    );
  }
}
