import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';

class LawScreen extends StatefulWidget {
  Island myIsland;

  LawScreen({required this.myIsland, Key? key}) : super(key: key);

  @override
  _LawScreenState createState() => _LawScreenState(myIsland);
}

class _LawScreenState extends State<LawScreen> {
  Island myIsland;

  _LawScreenState(this.myIsland);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Budget actuel : ${myIsland.islandBudget} €",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: getLawListView(myIsland),
      ),
    );
  }
  Widget getLawListView(Island playerIsland) {
    var lawListView = ListView.builder(
        itemCount: playerIsland.islandLaws.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playerIsland.islandLaws[index].lawName),
            subtitle: Text(playerIsland.islandLaws[index].lawContent),
            trailing: Text("${playerIsland.islandLaws[index].lawPrice} €"),
            onTap: playerIsland.islandLaws[index].isPassed ? null : () {
              setState(() {
                playerIsland.islandLaws[index].passLaw(playerIsland);
              });
              debugPrint("${playerIsland.islandLaws[index].lawName} tapped !"
                  "Budget restant : $playerIsland.islandBudget");
            },
          );
        });
    return lawListView;
  }
}
