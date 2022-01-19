import 'package:flutter/foundation.dart';
import 'package:nan_info/models/model_news.dart';
import 'package:http/http.dart' as http;

class NewProvider with ChangeNotifier {
  final List<News> _items = [
    News(
        id: "m1",
        categories: "c2",
        title: "Ajax star Haller takes to Champions League in style",
        picture: "https://s.hs-data.com/picmon/1a/3DmJ_b03xpk_s.jpg",
        description: "",
        date_publication: DateTime.now()),
    News(
        id: "m2",
        categories: "c2",
        title: "Kane stuck in 'smashed' Spurs spiral",
        picture: "https://s.hs-data.com/picmon/2d/3DmH_4d3xpi_s.jpg",
        description: "",
        date_publication: DateTime.now()),

        
    News(
        id: "m3",
        categories: "c1",
        title: "Culture et éducation",
        picture: "https://s.hs-data.com/picmon/1a/3DmJ_b03xpk_s.jpg",
        description: "",
        date_publication: DateTime.now()),
    News(
        id: "m4",
        categories: "c1",
        title: "Culture et éducation",
        picture: "https://s.hs-data.com/picmon/2d/3DmH_4d3xpi_s.jpg",
        description: "",
        date_publication: DateTime.now())
  ];

 List<News> get items {
    return [..._items];
  }

}
