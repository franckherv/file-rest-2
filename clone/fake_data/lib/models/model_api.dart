// class SmulatorApi {
//   int id;
//   String name;
//   List<int> prix;
//   String image;

//   SmulatorApi.fromJson(Map map)
//       : id = map['id'],
//         name = map['item_name'],
//         prix = List<int>.from(map["item_price"].map((x) => x)),
//         image = map['item_image'];
// }

class SmulatorApi {
  String id;
  String name;
  String image;
  int prix;
  // List<Map<String, dynamic>> description

 SmulatorApi.fromMap(Map map)
      : id = map['id'],
        name = map['name'],
        prix = map['prix'],
        image = map['image'];

  
}
