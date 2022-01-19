class Team {
  final String id;
  final String league;
  final String logo;

  const Team({this.id, this.league, this.logo});
}

class Club {
  final String id;
  final String name;
  final String drapeau;
  final String maillot;
  final int price;

  const Club({this.id, this.name, this.drapeau, this.maillot, this.price});
}
