

class Tache {
  final String name;
  bool isDone;

  Tache({this.name, this.isDone = false});

  void tasksFon() {
    isDone = !isDone;
  }
}
