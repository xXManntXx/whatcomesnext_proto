import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/game_classes/archipelago.dart';

import 'package:whatcomesnext_proto/game_classes/island.dart';
import 'package:whatcomesnext_proto/app_screens/law_screen/law_screen.dart';

import 'complete_appbar_widget.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  CompAppbarWidget? myAppbar;

  //game variable
  var playerIsland = Island.testIsland();
  var world = Archipelago();

  //is executed at the beginning
  @override
  void initState() {
    world.add(playerIsland);
    myAppbar = CompAppbarWidget(myWorld: world, myIsland: playerIsland);
    debugPrint("---ARCHIPELAGO COMPLETED---");
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar,
        body: Center(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text("Accéder à mes lois"),
                  onTap: () {
                    navigateToLawScreen(playerIsland);
                  }
                  )
            ],
          ),
        ));
  }

  void navigateToLawScreen(Island myIsland) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LawScreen(myWorld: world, myIsland: playerIsland,);
    }));
  }
}
