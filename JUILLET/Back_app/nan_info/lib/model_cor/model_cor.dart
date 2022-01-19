// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.id,
        this.name,
        this.categoryArticle,
    });

    int id;
    String name;
    List<CategoryArticle> categoryArticle;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        categoryArticle: List<CategoryArticle>.from(json["category_article"].map((x) => CategoryArticle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_article": List<dynamic>.from(categoryArticle.map((x) => x.toJson())),
    };
}

class CategoryArticle {
    CategoryArticle({
        this.id,
        this.title,
        this.datePublication,
    });

    int id;
    String title;
    String datePublication;

    factory CategoryArticle.fromJson(Map<String, dynamic> json) => CategoryArticle(
        id: json["id"],
        title: json["title"],
        datePublication: json["date_publication"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date_publication": datePublication,
    };
}
