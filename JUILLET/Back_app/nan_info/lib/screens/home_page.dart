import 'package:flutter/material.dart';
import 'package:nan_info/widgets/card_list.dart';
import 'package:nan_info/widgets/guille_app.dart';

class GuilleApp extends StatelessWidget {
  final String url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS80VJR4jJXEOrDUBV1_vHMord7JrtwL3xwMOrBffPMvPoduDR3&usqp=CAU";

  const GuilleApp({Key key}) : super(key: key);
  //////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        fit: StackFit.loose,
        children: [
           CardList(),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.deepPurple.withOpacity(0.5),
                          BlendMode.darken))),
              height: 150,
              child: const Center(
                child: Text(
                  "NaN news",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}