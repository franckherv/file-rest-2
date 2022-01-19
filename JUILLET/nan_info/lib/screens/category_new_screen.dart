import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nan_info/models/category_model.dart';
import 'package:nan_info/proiders/provider_cat.dart';
import 'package:nan_info/screens/articles_detail_screen.dart';
import 'package:provider/provider.dart';

class CategoryNewScreen extends StatefulWidget {
  List<CategoryArticle> categoryList;
  CategoryNewScreen({@required this.categoryList});

  @override
  _CategoryNewScreenState createState() => _CategoryNewScreenState();
}

class _CategoryNewScreenState extends State<CategoryNewScreen> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<CommonPovider>(context).getCategoryList != null &&
        widget.categoryList == null) {
      setState(() {
        widget.categoryList =
            Provider.of<CommonPovider>(context).getCategoryList;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: widget.categoryList.length,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (cxt, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ArticlesDeatailScreen(
                                    article: widget.categoryList[i],
                                  )));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: Card(
                        elevation: 5,
                        shadowColor: const Color(0xFF00CCFF),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            //color: Colors.orange[50],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white, // inner circle color
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0)),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.categoryList[i].picture,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            widget.categoryList[i].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          widget
                                              .categoryList[i].datePublication,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
