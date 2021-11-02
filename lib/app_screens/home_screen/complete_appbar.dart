import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatcomesnext_proto/game_classes/archipelago.dart';

import 'game_timer_text.dart';
import '../../game_classes/island.dart';
import '../mycolor_theme.dart';

class CompleteAppbar extends StatefulWidget {
  CompleteAppbar({required this.world, required this.myIsland, Key? key})
      : super(key: key);

  Island myIsland;
  Archipelago world;

  @override
  _CompleteAppbarState createState() => _CompleteAppbarState(world, myIsland);
}

class _CompleteAppbarState extends State<CompleteAppbar>
    with TickerProviderStateMixin {
  _CompleteAppbarState(this.world, this.myIsland);

  Island myIsland;
  Archipelago world;

  //timer variable
  final gameFinalYear = 2060;
  final archipelCounsilDates = [2030, 2040, 2050];
  String startGameButtonText = "Lancer la partie.";
  final turnTime = Duration(seconds: 1);
  bool isGameRunning = false;
  Timer? turnTimer;

  //is executed at the beginning once

  @override
  void initState() {
    //TODO faire que si on construit l'appbar en running time, le timer soit lancé
  }

  //is executed when the object is destroyed. Avoid memory-leek
  @override
  void dispose() {
    turnTimer!.cancel();
    super.dispose();
  }

  //timer functions
  void timerStart() {
    turnTimer = Timer.periodic(turnTime, (Timer t) => majGame());
    setState(() {
      isGameRunning = true;
      startGameButtonText = "Partie en cours.";
    });
  }

  void timerStop() {
    turnTimer!.cancel();
    setState(() {
      isGameRunning = false;
      startGameButtonText = "Lancer la partie.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigoAccent,
      title: GameTimer(
        year: world.year,
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            backgroundColor:
                MaterialStateProperty.resolveWith(MyColorTheme.getColor),
          ),
          onPressed: isGameRunning ? null : timerStart,
          child: Text(startGameButtonText),
        ),
      ],
      bottom: PreferredSize(
        child: Text(
          "Budget actuel : ${myIsland.budget} €",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        preferredSize: Size.fromHeight(25.0),
      ),
    );
  }

  void majGame() {
    debugPrint("Game updated");
    setState(() {
      world.year += 1;
      if(archipelCounsilDates.contains(world.year)){
        //archipelago counsil
        timerStop();
      }
      else if(world.year >= gameFinalYear){
        //endgame
        timerStop();
        setState(() {
          startGameButtonText = "Partie terminée !";
        });
      }
      debugPrint("Année : ${world.year}");
    });
  }
}
