import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_home_work/models/model_produit.dart';
import 'package:shopping_app_home_work/providers/provider_produit.dart';

import 'display_produit_widget.dart';

class DetailBookingScreen extends StatefulWidget {
  static const routeName = "/lisview-screen";

  @override
  _DetailBookingScreenState createState() => _DetailBookingScreenState();
}

class _DetailBookingScreenState extends State<DetailBookingScreen>
    with TickerProviderStateMixin {
  AppBar appBar;

  Produit bookingDetail;

  TabController _cartegoriesTabController;
  List subTableElements = [];

  List<Produit> productsData = [];

  @override
  Widget build(BuildContext context) {
    productsData = Provider.of<ProductProviders>(context).items;

    if (productsData != null &&
        productsData.length > 0 &&
        productsData.length > 0) {
      if (subTableElements.length < productsData.length) {
        setState(() {
          for (var index = 0; index < productsData.length; index++) {
            subTableElements.add({
              "label": productsData[index].pays,
              "icon": productsData[index].icon,
              "produit": productsData[index],
            });
          }

          _cartegoriesTabController =
              TabController(length: subTableElements.length, vsync: this)
                ..addListener(() {
                  setState(() {});
                });
        });
      }
    }

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Container(),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Détails de la réservation"),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: appBar,
                body: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Column(
                        children: <Widget>[
                          PreferredSize(
                            child: Container(
                              child: Center(
                                child: TabBar(
                                  isScrollable: true,
                                  indicatorColor: Colors.transparent,
                                  indicatorWeight: 0.1,
                                  labelColor: Colors.blueAccent,
                                  unselectedLabelColor: Colors.black54,
                                  controller: _cartegoriesTabController,
                                  labelStyle: TextStyle(
                                      fontFamily: 'MontserratBold',
                                      fontSize: 14.0,
                                      color: Colors.black),
                                  tabs: List<Widget>.generate(
                                      subTableElements.length, (int index) {
                                    return Tab(
                                      child: Column(
                                        children: [
                                          Icon(
                                            subTableElements[index]['icon'],
                                          ),
                                          Text(
                                            subTableElements[index]['label'],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            preferredSize: Size(50, 50),
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: _cartegoriesTabController,
                            physics: NeverScrollableScrollPhysics(),
                            children: List<Widget>.generate(
                                subTableElements.length, (int tabIndex) {
                              return DisplayProduitWidget(
                                produit: subTableElements[tabIndex]['produit'],
                              );
                            }),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
