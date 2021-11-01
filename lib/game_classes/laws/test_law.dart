import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/game_classes/island.dart';
import 'package:whatcomesnext_proto/game_classes/laws/law.dart';

class TestLaw extends Law {
  TestLaw()
      : super(
            name: "Ma loi test",
            price: 300,
            content: "Ceci est une loi qu'il faut respecter.");

  @override
  void passLaw(Island myIsland){
    super.passLaw(myIsland);
    debugPrint("testLoi mise en place");
  }
}
