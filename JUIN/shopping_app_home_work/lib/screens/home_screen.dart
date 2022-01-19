import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_home_work/screens/listviewReview.dart';

import '../providers/provider_produit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProviders>(context).items;
    return Scaffold(
      backgroundColor: Color(0XFF0b8457),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            DetailBookingScreen.routeName,
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 60),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30))),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 40, fontFamily: "DancingScript"),
                        ),
                        Text("for recipes",
                            style: TextStyle(
                              fontSize: 25,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .6,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.grey[400],
                                hintText: 'Search'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .6,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Colors.red,
                                hintText: 'Search'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Color(0XFF0b8457),
              ))
        ],
      ),
    );
  }
}
