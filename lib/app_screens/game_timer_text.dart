import 'package:flutter/material.dart';

class GameTimer extends AnimatedWidget {
  const GameTimer({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  final Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText = 'Année ${2020+clockTimer.inSeconds}';

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
