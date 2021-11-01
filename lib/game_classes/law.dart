import 'package:whatcomesnext_proto/game_classes/island.dart';

class Law {
  String _lawName;
  final int _lawPrice;
  final String _lawContent;
  bool _isPassed = false;

  //define all possible law below
  Law.testLaw()
      : _lawName = "Ma loi test",
        _lawPrice = 300,
        _lawContent = "Ceci est une loi qu'il faut respecter.";

  void passLaw(Island myIsland){
    myIsland.budget-=_lawPrice;
    _isPassed=true;
    _lawName = "[VOTÉ] $_lawName";
  }

  String get name => _lawName; //getter and setter

  bool get isPassed => _isPassed;

  set isPassed(bool value) {
    _isPassed = value;
  }

  int get price => _lawPrice;

  String get content => _lawContent;
}
