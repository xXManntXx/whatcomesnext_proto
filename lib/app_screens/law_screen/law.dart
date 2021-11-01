import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';

class Law {
  String lawName;
  int lawPrice;
  String lawContent;
  bool isPassed = false;

  Law(
      {required this.lawName, required this.lawPrice, required this.lawContent, });

  Law.testLaw()
      : lawName = "Ma loi test",
        lawPrice = 300,
        lawContent = "Ceci est une loi qu'il faut respecter.";

  void passLaw(Island myIsland){
    myIsland.islandBudget-=lawPrice;
    isPassed=true;
  }
}
