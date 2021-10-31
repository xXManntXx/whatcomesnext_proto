import 'dart:async';

import 'package:flutter/material.dart';

import 'game_timer_text.dart';
import 'home_screen/island.dart';
import 'mycolor_theme.dart';

class CompleteAppbar extends StatefulWidget {
  CompleteAppbar({ required this.myIsland, Key? key}) : super(key: key);

  Island myIsland;
  @override
  _CompleteAppbarState createState() => _CompleteAppbarState(myIsland);
}

class _CompleteAppbarState extends State<CompleteAppbar> with TickerProviderStateMixin {

  Island myIsland;
  _CompleteAppbarState(this.myIsland);

  //timer variable
  AnimationController? _timerController;
  final gameDuration = 40;
  final archipelagoCounsilDelay = 10;
  var timerText = "Lancer la partie";
  Timer? archipelagoCounsilTimer;

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

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            backgroundColor: MaterialStateProperty.resolveWith(MyColorTheme.getColor),
          ),
          onPressed: _timerController!.isAnimating ? null : timerStart,
          child: Text(timerText),
        ),
      ],
      bottom: PreferredSize(
        child: Text(
          "Budget actuel : ${myIsland.islandBudget} €",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        preferredSize: Size.fromHeight(25.0),
      ),
    );
  }
}
