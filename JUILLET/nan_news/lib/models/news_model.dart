
import 'new_category_model.dart';

class Source {
    int id;
    Category category;
    List<dynamic> tag;
    String title;
    String picture;
    String linkDetail;
    String description;
    String datePublication;
    String dateAdd;
    String dateUpdate;
    bool status;
    SourceClass source;

     Source({
        this.id,
        this.category,
        this.tag,
        this.title,
        this.picture,
        this.linkDetail,
        this.description,
        this.datePublication,
        this.dateAdd,
        this.dateUpdate,
        this.status,
        this.source,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        tag: List<dynamic>.from(json["tag"].map((x) => x)),
        title: json["title"],
        picture: json["picture"],
        linkDetail: json["link_detail"],
        description: json["description"],
        datePublication: json["date_publication"],
        dateAdd: json["date_add"],
        dateUpdate: json["date_update"],
        status: json["status"],
        source: SourceClass.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category.toJson(),
        "tag": List<dynamic>.from(tag.map((x) => x)),
        "title": title,
        "picture": picture,
        "link_detail": linkDetail,
        "description": description,
        "date_publication": datePublication,
        "date_add": dateAdd,
        "date_update": dateUpdate,
        "status": status,
        "source": source.toJson(),
    };
}



class SourceClass {
    SourceClass({
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

    factory SourceClass.fromJson(Map<String, dynamic> json) => SourceClass(
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
