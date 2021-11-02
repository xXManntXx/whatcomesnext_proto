import 'package:whatcomesnext_proto/game_classes/island.dart';

class Archipelago {
  List<Island> allIslands = [];
  double _oceanTemperature = 17.5;
  double _oceanPH = 8.14;
  int _worldYear = 2020; //starting date

  Archipelago();


  void add(Island newIsland) {
    allIslands.add(newIsland);
  }


  //setter and getter

  double get oceanPH => _oceanPH;

  set increasePH(double value) {
    _oceanPH += value;
  }

  double get oceanTemperature => _oceanTemperature;

  set increaseOceanT(double value) {
    _oceanTemperature += value;
  }

  int get year => _worldYear;

  set year(int value) {
    _worldYear = value;
  }

}
