List posts = [
  {
    "userId": 1,
    "id": 1,
    "title": "Remercions le bon Dieu",
    "body":
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body":
        "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  },
  {
    "userId": 1,
    "id": 3,
    "title": "hello word",
    "body":
        "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
  },
  {
    "userId": 1,
    "id": 4,
    "title": "eum et est occaecati",
    "body":
        "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
  },
  {
    "userId": 1,
    "id": 5,
    "title": "nesciunt quas odio",
    "body":
        "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
  },
];



main(List<String> args) {
  

  // var text = posts[0]['title'];

  // print(text);

  posts.forEach((element) {
    print(element['title']);
  });

  final result = Student(2, 'Henri');
  result.sleep();
  result.eat();
  print('=========================> Ternaire');

  int x = 7;
  int y = 9;

  int numnre = x > y ? x : y;
  print(numnre);

  int age = 100;

  var text = age;

  print(text);

  Jour etat = Jour.matin;

  switch (etat) {
    case Jour.matin:
      print('Il fait jour');
      break;
    case Jour.nuit:
      print('Il fait nuit');
      break;
    default:
      print('');
  }

  print('=========================> fonction <=============');
  var xy = dfrgs(2, 4);
  print("J'ai eu $xy");

  fonctun(4, 5);


  var count = -10;

  try {
    if (count < 0) {
      throw new DepotExeptionName();
    }
  } catch (e) {
    
  }

  print('----------------------List');
  // Method 2: JE CREER UN TABLEAU VIDE PUIS J'AJOUTE ENSUITE DES DONNEES
  

}

class DepotExeptionName implements Exception {
  String errorMessage() {
    return " Désolé le montant doit être suppérieur à 0";
  }
}

// fonction avec parametre obligatoire

void fonctun(int long, int larg) {
  var result = larg + long;

  print('Le résultat 1 est $result');
}

// fonction avec parametre optionnelle


// fonction qui retourne une valeur

int dfrgs(int x, int y) {
  int param = x + y;
  return param;
}

enum Jour { matin, nuit }

class Student {
  int id = 1;
  String name;

  Student(this.id, this.name);

  void sleep() {
    print('${this.name} dort losqu\'il revient du boulot');
  }

  void eat() {
    print('l\'id: ${this.id} dort losqu\'il revient du boulot');
  }
}
