import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nan_news/http_data_source/http_global_source.dart';
import 'package:nan_news/models/new_category_model.dart';
import 'package:nan_news/models/news_model.dart';
import 'package:nan_news/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  // String loadingMessage = "Veuillez patienter s'il vous plaît ...";

  TabController _tabController;
  var _topHeadlines;
  List<String> categorys = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];

  List<dynamic> _category = [];

  var _categoryI = [];

  getArticleList() async {
    await httpGlobalDatasource.getArticles().then((response) {
      setState(() {
        _category = response;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    //getArticleList();

    getcategoryItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(_category.length);

    print(_categoryI.length);
    print("==========Info==========");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('NaN News'),
        ),
        body: ListView.builder(
            itemCount: _categoryI.length,
            itemBuilder: (cxt, i) {
              return Column(
                children: [
                  AppBar()
                ],
              );
            }));
  }

  void getcategoryItems() async {
    try {
      var response = await Dio(
        BaseOptions(headers: {"Content-Type": "application/json"}),
      ).get('http://nannews.herokuapp.com/api/category/?format=json');
      _categoryI = response.data["results"] as List;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
