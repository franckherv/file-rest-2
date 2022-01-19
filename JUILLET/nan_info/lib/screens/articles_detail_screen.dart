import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nan_info/http_data_source/http_global_data_source.dart';
import 'package:nan_info/models/article_model.dart';
import 'package:nan_info/models/category_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDeatailScreen extends StatefulWidget {
  final CategoryArticle article;
  ArticlesDeatailScreen({@required this.article});

  @override
  _ArticlesDeatailScreenState createState() => _ArticlesDeatailScreenState();
}

class _ArticlesDeatailScreenState extends State<ArticlesDeatailScreen> {
  HttpGlobalDatasource httpGlobalDatasource = HttpGlobalDatasource();

  ArticleModel articleData;

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  getSingleArticleList() async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.red
      ..maskColor = Colors.red
      ..userInteractions = false;
    await EasyLoading.show(status: "Chargement en cours ...");
    await httpGlobalDatasource
        .getSingleArticle(articleId: widget.article.id)
        .then((response) async {
      setState(() {
        articleData = response;
        print("${response.description} ==============");
      });
      await EasyLoading.dismiss();
    }).catchError((err) async {
      await EasyLoading.dismiss();
    });
  }

  @override
  void initState() {
    getSingleArticleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //centerTitle: true,
        //title: Text("Détails"),
      ),
      body: articleData == null
          ? Container()
          : ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                          image: NetworkImage(articleData.picture),
                          fit: BoxFit.cover)),
                ),
                //const SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      //padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      //height: 50,

                      color: Colors.black,
                      child: FittedBox(
                        child: Text(
                          articleData.category.name.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        articleData.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      Html(
                        data: articleData.description,
                        style: {
                          "body": Style(
                            fontSize: const FontSize(18.0),
                            //fontWeight: FontWeight.bold,
                          ),
                        },
                      ),
//===================== A revoir  ==============================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: FittedBox(
                                    child: Chip(
                                        backgroundColor: Colors.red,
                                        label: Text(
                                          "Voir aussi",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                              )),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                                onTap: () {
                                  var url = articleData.source.link;
                                  launchURL(url);
                                },
                                child: Text(articleData.source.link,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                /*  articleData == null
              ? Container()
              : Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                          image: NetworkImage(articleData.picture),
                          fit: BoxFit.cover)),
                ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: articleData == null
                ? Container()
                : Container(

                    /// height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView(
                    children: [
                      Html(
                        data: "${articleData.description}",
                        style: {
                          "body": Style(
                            fontSize: FontSize(18.0),
                            //fontWeight: FontWeight.bold,
                          ),
                        },
                      ),
                      //Text("${articleData.description}", style: TextStyle(fontSize: 18),),
                    ],
                  )),
          ), */
              ],
            ),
    );
  }
}
