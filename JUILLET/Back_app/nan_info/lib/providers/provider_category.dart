import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:nan_info/models/model_category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<InfoCategory> _categoryItem = [

  /*  InfoCategory(id: 'c1', name: 'Culture & éducation'),
    InfoCategory(id: 'c2', name: 'Sport'),
    InfoCategory(id: 'c3', name: 'Sciences'),
    InfoCategory(id: 'c4', name: 'Paix & Sécurité'),
    InfoCategory(id: 'c6', name: 'Santé'),
    InfoCategory(id: 'c7', name: 'Developpement'),
    InfoCategory(id: 'c8', name: 'Droit de l\'homme')*/

  ];

  String _searchString = "";

  UnmodifiableListView<InfoCategory> get category => _searchString.isEmpty
      ? UnmodifiableListView(_categoryItem)
      : UnmodifiableListView(_categoryItem.where(
          (category) => category.name.toLowerCase().contains(_searchString)));

  void changeSearchString(String searchString) {
    _searchString = searchString;
    print(_searchString);
    notifyListeners();
  }

  Future<dynamic> fetchAndSetData() async {
    var url =
        Uri.parse('http://nannews.herokuapp.com/api/category/?format=json');

    try {
      // ignore: empty_catches
      var response = await http.get(url);
      final jsonData = json.decode(response.body);
      final List<InfoCategory> _category = [];
      if (jsonData == null) return;
      print("======$jsonData");
      jsonData.forEach((id, element) {
        _category.add(
          InfoCategory(id: id, name: element.toString()),
          );
        _categoryItem = _category;

        notifyListeners();
      });
    } catch (error) {
      throw Exception(error);
    }
  }
}
