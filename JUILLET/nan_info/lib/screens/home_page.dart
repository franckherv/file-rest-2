import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nan_info/http_data_source/http_global_data_source.dart';
import 'package:nan_info/models/category_model.dart';

import 'package:nan_info/widgets/service_categorie_page_view.dart';
import 'package:nan_info/widgets/tous_service_page_view.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:yvo_resp_api_learning/http_data_source/Http_Global_Data_source.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  String loadingMessage = "Veuillez patienter s'il vous plaît ...";

  List<CategoryModel> _categoryList = [];

  TabController _cartegoriesTabController;
  List subTableElements = [];

  getNewList() async {
    await EasyLoading.show(
        status: "Chargement en cours ...",
        indicator: Container(color: Colors.redAccent));
    await httpGlobalDatasource.getCategoryList().then((response) async {
      setState(() {
        _categoryList = response;
        subTableElements.add({
          "label": "Tous",
          "categories": _categoryList,
        });

        for (var index = 0; index < _categoryList.length; index++) {
          if (_categoryList[index].categoryArticle.length > 0) {
            subTableElements.add({
              "label": _categoryList[index].name,
              "categories": _categoryList[index].categoryArticle,
            });
          }
        }

        _cartegoriesTabController =
            TabController(length: subTableElements.length, vsync: this)
              ..addListener(() {
                setState(() {});
              });
      });
      await EasyLoading.dismiss();
    }).catchError((err) async {
      await EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    getNewList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("note ======${_categoryList.length}=======");
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    expandedHeight: 150.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: RichText(
                        text: const TextSpan(
                            text: 'NaN ',
                            style: TextStyle(
                              color: Color(0xFF00CCFF),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'news',
                                style: TextStyle(
                                  color: Color(0xFFFD1B1B),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
                      ),
                      background: Image.asset(
                        "images/1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ];
              },
              body: _categoryList.isNotEmpty
                  ? Column(
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFD1B1B),
                                  Color(0xFF00CCFF),
                                ],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Center(
                            child: TabBar(
                              isScrollable: true,
                              indicatorColor: Colors.transparent,
                              indicatorWeight: 0.1,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black54,
                              controller: _cartegoriesTabController,
                              labelStyle: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              tabs: List<Widget>.generate(
                                  subTableElements.length, (int index) {
                                return Tab(
                                  child: Text(
                                    subTableElements[index]['label'],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _cartegoriesTabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List<Widget>.generate(
                                subTableElements.length, (int tabIndex) {
                              if (subTableElements[tabIndex]['label'] ==
                                  "Tous") {
                                return TousServicePageView(
                                  serviceItem: subTableElements[tabIndex]
                                      ['categories'],
                                );
                              } else {
                                return ServiceCategoriePageView(
                                    produits: subTableElements[tabIndex]
                                        ['categories']);
                              }
                            }),
                          ),
                        ),
                      ],
                    )
                  : Container())),
    );
  }
}
