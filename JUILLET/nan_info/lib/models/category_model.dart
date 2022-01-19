
class CategoryModel {
    CategoryModel({
        this.id,
        this.name,
        this.categoryArticle,
    });

    int id;
    String name;
    List<CategoryArticle> categoryArticle;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
        this.picture,
        this.description,
    });

    int id;
    String title;
    String datePublication;
    String picture;
    String description;

    factory CategoryArticle.fromJson(Map<String, dynamic> json) => CategoryArticle(
        id: json["id"],
        title: json["title"],
        datePublication: json["date_publication"],
        picture: json["picture"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date_publication": datePublication,
        "picture": picture,
        "description": description,
    };
}


/*class CategoryArticle {
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
} */
