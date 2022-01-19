


class ArticleModel {
    ArticleModel({
        this.id,
        this.category,
        this.tag,
        this.title,
        this.picture,
        this.linkDetail,
        this.description,
        this.descriptionText,
        this.slug,
        this.datePublication,
        this.dateAdd,
        this.dateUpdate,
        this.status,
        this.popular,
        this.source,
    });

    int id;
    Category category;
    List<dynamic> tag;
    String title;
    String picture;
    String linkDetail;
    String description;
    String descriptionText;
    String slug;
    String datePublication;
    String dateAdd;
    String dateUpdate;
    bool status;
    bool popular;
    Source source;

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        tag: List<dynamic>.from(json["tag"].map((x) => x)),
        title: json["title"],
        picture: json["picture"],
        linkDetail: json["link_detail"],
        description: json["description"],
        descriptionText: json["description_text"],
        slug: json["slug"],
        datePublication: json["date_publication"],
        dateAdd: json["date_add"],
        dateUpdate: json["date_update"],
        status: json["status"],
        popular: json["popular"],
        source: Source.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category.toJson(),
        "tag": List<dynamic>.from(tag.map((x) => x)),
        "title": title,
        "picture": picture,
        "link_detail": linkDetail,
        "description": description,
        "description_text": descriptionText,
        "slug": slug,
        "date_publication": datePublication,
        "date_add": dateAdd,
        "date_update": dateUpdate,
        "status": status,
        "popular": popular,
        "source": source.toJson(),
    };
}

class Category {
    Category({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Source {
    Source({
        this.id,
        this.name,
        this.link,
        this.dateAdd,
        this.dateUpdate,
        this.status,
    });

    int id;
    String name;
    String link;
    String dateAdd;
    String dateUpdate;
    bool status;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        dateAdd: json["date_add"],
        dateUpdate: json["date_update"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "date_add": dateAdd,
        "date_update": dateUpdate,
        "status": status,
    };
}
