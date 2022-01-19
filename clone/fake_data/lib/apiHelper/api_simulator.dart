import 'package:fake_data/models/model_api.dart';

class ApiSimulator {
  List<SmulatorApi> getItemData({bool fake = false}) {
    if (fake) {
      return userItemList().map((e) => SmulatorApi.fromMap(e)).toList();
    }
    return [];
  }
}

List<Map> userItemList() {
  return [
    {
      'id': '1',
      'name': "Chemise",
      "image":
          "https://i.pinimg.com/474x/06/40/3c/06403cf8cb7a9b09e5d9ee09627eabc6.jpg",
      "prix": 4000
    },
    {
      'id': '2',
      'name': "Chaussure",
      "image":
          "https://i.pinimg.com/474x/ac/50/30/ac503098918c964030f268d84ec24df3.jpg",
      "prix": 7000
    },
    {
      'id': '3',
      'name': "Fauteuil",
      "image":
          "https://i.pinimg.com/474x/bf/15/de/bf15ded23d56433893a6c6b885859f5e.jpg",
      "prix": 234000
    }
  ];
}

// List<Map> userItemList() {
//   return [
//     {
//       'id': 1,
//       'name': [2500, 23, 56],
//       'item_image': 'riz.jpg',
//       'item_name': 'Rizière',
//     },
//     {
//       'id': 2,
//       'item_price': [3500, 239, 56],
//       'item_image': 'huile.jpg',
//       'item_name': 'Huile Aya',
//     },
//     {
//       'id': 3,
//       'item_price': [2500, 53, 56],
//       'item_image': 'cahier.jpg',
//       'item_name': 'Agenda',
//     },
//     {
//       'id': 4,
//       'item_price': [250, 230, 560],
//       'item_image': 'shoes.jpg',
//       'item_name': 'All Star Asiatique',
//     },
//     {
//       'id': 5,
//       'item_price': [230, 263, 560],
//       'item_image': 'pate.jpg',
//       'item_name': 'Ori Dentiste',
//     },
//     {
//       'id': 6,
//       'item_price': [2500, 56],
//       'item_image': 'tomate.jpg',
//       'item_name': 'Ma tomate',
//     },
//   ];
// }
