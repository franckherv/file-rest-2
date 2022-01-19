class UserModel {
  String name;
  String djob;
  String city;

  UserModel({this.city, this.djob, this.name});

  UserModel.fromJson(Map map)
      : name = map["nom"],
        djob = map["profession"],
        city = map["quartier"];
}
