import 'dart:async';
import 'package:flutter/material.dart';

import 'package:whatcomesnext_proto/app_screens/game_timer_text.dart';
import 'package:whatcomesnext_proto/app_screens/home_screen/island.dart';
import 'package:whatcomesnext_proto/app_screens/law_screen/law_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //timer variable
  AnimationController? _timerController;
  final gameDuration = 40;
  final archipelagoCounsilDelay = 10;
  var timerText = "Lancer la partie";
  Timer? archipelagoCounsilTimer;

  //game variable
  var playerIsland = Island.testIsland();

  //is executed at the beginning
  @override
  void initState() {
    super.initState();
    // Modify this value to modify archipelago consil delay
    _timerController = AnimationController(
        vsync: this,
        // Modify this value to modify game duration
        duration: Duration(
          seconds: gameDuration,
        ));
  }

  //is executed when the object is destroyed. Avoid memory-leek
  @override
  void dispose() {
    _timerController!.dispose();
    archipelagoCounsilTimer!.cancel();
    super.dispose();
  }

  //colors
  Color? getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected,
    };
    const Set<MaterialState> inactiveStates = <MaterialState>{
      MaterialState.disabled,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.indigo;
    }
    if (states.any(inactiveStates.contains)) {
      return Colors.indigo[200];
    }
    return Colors.indigoAccent;
  }

  //timer functions
  void timerStart() {
    _timerController!.forward();
    archipelagoCounsilTimer = Timer.periodic(
        Duration(seconds: archipelagoCounsilDelay, milliseconds: 100),
        (Timer t) => timerStop());
    setState(() {
      timerText = "Jeu en cours.";
    });
  }

  void timerStop() {
    _timerController!.stop();
    archipelagoCounsilTimer!.cancel();
    setState(() {
      timerText = "Lancer la partie";
    });
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: GameTimer(
            animation: StepTween(
              begin: 0,
              end: gameDuration,
            ).animate(_timerController!),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
              ),
              onPressed: _timerController!.isAnimating ? null : timerStart,
              child: Text(timerText),
            ),
          ],
          bottom: PreferredSize(
            child: Text(
              "Budget actuel : ${playerIsland.islandBudget} €",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            preferredSize: Size.fromHeight(25.0),
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text("Accéder à mes lois"),
                  onTap: () {
                    navigateToLawScreen(playerIsland);
                  } //TODO naviguate to LawScreen,
                  )
            ],
          ),
        ));
  }

  void navigateToLawScreen(Island myIsland) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LawScreen(playerIsland);
    }));
  }
}
