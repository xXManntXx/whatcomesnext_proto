import 'package:flutter/material.dart';

import '../law_screen/law.dart';

class Island {
  String islandName;
  int islandBudget;
  List<Law> islandLaws = [];

  Island({required this.islandName, required this.islandBudget});

  //define all starting island below
  Island.testIsland()
      : islandName = "Mon île test",
        islandBudget = 1000 {
    islandLaws.add(Law.testLaw());
  }

  Widget getLawListView() {
    var lawListView = ListView.builder(
        itemCount: islandLaws.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(islandLaws[index].lawName),
            subtitle: Text(islandLaws[index].lawContent),
          );
        });
    return lawListView;
  }
}
