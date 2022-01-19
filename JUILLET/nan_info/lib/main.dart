import 'package:flutter/material.dart';
import 'package:nan_info/proiders/provider_cat.dart';
import 'package:nan_info/screens/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nan_info/screens/splash_screen.dart';
import 'package:nan_info/widgets/custom_animation.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow  
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false
      ..customAnimation = CustomAnimation();
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
      providers: [
        ChangeNotifierProvider(
        create: (_) => CommonPovider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData( 
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
             primaryColor: Colors.blue,
          ),
          // ignore: prefer_const_constructors
          home: SplashScreen(),
          builder: EasyLoading.init(),
          routes: const {
          },
        
      ),
    );
  }
}
