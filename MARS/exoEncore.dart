void main(List<String> args) {
  print("=============================================================");

  Employee bob = Employee("BNET", "Bob");
  Person x = Person("Oli");

  x.display();

  bob.display();
}

class Person {
  String name;

  Person(this.name);
  void display() {
    print("Nom de l'employer est : $name");
  }
}




class Employee extends Person {
  String compagny;

  Employee(this.compagny, String name) : super(name);

  void display() {
    print("compagnie : $compagny");
    print("nom de l'employée : $name");
  }
}
