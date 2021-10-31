import 'package:flutter/material.dart';

import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';
import 'package:whatcomesnext_proto/app_screens/law_screen/law_screen.dart';

import '../complete_appbar_widget.dart';

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

  //is executed at the beginning
  @override
  void initState() {
    myAppbar = CompAppbarWidget(myIsland: playerIsland);
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
      return LawScreen(myIsland: playerIsland,myAppBar: myAppbar!,); //TODO conserver la même appBar
    }));
  }
}
