import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/complete_appbar_widget.dart';
import 'package:whatcomesnext_proto/game_classes/archipelago.dart';
import 'package:whatcomesnext_proto/game_classes/island.dart';

class LawScreen extends StatefulWidget {
  Island myIsland;
  Archipelago myWorld;

  LawScreen({required this.myWorld, required this.myIsland, Key? key})
      : super(key: key);

  @override
  _LawScreenState createState() => _LawScreenState(myWorld, myIsland);
}

class _LawScreenState extends State<LawScreen> {
  Island myIsland;
  Archipelago myWorld;

  _LawScreenState(this.myWorld, this.myIsland);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CompAppbarWidget(
        myWorld: myWorld,
        myIsland: myIsland,
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
            title: Text(playerIsland.islandLaws[index].name),
            subtitle: Text(playerIsland.islandLaws[index].content),
            trailing: playerIsland.islandLaws[index].isPassed
                ? Text("")
                : Text("${playerIsland.islandLaws[index].price} €"),
            onTap: playerIsland.islandLaws[index].isPassed
                ? null
                : () {
                    setState(() {
                      playerIsland.islandLaws[index].passLaw(playerIsland);
                    });
                    debugPrint("${playerIsland.islandLaws[index].name} tapped !"
                        "Budget restant : $playerIsland.islandBudget");
                  },
          );
        });
    return lawListView;
  }
}
