import 'package:flutter/foundation.dart';
import 'package:nan_info/models/category_model.dart';

class CommonPovider with ChangeNotifier{

  List<CategoryArticle> categoryList;


  void setCategoryList(List<CategoryArticle>  newPagination) {
    categoryList = newPagination;
    notifyListeners();
  }

  get getCategoryList {
    return categoryList;
  }
  
}