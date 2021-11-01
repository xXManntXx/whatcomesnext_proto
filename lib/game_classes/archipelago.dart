import 'package:whatcomesnext_proto/game_classes/island.dart';

class Archipelago{
  List<Island> allIslands = [];
  double _oceanTemperature = 17.5;
  double _oceanPH = 8.14;

  Archipelago();

  void add(Island newIsland){
    allIslands.add(newIsland);
  }

  double get oceanPH => _oceanPH;

  set increasePH(double value) {
    _oceanPH += value;
  }

  double get oceanTemperature => _oceanTemperature;

  set increaseOceanT(double value) {
    _oceanTemperature += value;
  }

//getter and setter


}