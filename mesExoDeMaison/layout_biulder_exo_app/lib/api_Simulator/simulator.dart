import 'package:layout_biulder_exo_app/models/user_data.dart';

List<Map> userList() {
  return [
    {
      "nom": "Olivier",
      "profession": "Plombier \n 05 09 54 65 76",
      "quartier": "maroc",
    },
    {
      "nom": "Orelle",
      "profession": "Coiffeuse",
      "quartier": "ananeraie",
    },
    {
      "nom": "Lazar",
      "profession": "Electricien",
      "quartier": "maroc",
    },
    {
     "nom": "Angeo",
     "profession": "Coiffeuse",
     "quartier": "maroc",
    },
    {
    "nom": "Diallo",
    "profession": "Couturier ambulant",
    "quartier": "maroc",
    },
    {
    "nom": "Bilé",
    "profession": "Plombier",
    "quartier": "Gesco",
    },
    {
    "nom": "Pierre Oliier",
    "profession": "Maçon",
    "quartier": "selmer",
    },
    {
    "nom": "Dibi",
    "profession": "Réparateur radio et télé",
    "quartier": "maroc",
    },
    {
    "nom": "Allah",
    "profession": "Réparateur radio et télé",
    "quartier": "maroc",
    },
  ];
}

class ApiSimulator {
  List<UserModel> getUserJon({bool fake: false}) {
    if (fake) {
      return userList().map((e) => UserModel.fromJson(e)).toList();
    }
  }
}
