// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:project_battle/screens/bottom_bar.dart';


class HopePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageCaroussel = Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Carousel(
        images: [
          AssetImage("assets/otr4.jpeg"),
          AssetImage("images/carou1.webp"),
          AssetImage("assets/otr2.jpg"),
          AssetImage("images/carou2.webp"),
          AssetImage("images/carou3.png"),
          AssetImage("images/carou4.webp"),
          AssetImage("assets/otr1.jpg"),
          
          AssetImage("assets/otr3.jpeg"),
          
        ],
        boxFit: BoxFit.contain,
    dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.white,
    indicatorBgPadding: 8.0,
    dotBgColor: Colors.teal.withOpacity(0.5),
    borderRadius: true,
      ),
    );
    return Scaffold(
      
      body: Column(
        
        children: [
          imageCaroussel,
          SizedBox(height: 20,),
          Text(
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 20,),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_right_rounded,
                size: 50,
                color: Colors.white
              ),
              onPressed: () {
                Navigator.pushNamed(context, BottomBarScreen.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
