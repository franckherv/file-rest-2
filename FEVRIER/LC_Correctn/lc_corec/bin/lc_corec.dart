import 'class_players.dart';
import 'class_bot.dart';
import 'dart:math';

void main(List<String> arguments) {
  var bot1 = Bot_robot(force: 1, sante: 100);
  bot1.power();
}

class Bot_robot {
  int force;
  int sante;

  Bot_robot({int force, int sante});

  void power() {
    var tex = 'Mon robot n\'a plus de force';
    print(tex);
  }
}
