import 'package:flutter/cupertino.dart';
import '../models/model_article_panier.dart';

class Articles with ChangeNotifier {
  Map<String, ArticlePanier> _panierArticle = {};

  Map<String, ArticlePanier> get panierArticl => {..._panierArticle};

  void addArticleInPanier(
      {String productId, String img, double prix, String title}) {
    var found = _panierArticle.containsKey(productId);
    if (found) {
      _panierArticle.update(
          productId.toString(),
          (value) => ArticlePanier(value.id, value.productId, value.title,
              value.price, value.image, value.quantity++));
    } else {
      _panierArticle.putIfAbsent(
          productId.toString(),
          () => ArticlePanier(DateTime.now().minute, productId.toString(),
              title, prix, img, 1));
    }
    notifyListeners();
  }
}
