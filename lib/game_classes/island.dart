import 'package:whatcomesnext_proto/game_classes/actor.dart';
import 'package:whatcomesnext_proto/game_classes/population.dart';

import 'law.dart';

class Island {
  final String _islandName;
  int _islandBudget;
  Population _islandPopu;
  List<Law> islandLaws = [];
  List<Actor> islandActors = [];

  //define all starting island below
  Island.testIsland()
      : _islandName = "Mon île test",
        _islandBudget = 1000,
        _islandPopu = Population(
          baseAwareness: 0.0,
          basePubOpinion: 0.0,
        ) {
    islandLaws.add(Law.testLaw());
    islandActors.add(Actor.testActor());
  }

// getter and setter

  String get name => _islandName;

  int get budget => _islandBudget;

  set budget(int value) {
    _islandBudget = value;
  }
}
