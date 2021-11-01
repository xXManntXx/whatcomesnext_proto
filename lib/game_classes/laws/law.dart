import 'package:flutter/cupertino.dart';
import 'package:whatcomesnext_proto/game_classes/island.dart';

abstract class Law {
  String _lawName;
  final int _lawPrice;
  final String _lawContent;
  bool _isPassed = false;

  Law({required String name, required int price, required String content}):
  _lawName = name,
  _lawPrice = price,
  _lawContent = content;

  //METHOD
  //need to be overridden by extended class
  @mustCallSuper
  void passLaw(Island myIsland) {
    myIsland.budget -= _lawPrice;
    _isPassed = true;
    _lawName = "[VOTÉ] $_lawName";
    debugPrint("Loi voté");
  }

  //GETTER AND SETTER
  String get name => _lawName;

  bool get isPassed => _isPassed;

  set isPassed(bool value) {
    _isPassed = value;
  }

  int get price => _lawPrice;

  String get content => _lawContent;
}
